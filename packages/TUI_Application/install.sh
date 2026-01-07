#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
gem install tty-screen tty-cursor tty-prompt tty-logger tty-table tty-markdown pastel json

echo "Cloning PVN..."
git clone https://github.com/LordAxi/PandaVariableNotation.git
cd PandaVariableNotation/packages/ruby/gem/PVN

echo "Building PVN gem..."
gem build PVN.gemspec
gem install PVN-*.gem

echo "Starting TUI..."
cd ../../../TUI_Application
ruby PVN.rb
