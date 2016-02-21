require 'rails_helper'

RSpec.describe TagsController, :type => :controller do
  describe "POST #create" do
    it "creates a new entity" do
      post :create, entity_type: 'Article', entity_id: 10
      expect(Article.find(10)).to_not be_nil
    end

    it "creates tags" do
      post :create, entity_type: 'Article', entity_id: 1, tags: %w(a b c)
      article = Article.find(1)
      expect(article.tags.pluck(:name)).to match_array(%w(a b c))
    end

    it "replaces tags on an existing entity" do
      article = Article.create!
      article.tag!("a", "b")
      post :create, entity_type: 'Article', entity_id: article.id, tags: %w(foo bar)
      expect(article.reload.tag_list).to match_array(%w(foo bar))
    end
  end
end
