class GithubProjectsController < ApplicationController
  def index
    @github_projects = GithubProject.all
  end

  def show
    @github_project = GithubProject.find(params[:id])
  end

  def new
    @github_project = GithubProject.new
  end

  def edit
    @github_project = GithubProject.find(params[:id])
  end
  
  def create
    @github_project = GithubProject.new(params[:github_project])

    if @github_project.save
      flash[:notice] = 'GithubProject was successfully created.'
      redirect_to(@github_project)
    else
      render :action => "new" 
    end
  end

  def update
    @github_project = GithubProject.find(params[:id])
      
    if @github_project.update_attributes(params[:github_project])
      flash[:notice] = 'GithubProject was successfully updated.'
      redirect_to(@github_project)
    else
      render :action => "edit" 
    end
  end

  def destroy
    @github_project = GithubProject.find(params[:id])
    @github_project.destroy
    redirect_to(github_projects_url)
  end
end
