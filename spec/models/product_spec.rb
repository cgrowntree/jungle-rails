require 'rails_helper'
require 'spec_helper'
require 'product'
require 'category'

RSpec.describe Product, type: :model do
  describe 'Saves' do
  it 'ensures all saves' do
    cat1 = Category.find_or_create_by! name: 'Apperal'
    product = cat1.products.create({
      name: "Phone", 
      price: 500, 
      quantity: 50, 
      category_id: 1 
    })
    expect(product.id).to be_truthy
  end
end

describe 'Validations' do
# validation tests/examples here
  it 'ensures name presence' do
    cat1 = Category.find_or_create_by! name: 'Apperal'
    product = cat1.products.create({
      price: 500, 
      quantity: 50, 
      category_id: 1 
    })
    expect(product.id).to be_nil
  end

  it 'ensures price presence' do
    cat1 = Category.find_or_create_by! name: 'Apperal'
    product = cat1.products.create({
      name: "Phone", 
      quantity: 50, 
      category_id: 1 
    })
    expect(product.id).to be_nil
  end

  it 'ensures quantity presence' do
    cat1 = Category.find_or_create_by! name: 'Apperal'
    product = cat1.products.create({
      name: "Phone", 
      price: 500, 
      category_id: 1 
    })
    expect(product.id).to be_nil
  end

  it 'ensures category presence' do
    product = Product.create({
      name: "Phone", 
      price: 500, 
      quantity: 50
    })
    expect(product.id).to be_nil
  end    
end
  
end