class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string :title
      t.string :author
      t.integer :page_count
      t.integer :published_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
