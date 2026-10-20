cask "surveyor" do
  version "0.5.0"
  sha256 "0c0f9e6919732d0f2edcf6c54c1249507c8679ecf15158f9773e5bdafbb6698e"

  url "https://github.com/christiaan-vogel/homebrew-tap/releases/download/v#{version}/Surveyor-#{version}.dmg"
  name "Surveyor"
  desc "Network scanner that reports what changed since your last visit"
  homepage "https://bezalelsoftware.co.za"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Local Network privacy arrived in macOS 15, and the app is built against
  # it rather than carrying a second code path for older systems.
  depends_on macos: :sequoia

  app "Surveyor.app"

  caveats <<~EOS
    Surveyor is signed but not notarised by Apple, so macOS will block the
    first launch. That is expected and is not a sign anything is wrong —
    Homebrew quarantines every download and Gatekeeper refuses anything it
    has not seen notarised.

    To open it, once:

      1. Open Surveyor from Applications, and click Done on the warning.
      2. Open System Settings, then Privacy & Security.
      3. Scroll to Security. There is a line saying Surveyor was blocked,
         with an "Open Anyway" button beside it. Click that and authenticate.

    Or the same thing in one line:

      xattr -dr com.apple.quarantine /Applications/Surveyor.app

    On first run it asks for Local Network access. Say yes, or every scan
    comes back empty. It also asks for Location, which is optional: macOS
    counts Wi-Fi network names as location data, so that permission only
    lets the Wi-Fi analyser name the networks around you.
  EOS

  zap trash: [
    "~/Library/Application Support/za.co.bezalelsoftware.surveyor",
    "~/Library/Caches/za.co.bezalelsoftware.surveyor",
    "~/Library/Containers/za.co.bezalelsoftware.surveyor.widget",
    "~/Library/Group Containers/group.za.co.bezalelsoftware.surveyor",
    "~/Library/Preferences/za.co.bezalelsoftware.surveyor.plist",
  ]
end
