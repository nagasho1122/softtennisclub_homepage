class ResultsController < ApplicationController
   before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @results = Result.all
  end
  
  def new
    @result = Result.new
  end
  
  def create
    @result = Result.new(result_params)
    if @result.save
      flash[:success] = "大会結果を追加しました。"
      redirect_to results_path
    else
      render "new"
    end
  end
  
  def edit
    @result = Result.find(params[:id])
  end
  
  def update
    @result = Result.find(params[:id])
    if @result.update(result_params)
      flash[:success] = "大会結果を更新しました。。"
      redirect_to results_path
    else
      render "edit"
    end
  end
  
  def destroy
    Result.find(params[:id]).destroy
    flash[:success] = "大会結果を削除しました"
    redirect_to results_path
  end
  
  private
    def result_params
      params.require(:result).permit(:name)
    end
end
