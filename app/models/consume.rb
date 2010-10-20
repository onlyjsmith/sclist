class Consume
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :messages, :users, :groups

  def get_messages
    @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    options = {:basic_auth => @auth}
    recentness = (Time.now - 720000).to_i
    address = "https://impacti-org.socialcast.com/api/messages.json" #?since=#{recentness}"
    @messages = HTTParty.get(address, options)
  end
  
  def get_users
    @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    options = {:basic_auth => @auth}
    address = "https://impacti-org.socialcast.com/api/users.json"
    @users = HTTParty.get(address, options)
  end
  
  def get_groups
    @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    options = {:basic_auth => @auth}
    address = "https://impacti-org.socialcast.com/api/group_memberships.json"
    @groups = HTTParty.get(address, options)
  end
  

end