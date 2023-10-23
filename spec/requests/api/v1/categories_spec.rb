require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  describe "GET /create" do
    subject { post api_v1_categories_path, params: params, headers: { Accept: 'application/json' } }
    let!(:vertical) { create( :vertical)}
    let(:params) {
      {
        category: {
          name: "abc",
          vertical_id: vertical.id  
        }
      }
    }

    it 'create category' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
    end

    context 'when category has nested courses' do
      let(:params) {
        {
          category: {
            name: "abc",
            vertical_id: vertical.id,
            courses_attributes: [ { name: "alphabet", author: "Big bird", state: :course_active}]
          }
        }
      }
  
      it 'create category with courses' do
        expect(subject).to eq 200
        response_json = JSON.parse(response.body)
        expect( response_json["name"]).to eq("abc")
        expect( Category.count).to eq 1
        expect( Course.count).to eq 1
      end
    end
  end

  describe "GET /show" do
    before do
      create( :category)
    end

    subject { get api_v1_category_path( Category.first.id), headers: { Accept: 'application/json' } }

    it 'provide a category' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("test_diet")
    end
  end

  describe "GET /update" do
    before do
      create( :category)
    end

    subject { put api_v1_category_path( Category.first.id), params: params, headers: { Accept: 'application/json' } }

    let(:params) {
      {
        category: {name: "abc"}
      }
    }

    it 'update category' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
    end
  end

  describe "GET /destroy" do
    before do
      create( :category)
    end

    subject { delete api_v1_category_path( Category.first.id), headers: { Accept: 'application/json' } }

    it 'delete category' do
      expect(subject).to eq 200
      expect( response.body).to eq("Category deleted")
    end
  end

  describe "GET /index" do
    before do
      create( :category)
    end

    subject { get api_v1_categories_path, headers: { Accept: 'application/json' } }

    it 'provide a list of categories' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json[0]["name"]).to eq("test_diet")
    end
  end

end
