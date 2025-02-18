class ActorsController < ApplicationController
  def index
    render({ :template => "actor_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    # get actor info from 'actors' table
    matching_records = Actor.where({ :id => the_id }) # pull relation with all matches (should be one)
    @the_actor = matching_records[0] # pull the first (and only) row from the matching_record relations into an array
    

    render({ :template => "actor_templates/details" })
  end
end
