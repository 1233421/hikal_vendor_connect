class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default from: "admin@gmail.com"
  
  def welcome_reset_password_instructions user
    @user = user
    create_reset_password_token(user)
		mail(from: "admin@gmail.com", to: user.email, subject: 'Welcome to the Hikal')
  end
  
  private
  def create_reset_password_token(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    @token = raw
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
  end
end