require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:price)}
    it {is_expected.to validate_presence_of(:quantity)}
    it {is_expected.to validate_presence_of(:category)}
  end
end






#     describe '#name' do
#       it 'should have an assigned name' do
#         @category = Category.new
#         @product = Product.new
#         expect(@product.name).to be_present
#       end
#     end

#   describe '#price' do
#     it 'should have an assigned price' do
#       @category = Category.new
#       @product = Product.new
#       expect(@product.price).to be_present
#     end
#   end

#   describe '#quantity' do
#     it 'should have a specific quantity assigned' do
#       @category = Category.new
#       @product = Product.new
#       expect(@product.quantity).to be_present
#     end
#   end
#   describe '#category' do
#     it 'should have an assigned category' do
#       @category = Category.new
#       @product = Product.new
#       expect(@product.category).to be_present
#     end
#   end
# end



# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true