require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    describe "product" do
      it 'should have the 4 fields validated' do
        @category1 = Category.find_or_create_by! name: 'category1'
        @product = @category1.products.create!({
          name:  'Test Product',
          quantity: 10,
          price: 10.00
        })
        expect(@product.name).not_to be nil
        expect(@product.price).not_to be nil
        expect(@product.quantity).not_to be nil
        expect(@product.category).not_to be nil
      end
    end

    # validate name
    describe "product" do
      before do
        @category1 = Category.find_or_create_by! name: 'category1'
        @product = @category1.products.create!({
          name: nil,
          quantity: 4,
          price: 34.99
        })
      end
      it 'expect product name to be validate' do
        expect(@product.name).to be nil
      end
    end

    describe "product" do
      before do
        @category1 = Category.find_or_create_by! name: 'category1'
        @product = @category1.products.create!({
          name:  'Test Product 2',
          quantity: 10,
          price: nil
        })
      end
      it 'expect product price to be validate' do
        expect(@product.price).to be nil
      end
    end

    describe "product" do
      before do
        @category1 = Category.find_or_create_by! name: 'category1'
        @product = @category1.products.create!({
          name:  'Test Product 3',
          quantity: nil,
          price: 24.99
        })
      end
      it 'expect product quantity to be validate' do
        expect(@product.quantity).to be nil
      end
    end

    describe "product" do
      before do
        @category2 = nil
        @product = @category2.products.create!({
          name:  'Test Product 4',
          quantity: 29,
          price: 4.99
        })
      end
      it 'expect product category to be validate' do
        expect(@product.category).to be nil
      end
    end

  end
end