require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it "is valid with valid attributes" do
      @category1 = Category.find_or_create_by! name: 'category1'
      @product = @category1.products.create!({
        name:  'Test Product',
        quantity: 10,
        price: 10.00
      })
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category1 = Category.find_or_create_by! name: 'category1'
      @product = Product.new({
        name: nil,
        quantity: 4,
        price: 34.99,
        category: @category1
      })
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category1 = Category.find_or_create_by! name: 'category1'
      @product = Product.new({
        name:  'Test Product 2',
        quantity: 10,
        price: nil
      })
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category1 = Category.find_or_create_by! name: 'category1'
      @product = Product.new({
        name: 'Test Product 3',
        quantity: nil,
        price: 19.99,
        category: @category1
      })
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product = Product.new({
        name: 'Test Product 4',
        quantity: 29,
        price: 4.99,
        category: nil
      })
      expect(@product).to_not be_valid
    end

  end
end