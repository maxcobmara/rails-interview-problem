# == Schema Information
#
# Table name: feed_entries
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  summary      :text
#  url          :string(255)
#  published_at :datetime
#  guid         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed.entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :name =>          entry.title,
          :summary =>       entry.content,
          :url  =>          entry.url,
          :published_at =>  entry.published,
          :guid =>          entry.id
          )
      end
    end
  end
end
