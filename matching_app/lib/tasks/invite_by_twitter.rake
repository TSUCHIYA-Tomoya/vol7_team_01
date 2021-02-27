require 'twitter'
namespace :invite_by_twitter do
  client=Twitter::REST::Client.new(
    consumer_key: Rails.application.credentials.twitter[:api_key],
    consumer_secret: Rails.application.credentials.twitter[:api_key_secret],
    access_token: Rails.application.credentials.twitter[:access_token],
    access_token_secret: Rails.application.credentials.twitter[:access_token_secret],
  )
  task :reply do
    puts "何人の人を招待しますか？"
    num=gets.chomp.to_i
    puts "どんなハッシュタグを付けた人たちを招待したいですか？"
    hash_tags=gets.chomp
    puts "挨拶の言葉を書いてください"
    greeding=gets.chomp
    client.search("#{hash_tags}", lang: "ja").take(num).collect do |tweet|
      client.update("@#{tweet.user.screen_name}\n#{greeding}", {:in_reply_to_status_id => tweet.id})
    end
  end
end
