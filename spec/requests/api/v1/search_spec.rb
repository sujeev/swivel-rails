require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /search" do
    let!( :category) { create( :category, name: "science")}
    let!( :course1) { create( :course, name: "General science", author: "Education Dept", category_id: category.id, state: :course_active)}
    let!( :course2) { create( :course, name: "Human anatomy", author: "University grants com", category_id: category.id, state: :course_active)}
    let!( :course3) { create( :course, name: "Human anatomy: old", author: "University grants com", category_id: category.id, state: :course_suspended)}

    subject { get api_v1_search_search_path, params: params, headers: { Accept: 'application/json' } }

    context 'without search items' do

      let( :params) {}

      it "returns http success" do
        subject
        expect(response).to have_http_status(:success)
        response_json = JSON.parse(response.body)
        expect(response_json["term"]).to eq("*")
        expect(response_json["query"].count).to eq(2)
      end
    end

    context 'with search items' do
      before do
        Course.reindex
      end

      context 'with search string' do
        let( :params) {
          {
            search: "General"
          }
        }

        it "returns http success" do
          subject
          expect(response).to have_http_status(:success)
          response_json = JSON.parse(response.body)
          expect(response_json["term"]).to eq("General")
          expect(response_json["query"].count).to eq(1)
        end
      end


      context 'with search enum' do
        let( :params) {
          {
            search: "course_suspended"
          }
        }

        it "returns http success" do
          subject
          expect(response).to have_http_status(:success)
          response_json = JSON.parse(response.body)
          expect(response_json["term"]).to eq("course_suspended")
          expect(response_json["query"].count).to eq(1)
        end
      end
    end
  end

end
