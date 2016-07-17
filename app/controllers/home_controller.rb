require 'mailgun'
class HomeController < ApplicationController
  
  
  
  
  def current
     @encode_name2="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=09140550"
     @html2 = Nokogiri::HTML(Net::HTTP.get(URI(@encode_name2)))
     CurrentWeather.create(day: @html2.css("ul//li:nth-child(1)//.fl//em//strong").inner_text,
                          temperture: @html2.css("ul//li:nth-child(1)//.fl//em").inner_text)
  
     @currentWeather = CurrentWeather.last
     
     @encode_name3 = "https://search.naver.com/search.naver?where=nexearch&query=%EC%87%BC%EB%AF%B8%EB%8D%94%EB%A8%B8%EB%8B%885&sm=top_hty&fbm=1&ie=utf8"
     @html3 = Nokogiri::HTML(Net::HTTP.get(URI(@encode_name3)))
     @html3.css("#gnb")
    
    
  end
  
  def weather
    
   
  
  end
  
  def index
    
    
    
    
    #weather
     
    @weathers = Weather.all
    @degree = Array.new
    # @weathers.each do |ws| 
    # @degree << ws.temperture
    # end
    @morning = Weather.find(1)
    @afternoon = Weather.find(2)
    
    
    #weather 끝
    
    @comment = Comment.find(1).sunny
    
    if Weather.find(1).temperture >= 30
      @comment = Comment.find(1).veryHot
    elsif Weather.find(1).raining >= 80
      @comment = Comment.find(1).rainy
    elsif Weather.find(1).day == '맑음'
      @comment = Comment.find(1).sun
    end
    
  end
  
  def repost
    @posts=Post.all.reverse
  end

  def write
    post=Post.new
    post.title=params[:title]
    post.content=params[:content]
    post.save
    
    if post.save
        redirect_to "/home/repost"
    else
      render :text => post.errors.messages[:title].first
    end
      
  end
  
  def reply_write
    reply=Reply.new
    reply.content=params[:xylitol]
    reply.post_id=params[:id_of_post]
    reply.save
    
    redirect_to "/home/repost"
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to '/home/repost'
  end
  
  def update_view
    @post = Post.find(params[:post_id])
    
  end
  
  def real
      @post = Post.find(params[:post_id])
      @post.title = params[:title]
      @post.content = params[:content]
      @post.save
      redirect_to '/home/repost'    
  end
  
  
  def complete
        @almond = params[:emailadd]
        @bangarang = params[:emailtitle]
        @anchovy = params[:emailcontent]
        
        new_posts = Post.new
        new_posts.email = @almond
        new_posts.emailtitle = @bangarang
        new_posts.emailcontent = @anchovy
        new_posts.save
        
                    # First, instantiate the Mailgun Client with your API key
            mg_client = Mailgun::Client.new("key-032563be0cea3c9af52e30e383e2596b")
            
            # Define your message parameters
            message_params = {  from: @almond,
                                to: 'zeni9@naver.com',
                                subject: @bangarang,
                                text: @anchovy
                              }
            
            result = mg_client.send_message('sandbox649391cda02140bca82bd51856e2ef4e.mailgun.org', message_params).to_h!

            message_id = result['id']
            message = result['message']
            
            redirect_to '/home/contact'
            
  end
    
  def upload
    file = params[:pic]
    
    uploader = ChocoUploader.new
    uploader.store!(file)
    
    redirect_to "/home/repost"
  end

  

end
