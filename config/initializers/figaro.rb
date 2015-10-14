Figaro.require_keys('AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY', 'AWS_S3_BUCKET', 'AWS_REGION')

# storage = Fog::Storage.new(:provider => 'AWS', :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'], :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
