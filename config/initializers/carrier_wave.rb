if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AKIAINYHAN5RA3ZBAL2Q'], # Access Key Id
      aws_secret_access_key: ENV['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'], # Secret Access Key
      region:                'ap-northeast-1'
    }
    config.fog_directory  = 'j-and-a-select-bucket' # bucket name
  end
else
  CarrierWave.configure do |config|
    config.storage :file
  end
end
