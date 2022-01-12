require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
  
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

  scenario "They see product details" do
    # ACT
    visit root_path
    click_on 'Details'
    
    # DEBUG
    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end

end