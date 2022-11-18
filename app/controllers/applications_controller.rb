class ApplicationsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :index,:show,:update]
before_action :find_property, only: [:new, :create]
before_action :check_customer, only: [:new, :create]
before_action :check_owner, only: [:index,:show,:update]


    def new
        @application = Application.new
    end

    def create
        @application = Application.new(application_params)
        @application.property = @property
        @application.user = current_user
        if @application.save 
            flash[:success] = "Application Successfully created"
            redirect_to @property
        else
            flash.alert = @application.errors.full_messages.join(", ")
            render 'new', status: 303
        end
    end

    def index
        @applications = Application.where({property_id: params[:property_id]})
    end


    def show
        @application = Application.find params[:id]

    end

    def update
        @application = Application.find params[:id]
        if @application.update(status_params)
            if @application.status == 1
            flash[:success] = "Application Approved"
            end
            if @application.status == 2
            flash[:success] = "Application Rejected"
            end
            redirect_to property_applications_path(@application.property)
            
        else
            flash[:error] = "Something went wrong"
            redirect_to @application, status: 303
          
        end
    end


    private


    def status_params       
        params.require(:application).permit(:status)
     end
 

    def find_property
        @property = Property.find params[:property_id]
      end

    def application_params
        params.require(:application).permit(
        :first_name,
        :last_name,
        :age,
        :occupants,
        :sin,
        :phone_number,
        :content
        )
    end

    def check_customer
        redirect_to @property, alert: "Not authorized" unless !current_user.is_admin
    end
    def check_admin
        redirect_to root_path, alert: "Not authorized" unless current_user.is_admin
    end

    def check_owner
        @property =  Property.find params[:property_id]
        redirect_to root_path, alert: "Not authorized" unless current_user == @property.user
    end

    def authorize_user!
        redirect_to root_path, alert: "Not authorized" unless can?(:crud, @property)
    end
end
