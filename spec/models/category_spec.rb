require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:vertical) { create( :vertical)}

  describe 'validations' do
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

  describe 'delete' do
    it 'delete category' do
      category = create( :category)
      expect{ category.delete}.to change{Category.count}.by(-1)
    end

    context 'when category have courses' do
      it 'delete vertical' do
        course = create( :course)
        expect{ course.category.delete}
          .to change{ Category.count}.by(-1)
          .and change{ Course.count}.by(-1)
      end
    end
  end
end
