# Usage
# gem install tweetstream
# CONSUMER_KEY= CONSUMER_SECRET= OAUTH_TOKEN= OAUTH_SECRET= ruby vocalonobis_watcher.rb

require 'tweetstream'

class String
  def includesKoeUrl?
    return self.include? 'koe-koe.com'
  end
end

def yui_check(n)
  result = `python3 #{ENV['YUI_CHECK']} #{n}`
  result.chomp
end

def new_check(n)
  check = true

  File.open(ENV['POST_LIST'], 'r').each do |content|
    check = false if content.chomp == n
  end

  check
end

TweetStream.configure do |config|
  config.consumer_key       = ENV['CONSUMER_KEY']
  config.consumer_secret    = ENV['CONSUMER_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_SECRET']
  config.auth_method        = :oauth
end

TweetStream::Client.new.userstream do |status|
  # p status.uris.map(&:expanded_url)

  url = status
  .uris
  .map(&:expanded_url)
  .map(&:to_s)
  .select(&:includesKoeUrl?)
  .first
  .to_s

  return if url.empty?

  num = url.scan(/[0-9]+/)[0]
  flag = yui_check(num)
  # `echo #{flag} > /home/yyy/testflag`
  if flag == "True" && new_check(num)
    # `echo #{num} > /home/yyy/testnum`
    `python3 #{ENV['INSERT_PRODUCTION_DATA']} #{num}`
  end
end
