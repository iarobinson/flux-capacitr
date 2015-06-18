module Api
  class ApiController < ApplicationController
    def save_and_render(object)
      if object.save
        render json: object
      else
        render json: object.errors.full_messages, status: :unprocessable_entity
      end
    end

    def ensure_logged_in
      unless logged_in?
        render json: ["You must be logged in to do that"], status: :unauthorized
      end
    end
  end
end
