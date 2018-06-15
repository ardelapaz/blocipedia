Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key      => ENV['SECRET_KEY']
  }
  puts "key in initializer: #{ Rails.configuration.stripe[:publishable_key] }"
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
  puts ENV['SECRET_KEY']
