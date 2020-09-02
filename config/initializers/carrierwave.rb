CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'

  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key => ENV['AWS_SECRET_KEY'],
    :region => ENV['SPACE_REGION'],
    :endpoint => ENV['SPACE_ENDPOINT']
  }

  config.fog_directory = ENV['SPACE_NAME']
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
  config.fog_public = false
  config.asset_host = ENV['SPACE_HOST']
end

