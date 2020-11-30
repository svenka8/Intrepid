class AnswersController < ApplicationController
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
