module Api
  class FeedsController < ApiController
    def show
      @feed_posts = current_user.feed_posts(20, Time.now)
      render 'show.json.jbuilder'
    end
  end
end