class BakeriesController < ApplicationController
  def index
    matching_bakeries = Bakery.all

    @list_of_bakeries = matching_bakeries.order({ :created_at => :desc })

    render({ :template => "bakeries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bakeries = Bakery.where({ :id => the_id })

    @the_bakery = matching_bakeries.at(0)

    render({ :template => "bakeries/show" })
  end

  def create
    the_bakery = Bakery.new
    the_bakery.name = params.fetch("query_name")
    the_bakery.address = params.fetch("query_address")
    the_bakery.lat = params.fetch("query_lat")
    the_bakery.lng = params.fetch("query_lng")
    the_bakery.website = params.fetch("query_website")
    the_bakery.contacted = params.fetch("query_contacted", false)
    the_bakery.tried = params.fetch("query_tried", false)
    the_bakery.chosen = params.fetch("query_chosen", false)
    the_bakery.contact_name = params.fetch("query_contact_name")
    the_bakery.price_options = params.fetch("query_price_options")
    the_bakery.photo_url = params.fetch("query_photo_url")
    the_bakery.notes = params.fetch("query_notes")
    the_bakery.pdf = params.fetch("query_pdf")
    the_bakery.deposit = params.fetch("query_deposit")
    the_bakery.final_price = params.fetch("query_final_price")
    the_bakery.neighborhood_id = params.fetch("query_neighborhood_id")

    if the_bakery.valid?
      the_bakery.save
      redirect_to("/bakeries", { :notice => "Bakery created successfully." })
    else
      redirect_to("/bakeries", { :alert => the_bakery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bakery = Bakery.where({ :id => the_id }).at(0)

    the_bakery.name = params.fetch("query_name")
    the_bakery.address = params.fetch("query_address")
    the_bakery.lat = params.fetch("query_lat")
    the_bakery.lng = params.fetch("query_lng")
    the_bakery.website = params.fetch("query_website")
    the_bakery.contacted = params.fetch("query_contacted", false)
    the_bakery.tried = params.fetch("query_tried", false)
    the_bakery.chosen = params.fetch("query_chosen", false)
    the_bakery.contact_name = params.fetch("query_contact_name")
    the_bakery.price_options = params.fetch("query_price_options")
    the_bakery.photo_url = params.fetch("query_photo_url")
    the_bakery.notes = params.fetch("query_notes")
    the_bakery.pdf = params.fetch("query_pdf")
    the_bakery.deposit = params.fetch("query_deposit")
    the_bakery.final_price = params.fetch("query_final_price")
    the_bakery.neighborhood_id = params.fetch("query_neighborhood_id")

    if the_bakery.valid?
      the_bakery.save
      redirect_to("/bakeries/#{the_bakery.id}", { :notice => "Bakery updated successfully."} )
    else
      redirect_to("/bakeries/#{the_bakery.id}", { :alert => the_bakery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bakery = Bakery.where({ :id => the_id }).at(0)

    the_bakery.destroy

    redirect_to("/bakeries", { :notice => "Bakery deleted successfully."} )
  end
end
