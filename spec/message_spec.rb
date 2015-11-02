require 'rails_helper'

describe Message, vcr: true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to =>'15005550001', :from => "15005550006")
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 15005550001 is not a valid phone number."]
  end
end
