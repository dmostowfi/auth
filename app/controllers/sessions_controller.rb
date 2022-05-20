class SessionsController < ApplicationController

    def new
    end 

    #this is how we authenticate
    def create
        #step 1: check to see if there's a user with the email we entered
        @user = User.find_by({"email"=>params["email"]})
        if @user #checks if user is in database
        #step 1a: if yes, check password (go to step 2)
        #step 2: check password to see if it matches user's password
            if params["password"] == @user["password"] #params["password"] is the password that was typed in 
            #step 2a: if yes, go to companies page 
                flash["notice"] = "You're in!"
                redirect_to "/companies"
            else
            #step 2b: if no, go back to login page
                flash["notice"] = "Incorrect credentials :("
                redirect_to "/sessions/new"
            end
        else
        #step 1b: if no, go back to login page  
            flash["notice"] = "Incorrect credentials :("
            redirect_to "/sessions/new"
        end
    end
end
