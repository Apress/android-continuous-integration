require './lib/capabilities'
include DesiredCapabilities
Before('@ci_smoke') do
  caps = local_capabilities(app='app-debug.apk',appActivity='com.example.android.contactmanager.ContactManager',
                            appPackage='com.example.android.contactmanager')
  @driver = Appium::Driver.new(caps)
  Appium.promote_appium_methods AppiumWorld
  puts "Execute anything before scenario/test case"
  @driver.start_driver

end
Before('@ci_add_contact') do

  caps = local_capabilities(app='app-debug.apk',appActivity='com.example.android.contactmanager.ContactManager',
                            appPackage='com.example.android.contactmanager')
  @driver= Appium::Driver.new(caps)
  Appium.promote_appium_methods AppiumWorld
  puts "Execute anything before scenario/test case"
  @driver.start_driver
end

Before('@ci_add_contact_sauce') do

  caps = sauce_capabilities(app='http://saucelabs.com/example_files/ContactManager.apk',appActivity='com.example.android.contactmanager.ContactManager',
                            appPackage='com.example.android.contactmanager')

  @driver= Appium::Driver.new(caps)
  Appium.promote_appium_methods AppiumWorld
  puts "Execute anything before scenario/test case"
  @driver.start_driver
end

Before('@non-ci') do

  caps = local_capabilities(app='',appActivity='.Settings',appPackage='com.android.settings')
  @driver = Appium::Driver.new(caps)
  Appium.promote_appium_methods AppiumWorld
  puts "Execute anything before scenario/test case"
  @driver.start_driver
end

After do |scenario|
  if scenario.failed?
    @driver.screenshot("#{scenario.name}_failed.png")
  end
  @driver.driver_quit
  puts "Execute anything after scenario/test case"
end
