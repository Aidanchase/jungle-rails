require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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

  scenario "They see all products" do
    # ACT
    visit root_path

    # VERIFY
    expect(page).to have_css 'article.product', count: 10

  end
  scenario "They can look at one product" do
    
    visit "/"

    product_el = page.find('article.product:first-child')
    product_header = product_el.find("header h4")
    product_name = product_header.text
    product_header.click

    expect(page).to have_css("section.products-show")
    save_screenshot "detail_page.png"
    
    detail_header = page.find("header.page-header h1").text

    expect(detail_header).to end_with(product_name)
    
  end
end


