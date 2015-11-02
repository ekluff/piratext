require 'spec_helper'

describe Message, vcr: true do
  it "doesn't save the message if Twilio returns an error" do
    message = Message.new(body: "yolo", to: "555555", from: "(503) 850-0995")
    expect(message.save).to be_falsey
  end

  it "adds an error if the number is invalid" do
    message = Message.new(body: 'yolo', to: '5555555', from: '(503) 850-0995')
    message.save
    expect(message.errors[:base]).to eq ["The 'To' number 5555555 is not a valid phone number."]
  end
end
