class ResumesController < ApplicationController
    def index
        @resumes = Resume.order(create_at: :desc)
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
end