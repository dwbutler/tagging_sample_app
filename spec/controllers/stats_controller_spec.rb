require 'rails_helper'

RSpec.describe StatsController, :type => :controller do
  describe "GET #index" do
    it "returns the count of each tag" do
      %w(a a a b b c).each do |tag|
        article = Article.create!
        article.tag!(tag)
      end

      get :index
      expect(response).to be_success
      response_data = JSON.parse(response.body)
      expect(response_data).to match_array([
        { "tag" => "a", "count" => 3 },
        { "tag" => "b", "count" => 2 },
        { "tag" => "c", "count" => 1 }
      ])
    end

    it "returns an empty array if there are no tags" do
      get :index
      expect(response).to be_success
      expect(JSON.parse(response.body)).to eq([])
    end
  end
end
