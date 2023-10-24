require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do
  describe "GET /create" do
    subject { post api_v1_courses_path, params: params, headers: authenticated_header( { Accept: 'application/json' }) }
    let!(:category) { create( :category)}
    let(:params) {
      {
        course: {
          name: "abc",
          author: "xyz",
          state: :active,
          category_id: category.id  
        }
      }
    }

    it 'create course' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
    end
  end

  describe "GET /show" do
    before do
      create( :course)
    end

    subject { get api_v1_course_path( Course.first.id), headers: authenticated_header( { Accept: 'application/json' }) }

    it 'provide a course' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("book name")
    end
  end

  describe "GET /update" do
    before do
      create( :course)
    end

    subject { put api_v1_course_path( Course.first.id), params: params, headers: authenticated_header( { Accept: 'application/json' }) }

    let(:params) {
      {
        course: { name: "abc", author: "xyz", state: :suspended}
      }
    }

    it 'update course' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json["name"]).to eq("abc")
      expect( response_json["author"]).to eq("xyz")
      expect( response_json["state"]).to eq( "suspended")
    end
  end

  describe "GET /destroy" do
    before do
      create( :course)
    end

    subject { delete api_v1_course_path( Course.first.id), headers: authenticated_header( { Accept: 'application/json' }) }

    it 'delete course' do
      expect(subject).to eq 200
      expect( response.body).to eq("Course deleted")
    end
  end

  describe "GET /index" do
    before do
      create( :course)
      create( :course, state: :suspended)
    end

    subject { get api_v1_courses_path, headers: authenticated_header( { Accept: 'application/json' }) }

    it 'provide a list of courses' do
      expect(subject).to eq 200
      response_json = JSON.parse(response.body)
      expect( response_json.count).to eq(1)
      expect( response_json[0]["name"]).to eq("book name")
    end
  end
end
