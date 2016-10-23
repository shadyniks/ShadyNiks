class AdminController < ApplicationController
  layout "admin"
  http_basic_authenticate_with :name => "shadynikslive@gmail.com", :password => "kmpmsrs_7" 

  def index
  end
end