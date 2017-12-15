class PlaylistsController < ApplicationController
    def create
        @thisplaylist = Playlist.create(song_id: params[:id], user_id: current_user.id)
        redirect_to "/songs"
    end
end
