class AnswersController < ApplicationController

    before_action :find_question
    before_action :authenticate_user!
    # before_action :authorize_user!, only: [:destroy]
  
    def create
      @answer = Answer.new(answer_params)
      @answer.question = @question
      @answer.user = current_user
      if @answer.save
    
        flash[:success] = "Answer successfully created"
        redirect_to @question
      else
       
        @answers = @question.answers.order(created_at: :desc)

        render '/questions/show', status: 303
      end
    end
  
   
    # def destroy
    #   @answer = Answer.find params[:id]
    # #   if can?(:crud, @answer)
    #     @answer.destroy
    #     redirect_to question_path(@answer.question)
    #     flash[:success] = "Answer deleted"
    # #   else
    # #     redirect_to root_path, alert: "Not athorized to change Answer!"
    # #   end
    # end
    
    private
  
    def find_question
      @question = Question.find params[:question_id]
    end
   
    def answer_params
      params.require(:answer).permit(:answer)
    end
  
    # def authorize_user!
    #   redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @answer)
    # end
  
  end
  