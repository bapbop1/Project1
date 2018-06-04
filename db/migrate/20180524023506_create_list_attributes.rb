class CreateListAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :list_attributes do |t|
      t.text :name

      t.timestamps
    end
  end
end
