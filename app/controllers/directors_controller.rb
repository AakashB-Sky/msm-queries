class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    # get director info from 'directors' table
    matching_records = Director.where({ :id => the_id }) # returns a relation with all matching rows (should be just one)
    @the_director = matching_records[0] # pull the first (and only) row only in the relation into an array

    # get director's filmography from `movies` table
    @filmography = Movie.where({ :director_id => the_id})

    render({ :template => "director_templates/details" })
  end

  def eldest
    render({ :template => "director_templates/eldest_director" })
  end

  def youngest 
    render({ :template => "director_templates/youngest_director" })
  end
end
