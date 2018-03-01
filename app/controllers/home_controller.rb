class HomeController < ApplicationController
  before_filter :authenticate_user!, except:[:index, :intro, :rule, :mail_write]
  def index

  end

  def events
    
    event = Event.create(name: params[:ename], univ: params[:univ], email: params[:email], phone: params[:phone])
    file = params[:pic]
    
    uploader = AvatarUploader.new
    uploader.store!(file)
    event.image_url = uploader.url
    event.save
    
    redirect_to '/home/index'
    
  
  end

  def rule
  end

  def notice
  end

  def community
    @posts = Post.all.reverse
  end
  
  def write
        
  end
  def write_post
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.tname = Faker::Name.name 
    post.save
    
    redirect_to '/home/community'
  end
  def update
    @one_post = Post.find(params[:p_id])
  end
  def update_post
    one_post = Post.find(params[:p_id])
    one_post.title = params[:title]
    one_post.content = params[:content]
    one_post.save
        
    redirect_to '/home/community'
  end
  def destroy
    one_post = Post.find(params[:p_id])
    one_post.destroy
    
    redirect_to '/home/community'
  end
  def show
    @one_post = Post.find(params[:p_id])
    @title=Post.find(params[:p_id]).title
    @content=Post.find(params[:p_id]).content
    @senddate=Post.find(params[:p_id]).created_at.in_time_zone("Asia/Seoul").strftime("%Y-%m-%d %H:%M:%S")
  
  end
  def comment_create
    comment = Post.find(params[:p_id]).comments.create(content: params[:content],  cuser_id: params[:cuser_id])
    comment.save
    
    redirect_to "/show/#{comment.post_id}"
  end
  def comment_destroy
    comment = Post.find(params[:p_id]).comments.find(params[:c_id])
    comment.destroy
    
    redirect_to "/show/#{comment.post_id}"
  end
  def comment_update

    #params 주소로 넘겨온 
    @one_comment = Post.find(params[:p_id]).comments.find(params[:c_id])
  end
  def comment_update_post
    one_comment = Post.find(params[:p_id]).comments.find(params[:c_id])
    one_comment.content = params[:content]
    one_comment.save
    
    redirect_to "/show/#{one_comment.post_id}"
  end
  
  def like_create
    like =  Post.find(params[:p_id]).likes.create(like_count: 0)
    like.save
   
    redirect_to "/show/#{like.post_id}"
  end
  
  def email
    email = Email.create(email: "yurimzzang51@gmail.com", title: params[:title], content: params[:content])
    
    mg_client = Mailgun::Client.new("key-10c7b2f6eddecb0a954d3cece47d2963")
  
    message_params =  {
                       from: 'test@yurimsns.com',
                       to:   email.email,
                       subject: email.title,
                       text:    email.content
                       }
      
    result = mg_client.send_message("sandboxc8d4b3f8c8c144269bd535f1269e3727.mailgun.org", message_params).to_h!
      
    message_id = result['id']
    message = result['message']
    
    redirect_to '/'
  end
  
  def code
    
    @all_users = Event.all
    @all_users_count = Event.all.count
    @id_array = [*1..@all_users_count].sample(13).sort!
    @rest_array = Array.new
    
    # @events = Event.find(@array)
    
  end
end
