require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "Text rendered in nav bar change to 'My Cart (1)' after click on 'Add' button" do
    # ACT
    visit root_path
    click_on 'Add'
    
    # DEBUG
    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end

end
