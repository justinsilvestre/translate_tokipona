class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :source
      t.string :url
      t.text :original_text
      t.text :analysis

      t.timestamps null: false
    end
  end
end
