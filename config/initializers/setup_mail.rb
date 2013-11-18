if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app19600374@heroku.com",
    :password       => "ba4o2com",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end