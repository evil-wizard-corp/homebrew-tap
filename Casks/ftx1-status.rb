cask "ftx1-status" do
  version "0.3.1"
  sha256 "48d42846be822219086ef2d0d38fb3df01661c6b5a8737ab43d8109888e1187d"

  url "https://github.com/evil-wizard-corp/ftx1-status/releases/download/v#{version}/FTX1-Status-#{version}.zip"
  name "FTX1 Status"
  desc "Menu bar diagnostics for Yaesu FTX-1 CAT control and WSJT-X"
  homepage "https://github.com/evil-wizard-corp/ftx1-status"

  depends_on macos: :sonoma

  app "FTX1 Status.app"

  # Not notarized (no paid Apple Developer account), so clear the quarantine flag Gatekeeper would block on.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/FTX1 Status.app"],
        writable_paths: ["FTX1 Status.app"],
        writable_base:  :appdir
  end

  # local.ftx1status is the bundle ID before 0.3.1.
  uninstall quit: [
    "io.github.evil-wizard-corp.ftx1status",
    "local.ftx1status",
  ]

  zap trash: [
    "~/Library/Preferences/io.github.evil-wizard-corp.ftx1status.plist",
    "~/Library/Preferences/local.ftx1status.plist",
  ]
end
