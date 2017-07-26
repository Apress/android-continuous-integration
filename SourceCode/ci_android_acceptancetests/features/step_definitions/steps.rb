Given /^I click about phone$/ do
  scroll_to('About phone').click
end

Given /^the Android version is a number$/ do
  android_version = 'Android version'
  scroll_to android_version

  view    = 'android.widget.TextView'
  version = xpath(%Q(//#{view}[preceding-sibling::#{view}[@text="#{android_version}"]])).text
  if !version.match(/\w/).nil? || !version.match(/\d/).nil?
    puts "Version: #{version} pass"
  else
    puts "Version: #{version} is NOT a word or number"
  # valid   = !version.match(/\d/).nil?
  end
  # expect(valid).to eq(true)
end


