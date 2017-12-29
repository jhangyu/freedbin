require 'test_helper'

class TwitterFeedRefresherTest < ActiveSupport::TestCase

  setup do
    @user = users(:ben)
    @feed = @user.feeds.first
    @keys = {"twitter_access_token" => "token", "twitter_access_secret" => "secret"}
    @feed.update(feed_type: :twitter)
    @user.update(@keys)
  end

  test "feed gets scheduled" do
    Sidekiq::Worker.clear_all
    assert_difference "TwitterFeedRefresher.jobs.size", +1 do
      TwitterFeedRefresher.new().perform
    end

    args = [@feed.id, @feed.feed_url, [@keys]]
    assert_equal args, Sidekiq::Queues["feed_refresher_fetcher"].first["args"]
  end

end