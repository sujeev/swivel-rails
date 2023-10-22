require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:vertical) { create( :vertical)}

  it 'name present' do
    category = Category.new( vertical_id: vertical.id).save
    expect(category).to be_falsey
  end

  context 'when vertical exist with the same name' do
    it 'fails' do
      category = Category.new( name: "test_food", vertical_id: vertical.id).save
      expect(category).to be_falsey
    end
  end

  context 'when category exist with the same name' do
    it 'fails' do
      create( :category)
      category = Category.new( name: "test_diet", vertical_id: vertical.id).save
      expect(category).to be_falsey
    end
  end

  it 'happy path' do
    category = Category.new( name: "test", vertical_id: vertical.id).save
    expect(category).to be_truthy
  end
end
