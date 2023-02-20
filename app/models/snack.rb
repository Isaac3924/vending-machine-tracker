class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    average(:price)
  end

  def self.count_snacks
    count(:id)
  end
end
