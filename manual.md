# Manual configuration

Most of these steps defy automation, though there's always room for additional
plist munging.

## Preflight

- Create an ssh key (`ssh-keygen`) and upload to GitHub
- Open and close System Preferences
- Install Xcode from App Store

## Postflight

- Install iWork from App Store
- Manually adjust System Preferences
  - Setup accounts
    - iCloud: disable Calendar, Reminders, and Back to My Mac
    - Google: enable only Calendar
    - Social: disable Share Menu
  - Choose screensaver
  - Turn on FileVault, Firewall, and Location Services
  - Setup notifications
    - Do Not Disturb only when mirroring
    - Disable everything for all but the following
      - Calendar
      - Facebook
      - FaceTime
      - Messages
      - Skype
      - Slack
      - TickTick
      - Twitter
  - Arrange external display
  - Remap Caps Lock -> CTRL
  - Remove 'omw' text shortcut
  - Set keyboard shortcuts
    - Disable all Launchpad & Dock
    - Enable CTRL-prefixed Mission Control
    - Disable all but next-window focus
    - Disable clipboard Screen Shots
    - Disable all Services
    - Enable all Spotlight
    - Disable all Accessibility
    - Enable all App Shortcuts
  - Verify three-finger swipe between pages on trackpad
  - Setup printers
  - Set computer name and turn off sharing
  - Set network interface service order
  - Turn off most extensions then manually alphabetize remainder
  - Turn off parental controls for guests
  - Enable automatic update installation and loosen password requirements
  - Disable dictation keyboard shortcut
- Setup Notification Center
  - Today
  - Calendar
  - World Clock
  - Weather
- Adjust Finder sidebar
- Set time zones in Calendar
- Configure installed casks (and record change to defaults)
