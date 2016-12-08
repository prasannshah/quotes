$redis = Redis::Namespace.new("quotes", :redis => Redis.new)
