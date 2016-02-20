class Tag < ApplicationRecord
  validates_uniqueness_of :name, scope: [:tagged_id, :tagged_type]
  belongs_to :tagged, polymorphic: true
end
