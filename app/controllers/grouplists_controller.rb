class GrouplistsController < ApplicationController
  def index
    matching_grouplists = Grouplist.all

    @list_of_grouplists = matching_grouplists.order({ :created_at => :desc })

    render({ :template => "grouplists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_grouplists = Grouplist.where({ :id => the_id })

    @the_grouplist = matching_grouplists.at(0)

    render({ :template => "grouplists/show.html.erb" })
  end

  def create
    the_grouplist = Grouplist.new
    the_grouplist.user_id = params.fetch("query_user_id")
    the_grouplist.group_id = params.fetch("query_group_id")

    if the_grouplist.valid?
      the_grouplist.save
      redirect_to("/grouplists", { :notice => "Grouplist created successfully." })
    else
      redirect_to("/grouplists", { :notice => "Grouplist failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_grouplist = Grouplist.where({ :id => the_id }).at(0)

    the_grouplist.user_id = params.fetch("query_user_id")
    the_grouplist.group_id = params.fetch("query_group_id")

    if the_grouplist.valid?
      the_grouplist.save
      redirect_to("/grouplists/#{the_grouplist.id}", { :notice => "Grouplist updated successfully."} )
    else
      redirect_to("/grouplists/#{the_grouplist.id}", { :alert => "Grouplist failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_grouplist = Grouplist.where({ :id => the_id }).at(0)

    the_grouplist.destroy

    redirect_to("/grouplists", { :notice => "Grouplist deleted successfully."} )
  end
end
