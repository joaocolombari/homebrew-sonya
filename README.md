# Homebrew tap for Sonya/JAES

Private laboratory tap for the Sonya circuit-optimization application. The tap
contains an immutable, reduced source archive for each published release so the
Homebrew build sandbox never needs a second private GitHub authentication.

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
