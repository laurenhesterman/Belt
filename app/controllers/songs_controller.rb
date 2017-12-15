class SongsController < ApplicationController
    def create
        
        @thissong = current_user.songs.new(song_params)
        if @thissong.save
            @thisplaylist = Playlist.create(song_id: @thissong.id, user_id: current_user.id)
            redirect_to "/songs"
        else
            flash[:errors] = @thissong.errors.full_messages
            redirect_to "/songs"
        end
    end
    def show
        @thissong = Song.find(params[:id])
        #@songs = Playlist.find_by_song_id(params[:id])  
    end
    def destroy
        
        redirect_to "/users/#{current_user.id}"
    end
    private
    def song_params
        params.require(:song).permit(:title, :artist)
    end
end
