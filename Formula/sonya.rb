# frozen_string_literal: true

# Private laboratory distribution of the Sonya/JAES application.
class Sonya < Formula
  desc "Local multiobjective valve-amplifier optimization and validation"
  homepage "https://github.com/joaocolombari/Sonya"
  url "https://github.com/joaocolombari/Sonya.git", tag: "v0.1.0", using: :git
  version "0.1.0"

  depends_on "uv" => :build
  depends_on "ffmpeg"
  depends_on "python@3.14"

  on_linux do
    depends_on "ngspice"
  end

  def install
    pkgshare.install "Circuits", "ModelsLTspice", "ops", "python"

    ENV["UV_PROJECT_ENVIRONMENT"] = libexec
    system "uv", "sync",
           "--frozen", "--no-dev", "--project", pkgshare/"python"

    (var/"sonya/corpus").mkpath
    (var/"sonya/gui-jobs").mkpath
    (bin/"sonya").write_env_script libexec/"bin/sonya",
                                   SONYA_CONFIG:      pkgshare/"python/configs/legacy.yaml",
                                   SONYA_PROGRAMME:   pkgshare/"python/configs/programme.yaml",
                                   SONYA_CORPUS_ROOT: var/"sonya/corpus",
                                   SONYA_STATE_ROOT:  var/"sonya/gui-jobs"
  end

  # Print a complete inventory after installation, outside the build sandbox.
  # Only the package is mandatory; the other scopes remain visible separately.
  post_install_steps do
    run "sonya", args: ["install", "doctor", "--strict", "package"], base: :bin, print_stdout: true
  end

  service do
    run [opt_bin/"sonya", "gui", "--host", "127.0.0.1", "--port", "8765", "--no-open"]
    keep_alive true
    working_dir var/"sonya"
    log_path var/"log/sonya-gui.log"
    error_log_path var/"log/sonya-gui.log"
  end

  def caveats
    notes = <<~EOS
      Verifique a instalação completa com:
        sonya install doctor

      Inicie a interface agora com:
        sonya gui
      ou como serviço persistente:
        brew services start sonya

      O corpus musical licenciado não é distribuído pelo tap. Instale os
      arquivos em #{var}/sonya/corpus e repita o diagnóstico.
    EOS
    notes += if OS.mac?
      <<~EOS

        O LTspice é o backend esperado no macOS. Se necessário:
          brew install --cask ltspice
      EOS
    else
      <<~EOS

        O ngspice foi instalado como dependência. Em Ubuntu/Debian x86-64,
        ViSQOL/GstPEAQ podem ser instalados com:
          sudo #{opt_pkgshare}/ops/install-perceptual-ubuntu.sh
      EOS
    end
    notes
  end

  test do
    assert_match '"package": true', shell_output("#{bin}/sonya install doctor --strict package")
  end
end
