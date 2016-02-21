require 'rails_helper'

RSpec.describe Article, :type => :model do
  context "taggable" do
    let(:article) { Article.create!(title: 'test') }

    it "allows a tag to be added" do
      article.tag!("foo")
      expect(article.tags.count).to eq(1)
      expect(article.tags.first.name).to eq("foo")
    end

    it "allows multiple tags to be added" do
      article.tag!(%w(foo bar))
      expect(article.tags.count).to eq(2)
      expect(article.tag_list).to match_array(%w(foo bar))
    end

    it "replaces tags" do
      article.tag!(%w(a b))
      article.replace_tags(%(c d))
      expect(article.reload.tag_list).to match_array(%(c d))
    end
  end
end
