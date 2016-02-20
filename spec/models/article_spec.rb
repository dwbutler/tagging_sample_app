require 'rails_helper'

RSpec.describe Article, :type => :model do
  context "taggable" do
    it "allows tags to be added" do
      article = Article.create!(title: 'test')
      article.tag!("foo")
      expect(article.tags.count).to eq(1)
      expect(article.tags.first.name).to eq("foo")
    end
  end
end
