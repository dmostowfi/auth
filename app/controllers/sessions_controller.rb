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
            if params["password"] == BCrypt::Password.new(@user["password"])  
                #params["password"] is the password that was typed in  
                #BCrypt.new is the decrypted version              
                #the BCrypt is checking the encrypted params (see users controller) against the decrypted password 
                
                #step 2a: if yes, go to companies page 
                session["user_id"] = @user["id"]
                #when we log in successfully, we set key: session["user_id"] equal to @user["id"] 
                flash["notice"] = "Welcome, #{@user["first_name"]}."
                redirect_to "/companies"
            else
            #step 2b: if no, go back to login page
                flash["notice"] = "Nope :("
                redirect_to "/sessions/new"
            end
        
        else
        #step 1b: if no, go back to login page  
            flash["notice"] = "Incorrect credentials :("
            redirect_to "/sessions/new"
        end
    end

    def destroy #logout, how to destroy a sessions
        flash["see ya later!"]
        session["user_id"] = nil
        redirect_to "/sessions/new"
    end

end
