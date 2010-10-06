class ElementsController < ApplicationController

  # GET /elements
  # GET /elements.xml
  def index
    @elements = Element.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elements }
    end
  end

  # GET /elements/1
  # GET /elements/1.xml
  def show
    @element = Element.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/new
  # GET /elements/new.xml
  def new
    @element = Element.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id])
  end

  # POST /elements
  # POST /elements.xml
  def create
    @element = Element.new(params[:element])

    respond_to do |format|
      if @element.save
        format.html { redirect_to(@element, :notice => 'Element was successfully created.') }
        format.xml  { render :xml => @element, :status => :created, :location => @element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /elements/1
  # PUT /elements/1.xml
  def update
    @element = Element.find(params[:id])

    respond_to do |format|
      if @element.update_attributes(params[:element])
        format.html { redirect_to(@element, :notice => 'Element was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.xml
  def destroy
    @element = Element.find(params[:id])
    @element.destroy

    respond_to do |format|
      format.html { redirect_to(elements_url) }
      format.xml  { head :ok }
    end
  end
  
  include HTTParty
  # format :json
  # base_uri 'https://impacti-org.socialcast.com'
  # basic_auth 'jonathan@impacti.org', 'impactful'
  
  def listposts
    @auth = {:username => 'jonathan@impacti.org', :password => 'impactful'}
    options = {:basic_auth => @auth }
    @response = HTTParty.get('https://impacti-org.socialcast.com/api/messages.json', options)
    puts "done connecting"
    # @response
  end
  
  def sendposts
    id_list = params[:message_ids]
    @sendlist =  ["NOTHING","REALLY"]
    puts
    puts "@response = " + @response.inspect
    puts "@sendlist = " + @sendlist.inspect
    puts "List IDs  = " + params[:message_ids].inspect
    
    # Notifier.email_digest(@sendlist).deliver
    # @response['messages'].where(['id'] => params[:message_ids])
  end
  
end

# class ConsumeController < ApplicationController
# 
#   include HTTParty
#   format :json
#   base_uri 'impacti-org.socialcast.com'
#   basic_auth 'jonathan@impacti.org', 'impactful'
# 
#   def fetch
#     @response = "hello"
#     response = Consume.get('/api/messages.json')
#         response['messages'].each do |item|
#           puts item['body'][0..11] +" <> "+ item['id'].to_s
#         end
#   end
# end
