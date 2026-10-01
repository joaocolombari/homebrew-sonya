# Homebrew tap for Sonya/JAES

Public distribution tap for the Sonya circuit-optimization application. The tap
contains an immutable, reduced source archive for each published release so the
Homebrew build sandbox never needs a second private GitHub authentication.

Install on macOS or Linux without access to the private development repository:

```bash
brew tap joaocolombari/sonya
brew install joaocolombari/sonya/sonya
sonya install doctor
```

On macOS, install the reference simulator with
`brew install --cask ltspice`. On Linux, the formula installs ngspice.

The licensed musical corpus is not distributed by this tap. The full diagnostic
reports its expected location and distinguishes package, electrical-core and
perceptual readiness.
