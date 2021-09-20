class MembersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    year = DateTime.now.year
    if DateTime.now.month <= 3
      year -= 1
    end
    one_grade_duration_start = DateTime.new(year, 4, 1, 0, 0, 0)
    one_grade_duration_end = DateTime.new(year+1, 3, 31,23, 59, 59)
    second_grade_duration_start = DateTime.new(year-1, 4, 1, 0, 0, 0)
    second_grade_duration_end = DateTime.new(year, 3, 31,23, 59, 59)
    third_grade_duration_start = DateTime.new(year-2, 4, 1, 0, 0, 0)
    third_grade_duration_end = DateTime.new(year-1, 3, 31,23, 59, 59)
    fourth_grade_duration_start = DateTime.new(year-3, 4, 1, 0, 0, 0)
    fourth_grade_duration_end = DateTime.new(year-2, 3, 31,23, 59, 59)
    @members_one = Member.where(addmission_date:  one_grade_duration_start..one_grade_duration_end)
    @members_second = Member.where(addmission_date:  second_grade_duration_start..second_grade_duration_end)
    @members_third = Member.where(addmission_date:  third_grade_duration_start..third_grade_duration_end)
    @members_fourth = Member.where(addmission_date:  fourth_grade_duration_start..fourth_grade_duration_end)
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
