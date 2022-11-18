class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:customer_panel, :admin_panel]
    before_action :check_admin, only: [:admin_panel]
    before_action :check_customer, only: [:customer_panel]
    
    

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, {alert: "Signed up successfully"}
        else
            flash.alert = @user.errors.full_messages.join(", ")
            render :new
        end
    end

    def admin_panel
        @user = current_user
        @properties = Property.where(:user_id => current_user.id)
    end

    def customer_panel
        @user = current_user
    end

    private

    def user_params
        params.require(:user).permit(
        :first_name, 
        :last_name, 
        :email, 
        :password, 
        :password_confirmation,
        :is_admin
        )
    end

    def check_admin
        redirect_to root_path, alert: "Not authorized" unless current_user.is_admin
    end

    def check_customer
        redirect_to root_path, alert: "Not authorized" unless !current_user.is_admin
    end
  
end
