class StaticPagesController < ApplicationController
  before_action :ensure_logged_in, except: [:about]
  
  def test
    @user = current_user
    render :filepicker_test
  end
end