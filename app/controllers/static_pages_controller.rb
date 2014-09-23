class StaticPagesController < ApplicationController
  before_action :ensure_logged_in
  
  def welcome
  end
end