require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see all of the Snacks for a machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1  = dons.snacks.create(name: "Twinkies", price: 3.25)
    snack_2  = dons.snacks.create(name: "Potato Chips", price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("Twinkies")
    expect(page).to have_content("Potato Chips")
    expect(page).to have_content("3.25")
    expect(page).to have_content("2.5")
  end

  feature 'When a user visits a vending machine show page' do
    scenario 'they the avrage price of a snack' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1  = dons.snacks.create(name: "Twinkies", price: 3)
      snack_2  = dons.snacks.create(name: "Potato Chips", price: 5)

      visit machine_path(dons)

      expect(page).to have_content("4")
    end
  end
end
