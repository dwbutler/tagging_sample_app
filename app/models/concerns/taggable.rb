module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tags, as: :tagged

    def tag!(name)
      tags.create!(name: name)
    end
  end
end
