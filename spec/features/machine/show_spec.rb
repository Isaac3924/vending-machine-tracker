require 'rails_helper'

RSpec.describe 'When a Uswer visits a machine show page', type: :feature do
  before do
    @owner = Owner.create!(name: "Sam's Snacks")

    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
    @snod  = @owner.machines.create!(location: "Sno'd Mixed Drinks")

    @vodka = @dons.snacks.create!(name: "Vodka Lemonade", price: 5.50)
    @rum = @dons.snacks.create!(name: "Rum and Coke", price: 6.00)
    @gin = @dons.snacks.create!(name: "Negroni", price: 8.25)
    @ice = @snod.snacks.create!(name: "Smirnoff Ice", price: 1.50)
    @natty = @snod.snacks.create!(name: "Natural Ice", price: 2.50)

    visit machine_path(@dons)
  end
  
  scenario 'they see the location of that machine' do
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'can see the name of all snacks associated with that vending machine along with their price' do
    expect(page).to have_content("Vodka Lemonade: $5.50")
    expect(page).to have_content("Rum and Coke: $6.00")
    expect(page).to have_content("Negroni: $8.25")
    expect(page).to_not have_content("Smirnoff Ice: $1.50")
    expect(page).to_not have_content("Natural Ice: $2.50")
  end

  scenario 'can see average price of all snacks in the machine' do
    expect(page).to have_content("Average Price: $6.58")
  end
end