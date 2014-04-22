# require 'spec_helper'

# feature 'user can navigate to new message form', :vcr => true do
#   scenario 'user visits homepage and clicks new message button' do
#     visit root_path
#     click_on "New Message"
#     page.should have_content "To"
#   end

#   scenario 'user navigates straight to form with url' do
#     visit new_message_path
#     page.should have_content "To"
#   end

# end

# feature 'user creates (and sends) a new message', :vcr => true do
#   scenario 'user enters an invalid :to number' do
#     visit new_message_path
#     fill_in "To", :with => "5005550001" #bad :to number from Twilio
#     fill_in "From", :with => "5005550006" #good :from number from Twilio
#     fill_in "Body", :with => "hello"
#     click_on "Create Message"
#     page.should have_content "The 'To' number 5005550001 is not a valid phone number"
#   end

#   scenario 'user enters an invalid :from number' do
#     visit new_message_path
#     fill_in "To", :with => "9852369794" #regular valid phone number (google voice)
#     fill_in "From", :with => "5005550001" #bad :from number from Twilio
#     fill_in "Body", :with => "hello"
#     click_on "Create Message"
#     page.should have_content "The 'From' number 5005550001 is not a valid phone number"
#   end

#   scenario 'user leaves the :to field blank' do
#     visit new_message_path
#     fill_in "From", :with => "5005550006" #good :from number from Twilio
#     fill_in "Body", :with => "hello"
#     click_on "Create Message"
#     page.should have_content "To can't be blank"
#   end

#   scenario 'user leaves the :from field blank' do
#     visit new_message_path
#     fill_in "To", :with => "9852369794" #regular valid phone number
#     fill_in "Body", :with => "hello"
#     click_on "Create Message"
#     page.should have_content "From can't be blank"
#   end

#   scenario 'user leaves the :body field blank' do
#     visit new_message_path
#     fill_in "To", :with => "9852369794" #regular valid phone number
#     fill_in "From", :with => "5005550006" #good :from number from Twilio
#     click_on "Create Message"
#     page.should have_content "Body can't be blank"
#   end

#   scenario 'user enters all three fields correctly' do
#     visit new_message_path
#     fill_in "To", :with => "9852369794" #regular valid phone number
#     fill_in "From", :with => "5005550006" #good :from number from Twilio
#     fill_in "Body", :with => "hello"
#     click_on "Create Message"
#     page.should have_content "Your message was sent!"
#   end

# end
