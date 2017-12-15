class UsersController < ApplicationController
  def index
  end
  def create
      @thisuser = User.new(user_params)
      if @thisuser.save
          session[:user_id] = @thisuser.id
          redirect_to "/songs"
      else
          flash[:errors] = @thisuser.errors.full_messages
          redirect_to ('/')
      end
  end
  def show
     @songs = Song.all.order(created_at: :desc)
  end
  def list
    @thisuser = User.find(params[:id])
    @thesesongs = Playlist.where("user_id = ?", params[:id])
  end
  def songs
    @thissong = Song.find(params[:id])
    @theseusers = Playlist.where("song_id = ?", params[:id])
  end
  def update
      @thisuser = User.find(params[:id])
      if @thisuser.update user_params
        redirect_to "/songs"
      else
        flash[:errors] = @thisuser.errors.full_messages     
        redirect_to "/songs"
      end
  end
  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end

