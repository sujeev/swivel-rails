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
      {name: "abc"}
    }

    it 'create vertical' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
    end

    # TODO: save nested objects
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
      {name: "abc"}
    }

    it 'update vertical' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
    end
  end
  
  describe "DELETE /destroy" do
    before do
      create( :vertical)
    end

    subject { delete api_v1_vertical_path( Vertical.first.id), headers: { Accept: 'application/json' } }

    it 'update vertical' do
      expect(subject).to eq 200
      expect( response.body).to eq("Vertical deleted")
    end
  end
end
