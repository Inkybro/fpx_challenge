class Dealer < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :state, presence: true, length: {is: 2}

  def full_address joiner = ', '
    "#{address}#{joiner}#{city}, #{state}, #{zip}"
  end
end
