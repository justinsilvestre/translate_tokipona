class CreatePhrasePairings < ActiveRecord::Migration
  def change
    create_table :phrase_pairings do |t|
      t.references :translation, index: true, foreign_key: true
      t.references :english_phrase, index: true, foreign_key: true
      t.integer :place
      t.string :english_form

      t.timestamps null: false
    end
  end
end
