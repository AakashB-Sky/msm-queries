class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id }) # returns a relation with all matching rows (should be just one)
    @the_director = matching_records[0] # pull the first (and only) row only in the relation into an array

    render({ :template => "director_templates/details" })
  end
end
