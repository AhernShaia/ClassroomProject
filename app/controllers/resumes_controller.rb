class ResumesController < ApplicationController
    before_action :find_params, only: [:edit, :update, :show, :destroy]
    def index
        # 搜索 lazy loading
        @resumes = Resume.order(create_at: :desc)
        if params[:keyword].present?
            @resumes = @resumes.seach(params[:keyword])
        end
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
        
        if @resume.update(resume_params)
            redirect_to @resume
        end
    end

    def destroy
        
        if @resume.destroy
            redirect_to @resume
        end
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