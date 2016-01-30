# Opsworksのprecompile時に、.ymlファイルが存在しないためconfig/initializersで実行し、```rescue {}```しておく
redis_config = YAML.load_file(Rails.root.join('config/redis.yml'))[Rails.env].symbolize_keys rescue {}

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis_config[:host] || 'localhost'}:#{redis_config[:port] || 6379}/#{redis_config[:db]}"}
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{redis_config[:host] || 'localhost'}:#{redis_config[:port] || 6379}/#{redis_config[:db]}"}
end
