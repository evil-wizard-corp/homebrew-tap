cask "ftx1-status" do
  version "0.1.0"
  sha256 "1540fe6f661cc1835f0a7ae6acbccee5872d1bedd24e7cb90b495122c2a173db"

  url "https://github.com/evil-wizard-corp/ftx1-status/releases/download/v#{version}/FTX1-Status-#{version}.zip"
  name "FTX1 Status"
  desc "Menu bar diagnostics for Yaesu FTX-1 CAT control and WSJT-X"
  homepage "https://github.com/evil-wizard-corp/ftx1-status"

  depends_on macos: ">= :sonoma"

  app "FTX1 Status.app"

  # Not notarized (no paid Apple Developer account), so clear the quarantine flag Gatekeeper would block on.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FTX1 Status.app"]
  end

  uninstall quit: "local.ftx1status"

  zap trash: "~/Library/Preferences/local.ftx1status.plist"
end
