uri = URI.parse(ENV["REDIS_URL"] || 'redis://localhost:6379')
$redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
$redis.select(ENV["REDIS_DATABASE"] || 0).to_i
