class MembersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @members = Member.all
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "部員を追加しました。"
      redirect_to members_path
    else
      render "new"
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "部員情報を更新しました。。"
      redirect_to members_path
    else
      render "edit"
    end
  end
  
  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "部員情報を削除しました"
    redirect_to members_path
  end
  
  private
  
    def member_params
      params.require(:member).permit(:name, :position, :from,:text,
                          :department, :director, :word, :addmission_date)
    end
  
end
