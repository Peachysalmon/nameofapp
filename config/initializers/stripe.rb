if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_sef5fhoxvokVPLnAIZB5hexX',
    secret_key: 'sk_test_0LKSBNJwUEN0BCivS6YexhxT'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
