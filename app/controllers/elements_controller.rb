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
  
  def listposts
    @response = HTTParty.get('http://twitter.com/statuses/public_timeline.json')
    # @response
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
