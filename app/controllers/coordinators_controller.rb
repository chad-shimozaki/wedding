class CoordinatorsController < ApplicationController
  def index
    matching_coordinators = Coordinator.all

    @list_of_coordinators = matching_coordinators.order({ :created_at => :desc })

    render({ :template => "coordinators/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_coordinators = Coordinator.where({ :id => the_id })

    @the_coordinator = matching_coordinators.at(0)

    render({ :template => "coordinators/show" })
  end

  def create
    the_coordinator = Coordinator.new
    the_coordinator.name = params.fetch("query_name")
    the_coordinator.website = params.fetch("query_website")
    the_coordinator.photo_url = params.fetch("query_photo_url")
    the_coordinator.pdf = params.fetch("query_pdf")
    the_coordinator.contacted = params.fetch("query_contacted", false)
    the_coordinator.chosen = params.fetch("query_chosen", false)
    the_coordinator.price_options = params.fetch("query_price_options")
    the_coordinator.notes = params.fetch("query_notes")
    the_coordinator.deposit = params.fetch("query_deposit")
    the_coordinator.final_price = params.fetch("query_final_price")
    the_coordinator.experience = params.fetch("query_experience")

    if the_coordinator.valid?
      the_coordinator.save
      redirect_to("/coordinators", { :notice => "Coordinator created successfully." })
    else
      redirect_to("/coordinators", { :alert => the_coordinator.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_coordinator = Coordinator.where({ :id => the_id }).at(0)

    the_coordinator.name = params.fetch("query_name")
    the_coordinator.website = params.fetch("query_website")
    the_coordinator.photo_url = params.fetch("query_photo_url")
    the_coordinator.pdf = params.fetch("query_pdf")
    the_coordinator.contacted = params.fetch("query_contacted", false)
    the_coordinator.chosen = params.fetch("query_chosen", false)
    the_coordinator.price_options = params.fetch("query_price_options")
    the_coordinator.notes = params.fetch("query_notes")
    the_coordinator.deposit = params.fetch("query_deposit")
    the_coordinator.final_price = params.fetch("query_final_price")
    the_coordinator.experience = params.fetch("query_experience")

    if the_coordinator.valid?
      the_coordinator.save
      redirect_to("/coordinators/#{the_coordinator.id}", { :notice => "Coordinator updated successfully."} )
    else
      redirect_to("/coordinators/#{the_coordinator.id}", { :alert => the_coordinator.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_coordinator = Coordinator.where({ :id => the_id }).at(0)

    the_coordinator.destroy

    redirect_to("/coordinators", { :notice => "Coordinator deleted successfully."} )
  end
end
