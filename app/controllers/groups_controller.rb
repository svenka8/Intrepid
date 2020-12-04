class GroupsController < ApplicationController
  def index
    matching_groups = Group.all

    @list_of_groups = matching_groups.order({ :created_at => :desc })

    render({ :template => "groups/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_groups = Group.where({ :id => the_id })

    @the_group = matching_groups.at(0)

    render({ :template => "groups/show.html.erb" })
  end

  def create
    the_group = Group.new
    the_group.name = params.fetch("query_name")

    if the_group.valid?
      the_group.save
      group_list=Grouplist.new
      group_list.group_id=the_group.id
      group_list.user_id=@current_user.id
      group_list.save
      redirect_to("/groups", { :notice => "Group created successfully." })
    else
      redirect_to("/groups", { :notice => "Group failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.name = params.fetch("query_name")

    if the_group.valid?
      the_group.save
      redirect_to("/groups/#{the_group.id}", { :notice => "Group updated successfully."} )
    else
      redirect_to("/groups/#{the_group.id}", { :alert => "Group failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.destroy

    redirect_to("/groups", { :notice => "Group deleted successfully."} )
  end
end
