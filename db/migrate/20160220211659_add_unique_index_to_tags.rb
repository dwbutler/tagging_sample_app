class AddUniqueIndexToTags < ActiveRecord::Migration[5.0]
  def change
    add_index :tags, [:name, :tagged_id, :tagged_type], unique: true
  end
end
