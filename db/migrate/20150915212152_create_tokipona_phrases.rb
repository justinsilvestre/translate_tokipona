class CreateTokiponaPhrases < ActiveRecord::Migration
  def change
    create_table :tokipona_phrases do |t|
      t.string :words
      t.string :role

      t.timestamps null: false
    end
  end
end
