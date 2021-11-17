class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
      # @feeds = @user.feeds.paginate(page: params[:page], per_page: 5)
    
    end

    def search
      puts params[:search]
      @user = User.search(params[:search])
     end
     
   
    
    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "Your account information was successfully updated"
        redirect_to @user
      else
        render 'edit'
      end
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Welcome to Twitter! #{@user.username}, you have successfully signed up"
        redirect_to feeds_path
      else
        render 'new'
      end
    end
  
    private
    def user_params
      params.require(:user).permit(:username, :email, :password,:search)
    end
    
  end