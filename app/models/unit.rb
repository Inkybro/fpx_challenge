class Unit < ActiveRecord::Base
	validates :vin, :year, :make, :model, presence: true

	belongs_to :dealer
end
