class Consume
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :messages, :users, :groups

  def auth
    #TODO: check this uses variables correctly
    @root_url = "impacti-org"
    @auth = {:username => "jonathan@impacti.org", :password => 'impactful'}
    @options = {:basic_auth => @auth}
  end
  
  def auth2
    @root_url = "unep--wcmc-org"
    @auth = {:username => "jonathan.smith@unep-wcmc.org", :password => 'whocar22'}
    @options = {:basic_auth => @auth}
  end


  def get_messages
    auth2
    recentness = (Time.now - 720000).to_i
    address = "https://#{@root_url}.socialcast.com/api/messages.json" #?since=#{recentness}"
    @messages = HTTParty.get(address, @options)
  end
  
  def get_users
    auth2 unless @options
    # @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    # options = {:basic_auth => @auth}
    address = "https://#{@root_url}.socialcast.com/api/users.json"
    @users = HTTParty.get(address, @options)
  end
  
  def get_groups
    auth2 unless @options
    # @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    # options = {:basic_auth => @auth}
    address = "https://#{@root_url}.socialcast.com/api/group_memberships.json"
    @groups = HTTParty.get(address, @options)
  end
  

end