class AnswersController < ApplicationController

    before_action :find_question
    before_action :find_property
    before_action :authenticate_user!
  
    def create
      @answer = Answer.new(answer: params[:answer])
      @answer.question = @question
      @answer.property = @property
      @answer.user = current_user
      if @answer.save
    
        flash[:success] = "Answer successfully created"
        redirect_to @property
      else
        @questions = @property.questions
        @answers = @question.answers.order(created_at: :desc)
        flash.alert = @answer.errors.full_messages.join(", ")
        redirect_to "/properties/#{@property.id}"
      end
    end
  

    private
  
    def find_question
      @question = Question.find params[:question_id]
    end

    def find_property
      @property = Property.find params[:property_id]
    end
   
    def answer_params
      params.require(:answer).permit(:answer)
    end

  end
  