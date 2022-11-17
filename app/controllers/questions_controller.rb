class QuestionsController < ApplicationController



# ------------->    CALLBACKS   <-------------
before_action :find_question, only: [:edit, :update, :show, :destroy]

before_action :find_property, only: [:edit, :update, :create, :show, :destroy]

before_action :authenticate_user!, except: [:index, :show]

before_action :authorize_user!, only:[:edit, :update, :destroy]

# ------------->    CREATE    <-------------
def new 
  @question = Question.new
end

def create
  @question = Question.new(question_params)
  @question.property = @property
  @question.user = current_user
  
  if @question.save
    flash[:success] = "Question successfully created"
    redirect_to @property

  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
end


#   ------------->   READ    <-------------
def index
  @questions = Question.order(created_at: :desc)
end

def show
  @answers = @question.answers.order(created_at: :desc)
  @answer = Answer.new
end

#   ------------->  UPDATE  <-------------
def edit
end

def update
  if @question.update(question_params)
    flash[:success] = "Question successfully updated"
    redirect_to @question

  else
    flash[:error] = "Something went wrong"
    render :edit
  end
end

# ------------->    DELETE    <-------------
def destroy
  @question.destroy
  redirect_to @property
end

private

def find_question
  @question = Question.find params[:id]
end

def find_property
  @property = Property.find params[:property_id]
end


def question_params
  params.require(:question).permit(:question)
end

def authorize_user!
  redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @question)
end



end
