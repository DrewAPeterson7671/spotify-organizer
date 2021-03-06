
class Api::V1::AuthsController < ApplicationController
  before_action :set_auth, only: [:show, :edit, :update, :destroy]

  # GET /auths
  # GET /auths.json
  def spotify_request
    url = "https://accounts.spotify.com/authorize"
    query_params = {
      client_id: Rails.application.credentials[Rails.env.to_sym][:spotify]
      [:client_id],
      response_type: 'code',
      redirect_uri:'http://localhost:3000/api/v1/user',
      scope: "user-library-read
      playlist-read-collaborative
      playlist-modify-private
      user-modify-playback-state
      user-read-private
      user-top-read
      playlist-modify-public",
      show_dialog: true
    }
    redirect_to "#{url}?#{query_params.to_query}"
  end

end
