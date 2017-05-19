require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_key_id'], # Access Key Id
      aws_secret_access_key: ENV['S3_key_secret'], # Secret Access Key
      region:                'ap-northeast-1'
    }
    config.fog_directory  = 'j-and-a-select-bucket' # bucket name
  end
end
