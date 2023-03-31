class ResumesController < ApplicationController
  before_action :find_params, only: %i[edit update show destroy]
  before_action :authenticate_user!
  def index
    # user: 自己 1
    # company: 全部 2
    # staff: 全部 3
    # 搜索 lazy loading
    @resumes = Resume.order(create_at: :desc)
    @resumes = @resumes.seach(params[:keyword]) if params[:keyword].present?
    # @resumes = Resume.order(create_at: :desc)
    # debugger
  end
  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to root_path, notice: "建立履歷"
    else
      render :new
    end
  end
  def show
  end

  def edit
  end

  def update
    redirect_to @resume if @resume.update(resume_params)
  end

  def destroy
    redirect_to @resume if @resume.destroy
  end

  private

  def resume_params
    params.require(:resume).permit(
      :name,
      :email,
      :tel,
      :skill,
      :intro,
      :city,
      :education,
      :experience,
      :portfolio
    )
  end

  def find_params
    @resume = Resume.find(params[:id])
  end
end
