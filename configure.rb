def my_twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'd5BCJNg4gzWDnInk0R2luEjdm'
    config.consumer_secret     = 'NHKDHRKuSgHvf7wyFCgaoVlVSZELfm3hknx6H7eRraYiFDfZGi'
    config.access_token        = '2817060128-Il4jxkiRhtdbBwK0Z4tTR5kBKpXnPhbW00tO5cY'
    config.access_token_secret = 'kwu7Q328HVhCmSthkGFOWV1I0bpwFWMDVDKS9tgxgjr64'
  end
end
