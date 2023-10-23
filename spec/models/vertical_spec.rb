require 'rails_helper'

RSpec.describe Vertical, type: :model do

  describe 'validations' do
    it 'name present' do
      vertical = Vertical.new.save
      expect(vertical).to be_falsey
    end

    context 'when vertical exist with the same name' do
      it 'fails' do
        create( :vertical)
        vertical = Vertical.new( name: "test_food").save
        expect(vertical).to be_falsey
      end
    end

    context 'when category exist with the same name' do
      it 'fails' do
        create( :category)
        vertical = Vertical.new( name: "test_diet").save
        expect(vertical).to be_falsey
      end
    end

    it 'happy path' do
      vertical = Vertical.new( name: "test").save
      expect(vertical).to be_truthy
    end
  end

  describe 'delete' do
    it 'delete vertical' do
      vertical = create( :vertical)
      expect{ vertical.delete}.to change{Vertical.count}.by(-1)
    end

    context 'when vertical have child categories' do
      it 'delete vertical' do
        category = create( :category)
        expect{ category.vertical.delete}
          .to change{Vertical.count}.by(-1)
          .and change{Category.count}.by(-1)
      end
    end

    context 'when vertical have child categories and courses' do
      it 'delete vertical' do
        category = create( :category)
        course = create( :course, category_id: category.id)
        expect{ category.vertical.delete}
          .to change{Vertical.count}.by(-1)
          .and change{Category.count}.by(-1)
          .and change{Course.count}.by(-1)
      end
    end
  end
end
