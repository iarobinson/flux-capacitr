module Api
  class ApiController < ApplicationController
    def ensure_logged_in
      unless logged_in?
        render json: ["You must be logged in to do that"], status: :unauthorized
      end
    end
  end
end
