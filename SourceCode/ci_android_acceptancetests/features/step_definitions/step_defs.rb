Given(/^I open login screen on app$/) do
  add_contact = id('com.example.android.contactmanager:id/addContactButton')
  exists(post_check=30) { add_contact.text == 'Add Contact' } ? puts('Add Contact exists') : puts('App failed to open')
end

And(/^I click add contact$/) do
  id('com.example.android.contactmanager:id/addContactButton').click
end

Then(/^I verify contact screen is displayed$/) do
  expect(id('android:id/text1').text).to eql("seleniumfrmwrkguest@gmail.com")
end
Then(/^I successfully add a contact$/) do
  id('com.example.android.contactmanager:id/contactNameEditText').type "blah"
  id('com.example.android.contactmanager:id/contactPhoneEditText').type "123-456-7890"
  id('com.example.android.contactmanager:id/contactPhoneTypeSpinner').click
  tags('android.widget.CheckedTextView')[2].click
  id('com.example.android.contactmanager:id/contactEmailEditText').type "pradeep@seleniumframework.com"
  id('com.example.android.contactmanager:id/contactSaveButton').click
end

And(/^verify that it was added$/) do
  expect(id('com.example.android.contactmanager:id/contactEntryText').text).to eql('blah')
end

Then(/^take screenshot of contact form$/) do
  @driver.screenshot("contact_screen.png")
end