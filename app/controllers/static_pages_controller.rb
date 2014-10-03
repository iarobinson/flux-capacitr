class StaticPagesController < ApplicationController
  before_action :ensure_logged_in, except: [:about, :easter_egg]
end