class PropertiesController < ApplicationController

  before_action :find_property, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin, only: [:new, :create]
  before_action :authorize_user!, only: [:edit, :update, :destroy]


      def index
          @properties = Property.all.order(created_at: :desc)
      end


      def show
        @questions = @property.questions.order(created_at: :desc)
        @question = Question.new
        @answer = Answer.new
      end

      def new
          @property = Property.new
      end

      def create
          @property = Property.new(property_params)
          @property.user = User.first

          if @property.save
              flash[:success]= "Property Created"
              redirect_to @property

          else
              flash[:error] = "Please check your inputs"
              render 'new', status: 303
          end

      end

      def edit

      end

      def update
          if @property.update(property_params)
              flash[:success] = "Property successfully updated"
              redirect_to @property
          else
              flash[:error] = "Review your inputs"
              render :edit, status: 303
          end
      end

      def destroy
          @property.destroy
          redirect_to properties_path
      end



  private

  def find_property
      @property = Property.find params[:id]
  end

  def property_params
      params.require(:property).permit(
          :name,
          :description,
          :price,
          :location,
          :amenities,
          :image_url
      )
  end

  def check_admin
        redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end

  def authorize_user!
    redirect_to @property, alert: "Not authorized" unless can?(:crud, @property)

  end
end
