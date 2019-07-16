require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: :true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  "goat",
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "They click add to cart on a product" do
    visit "/"

    product_el = page.find("article.product:first-child")
    product_header = product_el.find("header h4")
    product_name = product_header.text
    add_to_cart = product_el.find("article.product footer.actions button")

    add_to_cart.click
    
    within "nav li.cart-size" do
      expect(page).to have_content("My Cart (1)")
    end

  end

end
