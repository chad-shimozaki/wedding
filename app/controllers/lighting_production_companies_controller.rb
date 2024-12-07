class LightingProductionCompaniesController < ApplicationController
  def index
    matching_lighting_production_companies = LightingProductionCompany.all

    @list_of_lighting_production_companies = matching_lighting_production_companies.order({ :chosen => :desc, :created_at => :desc })

    render({ :template => "lighting_production_companies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_lighting_production_companies = LightingProductionCompany.where({ :id => the_id })

    @the_lighting_production_company = matching_lighting_production_companies.at(0)

    render({ :template => "lighting_production_companies/show" })
  end

  def create
    the_lighting_production_company = LightingProductionCompany.new
    the_lighting_production_company.name = params.fetch("query_name")
    the_lighting_production_company.website = params.fetch("query_website")
    the_lighting_production_company.contact_name = params.fetch("query_contact_name")
    the_lighting_production_company.contact_email = params.fetch("query_contact_email")
    the_lighting_production_company.contacted = params.fetch("query_contacted", false)
    the_lighting_production_company.chosen = params.fetch("query_chosen", false)
    the_lighting_production_company.price_options = params.fetch("query_price_options")
    the_lighting_production_company.notes = params.fetch("query_notes")
    the_lighting_production_company.deposit = params.fetch("query_deposit")
    the_lighting_production_company.final_price = params.fetch("query_final_price")

    if the_lighting_production_company.valid?
      the_lighting_production_company.save
      redirect_to("/lighting_production_companies", { :notice => "Lighting & Production Company created successfully." })
    else
      redirect_to("/lighting_production_companies", { :alert => the_lighting_production_company.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_lighting_production_company = LightingProductionCompany.where({ :id => the_id }).at(0)

    the_lighting_production_company.name = params.fetch("query_name")
    the_lighting_production_company.website = params.fetch("query_website")
    the_lighting_production_company.contact_name = params.fetch("query_contact_name")
    the_lighting_production_company.contact_email = params.fetch("query_contact_email")
    the_lighting_production_company.contacted = params.fetch("query_contacted", false)
    the_lighting_production_company.chosen = params.fetch("query_chosen", false)
    the_lighting_production_company.price_options = params.fetch("query_price_options")
    the_lighting_production_company.notes = params.fetch("query_notes")
    the_lighting_production_company.deposit = params.fetch("query_deposit")
    the_lighting_production_company.final_price = params.fetch("query_final_price")

    if the_lighting_production_company.valid?
      the_lighting_production_company.save
      redirect_to("/lighting_production_companies/#{the_lighting_production_company.id}", { :notice => "Lighting production company updated successfully."} )
    else
      redirect_to("/lighting_production_companies/#{the_lighting_production_company.id}", { :alert => the_lighting_production_company.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_lighting_production_company = LightingProductionCompany.where({ :id => the_id }).at(0)

    the_lighting_production_company.destroy

    redirect_to("/lighting_production_companies", { :notice => "Lighting & Production Company deleted successfully."} )
  end
end
