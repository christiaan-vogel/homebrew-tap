# Bezalel Software — Homebrew tap

```sh
brew tap christiaan-vogel/tap
brew install --cask surveyor
```

## Surveyor

A network scanner for macOS. Sweeps the subnet you are on, names what it
finds, checks it for exposed services, and tells you what has changed since
your last visit. Requires macOS 15 (Sequoia) or later; runs natively on both
Apple Silicon and Intel.

Updates come through Homebrew like anything else:

```sh
brew upgrade --cask surveyor
```

### The first launch will be blocked

Surveyor is signed, but it is **not notarised by Apple**. Notarising requires
a paid Apple Developer account. macOS blocks anything it has not seen
notarised, and Homebrew quarantines every download, so the first launch fails
with *"Apple could not verify Surveyor is free of malware"*.

Once, after which it behaves like any other app:

1. Open Surveyor from Applications, and click **Done** on the warning.
2. Open **System Settings → Privacy & Security**.
3. Scroll to Security. There is a line saying Surveyor was blocked, with an
   **Open Anyway** button beside it. Click that and authenticate.

Or the same thing in one line:

```sh
xattr -dr com.apple.quarantine /Applications/Surveyor.app
```

This is also why Surveyor is not in the official `homebrew/cask` tap: since
2026-09-01 that tap disables casks that fail Gatekeeper, and Homebrew 7 has
removed `--no-quarantine` entirely. Personal taps are exempt, which is what
this is.

### Permissions it asks for

**Local Network** — required. It is how Surveyor sees anything at all;
decline it and every scan comes back empty.

**Location** — optional, and not really about location. macOS classifies
Wi-Fi network names as location data, so this is only what lets the Wi-Fi
analyser name the networks around you. Nothing about your position is read
or stored.

### Removing it

```sh
brew uninstall --cask surveyor          # the app
brew uninstall --zap --cask surveyor    # the app and its scan history
```

---

Christiaan Vogel t/a Bezalel Software · [bezalelsoftware.co.za](https://bezalelsoftware.co.za)
