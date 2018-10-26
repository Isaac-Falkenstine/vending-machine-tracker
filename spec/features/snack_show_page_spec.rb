require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see all of the Snacks info' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    larry  = owner.machines.create(location: "Larry's Mixed Drinks")
    snack_1  = dons.snacks.create(name: "Twinkies", price: 4)
    snack_2 = dons.snacks.create(name: "Potato Chips", price: 6)

    larry.snacks << snack_1

    visit snack_path(snack_1)

    expect(page).to have_content("Twinkies")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Larry's Mixed Drinks")
    expect(page).to have_content("4")
    expect(page).to have_content("5")
    expect(page).to have_content("2")
  end
end
