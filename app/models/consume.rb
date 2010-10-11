class Consume
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :messages, :users

  def get_messages
    @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    options = {:basic_auth => @auth}
    recentness = (Time.now - 720000).to_i
    address = "https://impacti-org.socialcast.com/api/messages.json?since=#{recentness}"
    @messages = HTTParty.get(address, options)
    puts "Done connecting"
  end
  
  def get_users
    @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    options = {:basic_auth => @auth}
    address = "https://impacti-org.socialcast.com/api/users.json"
    @users = HTTParty.get(address, options)
    puts "Done connecting"
  end
  

end