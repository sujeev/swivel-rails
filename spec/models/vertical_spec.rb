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

    it 'happy path' do
      vertical = Vertical.new( name: "test").save
      expect(vertical).to be_truthy
    end
  end
end
