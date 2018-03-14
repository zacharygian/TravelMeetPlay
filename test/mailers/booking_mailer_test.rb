require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test "request_approval" do
    mail = BookingMailer.request_approval
    assert_equal "Request approval", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
