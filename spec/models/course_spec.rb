require 'rails_helper'

RSpec.describe Course, type: :model do
  let!(:category) { create( :category)}

  describe 'validations' do
    it 'name present' do
      course = Course.new( author: "abc", category_id: category.id).save
      expect(course).to be_falsey
    end

    it 'author present' do
      course = Course.new( name: "abc", category_id: category.id).save
      expect(course).to be_falsey
    end

    it 'happy path' do
      course = Course.new( name: "abc", author: "xyz", category_id: category.id).save
      expect(course).to be_truthy
    end
  end
end
