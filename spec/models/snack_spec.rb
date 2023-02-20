require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many :machines}
  end

  describe 'class methods' do
    before do
      Snack.create!(name: "Vodka Lemonade", price: 5.50)
      Snack.create!(name: "Rum and Coke", price: 6.00)
      Snack.create!(name: "Negroni", price: 8.25)
    end
    
    it '#average_price' do
      expect(Snack.average_price.round(2)).to eq(6.58)
      Snack.create!(name: "Cosmo", price: 8.00)
      expect(Snack.average_price.round(2)).to eq(6.94)
    end

    it '#count_snacks' do
      expect(Snack.count_snacks).to eq(3)
      Snack.create!(name: "Cosmo", price: 8.00)
      expect(Snack.count).to eq(4)
    end
  end
end
