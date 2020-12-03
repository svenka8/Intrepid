class AnswersController < ApplicationController
  def landing

    if @current_user ==nil
     
    else
    Answer.where({:user_id=>@current_user.id}).each do |task|
      task.destroy
    end
    end
  
    render({ :template => "answers/landing.html.erb" })
    
  end

def clear_selection
      Answer.where({:user_id=>@current_user.id}).each do |task|
      task.destroy
    end
end

  def selection1
    selection_1=params.fetch("selection 1")
    @sel1=selection_1
    cookies.store(:selection1, @sel1)
    the_selection=Answer.new
    id=@current_user.id
    the_selection.user_id=id

    if selection_1=="proactive"
        the_selection.proactive="true"
        # the_selection.save
    end
    if selection_1=="tasking"
        the_selection.tasking="true"
        # the_selection.save
    end
    if selection_1=="collection"
        the_selection.collection="true"
        # the_selection.save
    end
    if selection_1=="claim"
        the_selection.claim="true"
        
      end
    if selection_1=="assessment"
      the_selection.assessment="true"
      # the_selection.save
    end
the_selection.save
p the_selection.errors.full_messages
@error1=the_selection.errors.full_messages
    
    render({ :template => "answers/landing2.html.erb", :alert => "error1"} )
  end

  def selection2
    selection_2=params.fetch("selection 2")
    @sel2=selection_2
    cookies.store(:selection2, @sel2)
    the_selection=Answer.new
    id=@current_user.id
    the_selection.user_id=id

    if selection_2=="proactive"
        the_selection.proactive="true"
        # the_selection.save
    end
    if selection_2=="tasking"
        the_selection.tasking="true"
        # the_selection.save
    end
    if selection_2=="collection"
        the_selection.collection="true"
        # the_selection.save
    end
    if selection_2=="claim"
        the_selection.claim="true"
        
      end
    if selection_2=="assessment"
      the_selection.assessment="true"
      # the_selection.save
    end
the_selection.save
p the_selection.errors.full_messages
    
    render({ :template => "answers/landing3.html.erb" })
  end

  def selection3
    selection_3=params.fetch("selection 3")
      #  selection_2=params.fetch("selection 2")
    @sel3=selection_3
    cookies.store(:selection3, @sel3)
    the_selection=Answer.new
    id=@current_user.id
    the_selection.user_id=id

    if selection_3=="proactive"
        the_selection.proactive="true"
        # the_selection.save
    end
    if selection_3=="tasking"
        the_selection.tasking="true"
        # the_selection.save
    end
    if selection_3=="collection"
        the_selection.collection="true"
        # the_selection.save
    end
    if selection_3=="claim"
        the_selection.claim="true"
        
      end
    if selection_3=="assessment"
      the_selection.assessment="true"
      # the_selection.save
    end
the_selection.save
p the_selection.errors.full_messages
    
    render({ :template => "answers/landing4.html.erb" })
  end

    def selection4
    selection_4=params.fetch("selection 4")
    @sel4=selection_4
    cookies.store(:selection4, @sel4)
    the_selection=Answer.new
    id=@current_user.id
    the_selection.user_id=id

    if selection_4=="proactive"
        the_selection.proactive="true"
        # the_selection.save
    end
    if selection_4=="tasking"
        the_selection.tasking="true"
        # the_selection.save
    end
    if selection_4=="collection"
        the_selection.collection="true"
        # the_selection.save
    end
    if selection_4=="claim"
        the_selection.claim="true"
        
      end
    if selection_4=="assessment"
      the_selection.assessment="true"
      # the_selection.save
    end
the_selection.save
  p the_selection.errors.full_messages
    render({ :template => "answers/landing5.html.erb" })
  end


  def selection5
    selection_5=params.fetch("selection 5")
    @sel5=selection_5
    cookies.store(:selection5, @sel5)
    the_selection=Answer.new
    id=@current_user.id
    the_selection.user_id=id
    # the_selection=User.where(:id=>@current_user.id).inspect
    # id=@current_user.id
    # the_selection.user_id=id

    if selection_5=="experienced"
        the_selection.exp="true"
        # the_selection.save
    end
    if selection_5=="inexperienced"
        the_selection.exp="false"
        # the_selection.save
    end
 
  the_selection.save
    p the_selection.errors.full_messages
    render({ :template => "answers/experience.html.erb" })
  end
   def selection6
    selection_6=params.fetch("selection 6")
    @sel5=selection_6
    cookies.store(:selection6, @sel6)
    the_selection=Answer.new
    id=@current_user.id
    the_selection.user_id=id
    # the_selection=User.where(:id=>@current_user.id).inspect
    # id=@current_user.id
    # the_selection.user_id=id

    if selection_6=="workingalone"
        the_selection.proactive="true"
        # the_selection.save
    end
    if selection_6=="inagroup"
        the_selection.tasking="true"
        # the_selection.save
    end
 
  the_selection.save
    p the_selection.errors.full_messages
    render({ :template => "answers/user-groups.html.erb" })
  end
  def index
    matching_answers = Answer.all

    @list_of_answers = matching_answers.order({ :created_at => :desc })

    render({ :template => "answers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_answers = Answer.where({ :id => the_id })

    @the_answer = matching_answers.at(0)

    render({ :template => "answers/show.html.erb" })
  end

  def create
    the_answer = Answer.new
    the_answer.user_id = params.fetch("query_user_id")
    the_answer.proactive = params.fetch("query_proactive", false)
    the_answer.tasking = params.fetch("query_tasking", false)
    the_answer.claim = params.fetch("query_claim", false)
    the_answer.assessment = params.fetch("query_assessment", false)
    the_answer.collection = params.fetch("query_collection", false)

    if the_answer.valid?
      the_answer.save
      redirect_to("/answers", { :notice => "Answer created successfully." })
    else
      redirect_to("/answers", { :notice => "Answer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_answer = Answer.where({ :id => the_id }).at(0)

    the_answer.user_id = params.fetch("query_user_id")
    the_answer.proactive = params.fetch("query_proactive", false)
    the_answer.tasking = params.fetch("query_tasking", false)
    the_answer.claim = params.fetch("query_claim", false)
    the_answer.assessment = params.fetch("query_assessment", false)
    the_answer.collection = params.fetch("query_collection", false)

    if the_answer.valid?
      the_answer.save
      redirect_to("/answers/#{the_answer.id}", { :notice => "Answer updated successfully."} )
    else
      redirect_to("/answers/#{the_answer.id}", { :alert => "Answer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_answer = Answer.where({ :id => the_id }).at(0)
    the_answer.destroy
    redirect_to("/answers", { :notice => "Answer deleted successfully."} )
  end
end
