class CourselistsController < ApplicationController
  def index
    matching_courselists = Courselist.all

    @list_of_courselists = matching_courselists.order({ :created_at => :desc })

    render({ :template => "courselists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_courselists = Courselist.where({ :id => the_id })

    @the_courselist = matching_courselists.at(0)

    render({ :template => "courselists/show.html.erb" })
  end

  def create
    the_courselist = Courselist.new
    the_courselist.user_id = params.fetch("query_user_id")
    the_courselist.course_id = params.fetch("query_course_id")

    if the_courselist.valid?
      the_courselist.save
      redirect_to("/courselists", { :notice => "Courselist created successfully." })
    else
      redirect_to("/courselists", { :notice => "Courselist failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_courselist = Courselist.where({ :id => the_id }).at(0)

    the_courselist.user_id = params.fetch("query_user_id")
    the_courselist.course_id = params.fetch("query_course_id")

    if the_courselist.valid?
      the_courselist.save
      redirect_to("/courselists/#{the_courselist.id}", { :notice => "Courselist updated successfully."} )
    else
      redirect_to("/courselists/#{the_courselist.id}", { :alert => "Courselist failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_courselist = Courselist.where({ :id => the_id }).at(0)

    the_courselist.destroy

    redirect_to("/courselists", { :notice => "Courselist deleted successfully."} )
  end
end
