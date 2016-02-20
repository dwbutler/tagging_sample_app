class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.references :tagged, polymorphic: true, null: false, index: true
      t.timestamps
    end
  end
end
