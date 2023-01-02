# A Brewfile to rule the installations. Always run without upgrades
#
# brew bundle --no-upgrade --verbose

cask "iterm2"
brew "zsh"
brew "wget"
brew "watch"
brew "jq"
brew "htop"

# For some reason, this is not working for M1
# brew "daviderestivo/emacs-head/emacs-head@28",
#      args: ["with-cocoa", "with-native-comp", "with-native-full-aot"]
tap "daviderestivo/emacs-head"
brew "daviderestivo/emacs-head/emacs-head@28", args: ["with-cocoa"]

brew "postgresql"
brew "postgis"
brew "mysql"
brew "zstd"                     # for mysql gem
brew "redis"
brew "elixir"
brew "ffmpeg"
brew "sqlite"

# Infra
brew "openvpn"
tap "heroku/brew"
brew "heroku"
brew "kubectl"
brew "helm"
brew "terraform"
brew "go"

# AWS
brew "awscli"
tap "aws/tap"
brew "xray-daemon"
