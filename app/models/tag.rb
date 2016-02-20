class Tag < ApplicationRecord
  belongs_to :tagged, polymorphic: true
end
