require 'rails_helper'

RSpec.describe "Api::V1::Verticals", type: :request do

  describe "GET /index" do
    before do
      create( :vertical)
    end

    subject { get api_v1_verticals_path, headers: { Accept: 'application/json' } }

    it 'provide a list of verticals' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json[0]["name"]).to eq("test_food")
    end
  end

  describe "POST /create" do
    subject { post api_v1_verticals_path, params: params, headers: { Accept: 'application/json' } }

    let(:params) {
      {
        vertical: {name: "abc"}
      }
    }

    it 'create vertical' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
    end

    context 'create vertical with nested categories' do
      let(:params) {
        {
          vertical: {
            name: "food",
            categories_attributes: [
              { name: "vegetables"},
              { name: "fish"}
            ]  
          }
        }
      }  

      it 'create vertical with decendents' do
        expect(subject).to eq 200
        expect( Vertical.count).to eq 1
        expect( Category.count).to eq 2
      end
    end
  end

  describe "GET /show" do
    before do
      create( :vertical)
    end

    subject { get api_v1_vertical_path( Vertical.first.id), headers: { Accept: 'application/json' } }

    it 'provide a vertical' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("test_food")
    end
  end

  describe "PUT /update" do
    before do
      create( :vertical)
    end

    subject { put api_v1_vertical_path( Vertical.first.id), params: params, headers: { Accept: 'application/json' } }

    let(:params) {
      {
        vertical: {name: "abc"}
      }
    }

    it 'update vertical' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
    end

    context 'update vertical with nested categories' do
      let!(:category1) { create( :category, vertical_id: Vertical.first.id)}
      let!(:category2) { create( :category, name: "test_health", vertical_id: Vertical.first.id)}
      let(:params) {
        {
          vertical: {
            name: "food_stuff",
            categories_attributes: [
              { id: category1.id, name: "vegetables"},
              { id: category2.id, name: "fish"}
            ]  
          }
        }
      }  

      it 'create vertical with decendents' do
        expect(subject).to eq 200
        expect( Vertical.count).to eq 1
        expect( Category.count).to eq 2
        expect( Vertical.first.reload.name).to eq("food_stuff")
        expect( category1.reload.name).to eq("vegetables")
        expect( category2.reload.name).to eq("fish")
      end
    end

  end
  
  describe "DELETE /destroy" do
    before do
      create( :vertical)
    end

    subject { delete api_v1_vertical_path( Vertical.first.id), headers: { Accept: 'application/json' } }

    it 'delete vertical' do
      expect(subject).to eq 200
      expect( response.body).to eq("Vertical deleted")
    end
  end
end
