#Since we're using heroku as the 'production' app the simplest way would be to invoke the heroku scheduler.
#If on own production server I would have used the whenever gem and set a cronjob

desc "Update RSS feed"
task :update_feed => :environment do
  FeedEntry.update_from_feed("http://feeds.wired.com/wired/index")
end