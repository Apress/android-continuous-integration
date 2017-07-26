module DesiredCapabilities

  def local_capabilities(app={},appActivity={},appPackage={})

    if ENV['DEVICE'].nil? and ENV['EMULATOR'].nil?
      puts "One of the targets DEVICE or EMULATOR has to be set"
      puts "Allowed devices: #{$devices['devices'].keys}"
      puts "Allowed emulators: #{$emulators['emulators'].keys}"
      exit
    end

    if ENV['DEVICE'].nil? || ENV['DEVICE'].empty?
      puts "Did not specify device target. Assuming emulator is set"
      caps = $emulators['emulators']["#{ENV['EMULATOR']}"]
      if app.nil? || app.empty?
        caps['caps'] = caps['caps'].except('app')
      else
        caps['caps']['app'] = File.join(Dir.pwd,"features/support/resources", app)
      end
      caps['caps']['appActivity'] = appActivity
      caps['caps']['appPackage'] = appPackage
    end

    if ENV['EMULATOR'].nil? || ENV['EMULATOR'].empty?
      puts "Did not specify emulator target. Assuming device is set"
      caps = $devices['devices']["#{ENV['DEVICE']}"]
      if app.nil? || app.empty?
        caps['caps'] = caps['caps'].except('app')
      else
        # caps['caps']['app'] = File.join(Dir.pwd,"features/support/resources", app)
        caps['caps']['app'] = app
      end
      caps['caps']['appActivity'] = appActivity
      caps['caps']['appPackage'] = appPackage
    end
    caps
  end

  def sauce_capabilities(app={},appActivity={},appPackage={})

    if ENV['DEVICE'].nil? and ENV['EMULATOR'].nil?
      puts "One of the targets DEVICE or EMULATOR has to be set"
      puts "Allowed devices: #{$devices['devices'].keys}"
      puts "Allowed emulators: #{$emulators['emulators'].keys}"
      exit
    end

    if ENV['DEVICE'].nil? || ENV['DEVICE'].empty?
      puts "Did not specify device target. Assuming emulator is set"
      caps = $emulators['emulators']["#{ENV['EMULATOR']}"]
      if app.nil? || app.empty?
        caps['caps'] = caps['caps'].except('app')
      else
        caps['caps']['app'] = app
      end
      caps['caps']['appActivity'] = appActivity
      caps['caps']['appPackage'] = appPackage
    end

    if ENV['EMULATOR'].nil? || ENV['EMULATOR'].empty?
      puts "Did not specify emulator target. Assuming device is set"
      caps = $devices['devices']["#{ENV['DEVICE']}"]
      if app.nil? || app.empty?
        caps['caps'] = caps['caps'].except('app')
      else
        caps['caps']['app'] = app
      end
      caps['caps']['appActivity'] = appActivity
      caps['caps']['appPackage'] = appPackage
    end
    caps
  end
end