class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    render("projects/index.html.erb")
  end

  def show
    @project = Project.find(params[:id])

    render("projects/show.html.erb")
  end

  def new
    @project = Project.new

    render("projects/new.html.erb")
  end

  def create
    @project = Project.new

    @project.title = params[:title]
    @project.project_type = params[:project_type]
    @project.description = params[:description]
    @project.status = params[:status]
    @project.version = params[:version]

    save_status = @project.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projects/new", "/create_project"
        redirect_to("/projects")
      else
        redirect_back(:fallback_location => "/", :notice => "Project created successfully.")
      end
    else
      render("projects/new.html.erb")
    end
  end

  def edit
    @project = Project.find(params[:id])

    render("projects/edit.html.erb")
  end

  def update
    @project = Project.find(params[:id])

    @project.title = params[:title]
    @project.project_type = params[:project_type]
    @project.description = params[:description]
    @project.status = params[:status]
    @project.version = params[:version]

    save_status = @project.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projects/#{@project.id}/edit", "/update_project"
        redirect_to("/projects/#{@project.id}", :notice => "Project updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Project updated successfully.")
      end
    else
      render("projects/edit.html.erb")
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    if URI(request.referer).path == "/projects/#{@project.id}"
      redirect_to("/", :notice => "Project deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Project deleted.")
    end
  end
end
