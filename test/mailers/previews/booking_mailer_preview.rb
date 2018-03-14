# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/request_approval
  def request_approval(booking)
    BookingMailer.request_approval(@booking).deliver_now
    redirect_to dashboard_path
  end

end
