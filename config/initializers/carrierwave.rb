 # config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.

CarrierWave.configure do |config|
  
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end
  # Use AWS storage if in production
  if Rails.env.production? || Rails.env.staging?
    CarrierWave.configure do |config|
      config.storage = :aws
      config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
      config.aws_acl = 'public-read'
      config.aws_credentials = {
        :access_key_id      => ENV.fetch('AWS_ACCESS_KEY_ID'),            
        :secret_access_key  => ENV.fetch('AWS_SECRET_ACCESS_KEY'),
        :region             => ENV.fetch('AWS_REGION')

      }
    end
  end
end
