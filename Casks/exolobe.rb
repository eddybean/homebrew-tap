cask "exolobe" do
  version "0.3.3"
  sha256 "f6f74d557fb80aea6d6670e9505b3fa9e4cd0cd6ae5c67d9c7e983398b7fe3e5"

  url "https://github.com/eddybean/exolobe/releases/download/v#{version}/exolobe-#{version}-arm64.dmg"
  name "Exolobe"
  desc "Records, transcribes and summarises online meetings entirely on-device"
  homepage "https://github.com/eddybean/exolobe"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Exolobe.app"

  # The app is ad-hoc signed (no Apple Developer ID), so Gatekeeper would refuse
  # to open it while the quarantine attribute set on download is present.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Exolobe.app"]
  end

  # Recordings live in the folder chosen in the app's settings and are never removed here.
  zap trash: [
    "~/Library/Application Support/Exolobe",
    "~/Library/Caches/io.github.eddybean.exolobe",
    "~/Library/Caches/io.github.eddybean.exolobe.ShipIt",
    "~/Library/HTTPStorages/io.github.eddybean.exolobe",
    "~/Library/Logs/Exolobe",
    "~/Library/Preferences/io.github.eddybean.exolobe.plist",
    "~/Library/Saved Application State/io.github.eddybean.exolobe.savedState",
  ]

  caveats <<~EOS
    Exolobe is ad-hoc signed rather than notarised by Apple. This cask removes the
    quarantine attribute after installation so that the app can be opened.
  EOS
end
