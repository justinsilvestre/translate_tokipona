class CreateEnglishPhrases < ActiveRecord::Migration
  def change
    create_table :english_phrases do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tokipona_phrase, index: true, foreign_key: true
      t.string :base_form
      t.string :role
      t.text :forms
      t.integer :uses

      t.timestamps null: false
    end
  end
end
