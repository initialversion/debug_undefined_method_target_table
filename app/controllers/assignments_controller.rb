class AssignmentsController < ApplicationController
  def index
    @q = Assignment.ransack(params[:q])
    @assignments = @q.result(:distinct => true).includes(:designer, :project).page(params[:page]).per(10)

    render("assignments/index.html.erb")
  end

  def show
    @assignment = Assignment.find(params[:id])

    render("assignments/show.html.erb")
  end

  def new
    @assignment = Assignment.new

    render("assignments/new.html.erb")
  end

  def create
    @assignment = Assignment.new

    @assignment.project_id = params[:project_id]
    @assignment.designer_id = params[:designer_id]

    save_status = @assignment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assignments/new", "/create_assignment"
        redirect_to("/assignments")
      else
        redirect_back(:fallback_location => "/", :notice => "Assignment created successfully.")
      end
    else
      render("assignments/new.html.erb")
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])

    render("assignments/edit.html.erb")
  end

  def update
    @assignment = Assignment.find(params[:id])

    @assignment.project_id = params[:project_id]
    @assignment.designer_id = params[:designer_id]

    save_status = @assignment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assignments/#{@assignment.id}/edit", "/update_assignment"
        redirect_to("/assignments/#{@assignment.id}", :notice => "Assignment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Assignment updated successfully.")
      end
    else
      render("assignments/edit.html.erb")
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])

    @assignment.destroy

    if URI(request.referer).path == "/assignments/#{@assignment.id}"
      redirect_to("/", :notice => "Assignment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Assignment deleted.")
    end
  end
end
