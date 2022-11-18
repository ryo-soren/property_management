class ApplicationsController < ApplicationController
    before_action :find_property


    def new
        @application = Application.new
    end

    def create
        @application = Question.new(application_params)
        @application.user = current_user
        @application.property = @property

        if @application.save
            flash[:success]= "Property Created"
            redirect_to @property
        else
            flash[:error] = "Please check your inputs"
            render 'new', status: 303
        end
        

    end

    private

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
end
