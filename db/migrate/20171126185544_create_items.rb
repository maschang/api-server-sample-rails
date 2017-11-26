class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :jan
      t.string :name
      t.string :feature
      t.string :brand
      t.string :size
      t.string :category

      t.timestamps
    end
  end
end
