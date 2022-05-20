class ApplicationController < ActionController::Base

before_action :set_current_user
#this means, before every action in every controller, do this action
    
    def set_current_user
    @current_user = User.find_by({"id" => session["used_id"]})
    end
end
