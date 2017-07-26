require 'rubygems'
require 'test/unit'
require 'appium_lib'

class SettingsTest < Test::Unit::TestCase
  puts Dir.pwd
  def setup
    caps   = { caps:       { platformName: 'Android',
                             deviceName: 'lge-nexus_4-006ea820a10e1282',
                             app:'../features/support/app-debug.apk',
                             appActivity: 'com.inmar.android.app.hopster.ui.LoginActivity',
                             appPackage: 'com.inmar.android.app.hopster' },
               appium_lib: { sauce_username: nil,
                             sauce_access_key: nil } }
    driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    driver.start_driver.manage.timeouts.implicit_wait = 20 # seconds
  end

  def teardown
    driver_quit
  end

  def test_about_phone_version
    # This may be 'About phone' or 'About tablet'
    # search for About to work on both phones & tablets.
    scroll_to('About ').click
    android_version = 'Android version'
    scroll_to android_version

    view    = 'android.widget.TextView'
    version = xpath(%Q(//#{view}[preceding-sibling::#{view}[@text="#{android_version}"]])).text
    valid   = !version.match(/\d/).nil?

    puts "Version is: #{version}"
    assert_equal true, valid
  end
end
