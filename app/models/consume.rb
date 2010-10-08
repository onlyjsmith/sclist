class Consume
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :content, :made_up

  def get_data
    @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    options = {:basic_auth => @auth}
    @content = HTTParty.get('https://impacti-org.socialcast.com/api/messages.json', options)
    puts "Done connecting"
  end
  

end