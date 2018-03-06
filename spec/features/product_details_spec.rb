require 'rails_helper'

RSpec.feature "User can navigate from home page to ProductDetails by clicking on a product", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    click_on 'Details'

    sleep 3

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'Name'
  end

end
