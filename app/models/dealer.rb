class Dealer < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :state, presence: true, length: {is: 2}
  validates :zip, presence: true, length: {within: 5..9} # this could be done better by validating length 5 OR 9

  has_many :units

  def full_address joiner = ', '
    "#{address ? address + joiner : nil}#{city}, #{state}, #{zip}"
  end

  def zip= zip
  	write_attribute(:zip, zip.gsub(/\D/, ''))
  end

  def nearby_dealers
  	Dealer.where(city: city, state: state).where.not(id: id)
  end

  def has_units?
    units.count > 0
  end
end
