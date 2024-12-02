# == Schema Information
#
# Table name: caterers
#
#  id              :bigint           not null, primary key
#  address         :string
#  chosen          :boolean
#  contact_email   :string
#  contact_name    :string
#  contacted       :boolean
#  deposit         :float
#  final_price     :float
#  lat             :float
#  lng             :float
#  name            :string
#  notes           :text
#  pdf             :string
#  photo_url       :string
#  preferred       :boolean
#  price_options   :text
#  tried           :boolean
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  cuisine_id      :integer
#  neighborhood_id :integer
#
class Caterer < ApplicationRecord
  validates :address, presence: true
  belongs_to :cuisine, required: true, class_name: "Cuisine", foreign_key: "cuisine_id", counter_cache: true
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  has_many :events, through: :meals, source: :event
  validates :name, presence: true
  validates :name, uniqueness: true
end
