require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require 'yaml'
require 'active_support/core_ext/hash'

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end
World do
  AppiumWorld.new
end
$devices = YAML.load(File.open('./lib/config/devices.yaml'))
$emulators = YAML.load(File.open('./lib/config/emulators.yaml'))



