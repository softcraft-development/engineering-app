require "sinatra/base"
require "sidekiq"
require "mail"
require "tilt/haml"

case ENV["RACK_ENV"]
when "development"
  Mail.defaults do
    delivery_method :sendmail
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: "redis://127.0.0.1" }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: "redis://127.0.0.1" }
  end
when "test"
  Mail.defaults do
    delivery_method :test
  end
when "production"

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV["REDIS_URL"] }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV["REDIS_URL"] }
  end

  Mail.defaults do
    delivery_method :smtp, {
      address: "smtp.sendgrid.net",
      port: "587",
      user_name: ENV["SENDGRID_USERNAME"],
      password: ENV["SENDGRID_PASSWORD"],
      authentication: :plain,
      enable_starttls_auto: true
    }
  end
end