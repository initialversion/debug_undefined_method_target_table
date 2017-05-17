class EngagementsController < ApplicationController
  def index
    @engagements = Engagement.page(params[:page]).per(10)

    render("engagements/index.html.erb")
  end

  def show
    @engagement = Engagement.find(params[:id])

    render("engagements/show.html.erb")
  end

  def new
    @engagement = Engagement.new

    render("engagements/new.html.erb")
  end

  def create
    @engagement = Engagement.new

    @engagement.project_id = params[:project_id]
    @engagement.client_id = params[:client_id]

    save_status = @engagement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/engagements/new", "/create_engagement"
        redirect_to("/engagements")
      else
        redirect_back(:fallback_location => "/", :notice => "Engagement created successfully.")
      end
    else
      render("engagements/new.html.erb")
    end
  end

  def edit
    @engagement = Engagement.find(params[:id])

    render("engagements/edit.html.erb")
  end

  def update
    @engagement = Engagement.find(params[:id])

    @engagement.project_id = params[:project_id]
    @engagement.client_id = params[:client_id]

    save_status = @engagement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/engagements/#{@engagement.id}/edit", "/update_engagement"
        redirect_to("/engagements/#{@engagement.id}", :notice => "Engagement updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Engagement updated successfully.")
      end
    else
      render("engagements/edit.html.erb")
    end
  end

  def destroy
    @engagement = Engagement.find(params[:id])

    @engagement.destroy

    if URI(request.referer).path == "/engagements/#{@engagement.id}"
      redirect_to("/", :notice => "Engagement deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Engagement deleted.")
    end
  end
end
