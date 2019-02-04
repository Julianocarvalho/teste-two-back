class Api::V1::ProjectsController < ApplicationController
	before_action :authenticate_api_v1_user!
	respond_to :json

	def tasks_by_project
		project = Project.find(params[:id])
		render json: project.tasks
	end

	def index
		projects = Project.all
		render json: projects
	end

	def show
		begin
			project = Project.find(params[:id])
			project.elapsed_time_total
			render json: project
		rescue
			head 404
		end
	end

	def create
		project = Project.new(project_params)
		if project.save
			render json: project, status: 201
		else
			render json: { errors: project.errors }, status: 422
		end
	end

	def update
		project = Project.find(params[:id])
		if project.update(project_params)
			render json: project, status: 200
		else
			render json: { errors: project.errors }, status: 422
		end
	end
	
	def destroy
		project = Project.find(params[:id])
		project.destroy
		head 204
	end
	
	private
	def project_params
		params.require(:project).permit(:name, :description, :elapsed_time)
	end
end