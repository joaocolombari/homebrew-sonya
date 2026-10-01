# Homebrew tap for Sonya/JAES

Private laboratory tap for the Sonya circuit-optimization application. Access to
both this repository and `joaocolombari/Sonya` is required.

Authenticate Git with GitHub, then install on macOS or Linux:

```bash
brew tap joaocolombari/sonya https://github.com/joaocolombari/homebrew-sonya.git
brew install joaocolombari/sonya/sonya
sonya install doctor
```

On macOS, install the reference simulator with
`brew install --cask ltspice`. On Linux, the formula installs ngspice.

The licensed musical corpus is not distributed by this tap. The full diagnostic
reports its expected location and distinguishes package, electrical-core and
perceptual readiness.
