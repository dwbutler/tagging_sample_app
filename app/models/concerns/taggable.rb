module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tags, as: :tagged, dependent: :destroy

    def tag_list
      tags.pluck(:name)
    end

    def tag!(*names)
      Array.wrap(names.flatten).compact.each do |name|
        tags.create!(name: name)
      end
    end

    def replace_tags(*names)
      transaction do
        tags.delete_all
        tag!(*names)
      end
    end
  end
end
