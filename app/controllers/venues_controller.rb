class VenuesController < ApplicationController
  def index
    matching_venues = Venue.all

    @list_of_venues = matching_venues.order({ :created_at => :desc })

    render({ :template => "venues/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_venues = Venue.where({ :id => the_id })

    @the_venue = matching_venues.at(0)

    render({ :template => "venues/show" })
  end

  def create
    the_venue = Venue.new
    the_venue.name = params.fetch("query_name")
    the_venue.address = params.fetch("query_address")
    the_venue.lat = params.fetch("query_lat")
    the_venue.lng = params.fetch("query_lng")
    the_venue.contact_name = params.fetch("query_contact_name")
    the_venue.neighborhood_id = params.fetch("query_neighborhood_id")
    the_venue.capacity = params.fetch("query_capacity")
    the_venue.venue_type = params.fetch("query_venue_type")
    the_venue.price_options = params.fetch("query_price_options")
    the_venue.website = params.fetch("query_website")
    the_venue.photo_url = params.fetch("query_photo_url")
    the_venue.pdf = params.fetch("query_pdf")
    the_venue.contacted = params.fetch("query_contacted", false)
    the_venue.visited = params.fetch("query_visited", false)
    the_venue.chosen = params.fetch("query_chosen", false)
    the_venue.final_price = params.fetch("query_final_price")
    the_venue.events_count = params.fetch("query_events_count")

    if the_venue.valid?
      the_venue.save
      redirect_to("/venues", { :notice => "Venue created successfully." })
    else
      redirect_to("/venues", { :alert => the_venue.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_venue = Venue.where({ :id => the_id }).at(0)

    the_venue.name = params.fetch("query_name")
    the_venue.address = params.fetch("query_address")
    the_venue.lat = params.fetch("query_lat")
    the_venue.lng = params.fetch("query_lng")
    the_venue.contact_name = params.fetch("query_contact_name")
    the_venue.neighborhood_id = params.fetch("query_neighborhood_id")
    the_venue.capacity = params.fetch("query_capacity")
    the_venue.venue_type = params.fetch("query_venue_type")
    the_venue.price_options = params.fetch("query_price_options")
    the_venue.website = params.fetch("query_website")
    the_venue.photo_url = params.fetch("query_photo_url")
    the_venue.pdf = params.fetch("query_pdf")
    the_venue.contacted = params.fetch("query_contacted", false)
    the_venue.visited = params.fetch("query_visited", false)
    the_venue.chosen = params.fetch("query_chosen", false)
    the_venue.final_price = params.fetch("query_final_price")
    the_venue.events_count = params.fetch("query_events_count")

    if the_venue.valid?
      the_venue.save
      redirect_to("/venues/#{the_venue.id}", { :notice => "Venue updated successfully."} )
    else
      redirect_to("/venues/#{the_venue.id}", { :alert => the_venue.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_venue = Venue.where({ :id => the_id }).at(0)

    the_venue.destroy

    redirect_to("/venues", { :notice => "Venue deleted successfully."} )
  end
end
