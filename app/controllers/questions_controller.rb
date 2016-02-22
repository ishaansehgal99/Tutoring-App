class QuestionsController < ApplicationController
  def solve
   @question = Question.find_by_id(params["id"])
   
   
    render 'solve'
  end 
    def show
    @question = Question.find_by_id(params["id"])
    end
  
  def new
    @question = Question.new
  end
  
  def create 
    @question = Question.new
     @question.name = params[:name]
    @question.description = params[:description]
    if @question.save
      redirect_to '/questions'
      flash[:success] = "You have successfully made your question."
    else
      render 'new'
    end
  end
  
  def edit
    @question = Question.find_by(id: params[:id])
  end
  
  def index
    @questions = Question.all
  end
  
  def update 
    @question = Question.find_by(id: params[:id])
    @question.name = params[:name]
    @user.description = params[:description]
    
    if @question.save
      redirect_to "/question/#{@question.id}"
    else
      render 'edit'
    end
  end
  
  def destroy
    @question = Question.find_by_id(params['id'])
    @question.destroy
    redirect_to "/questions"
  end
  
  
end
