class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.request_approval.subject
  #
  def request_approval(booking)
    @booking = booking

     mail(to: @booking.event.host.email, subject: "You've got a approval request")
  end
end
