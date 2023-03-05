class CreateAiStories < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_stories do |t|
      t.text :prompt
      t.references :user, null: false, foreign_key: true
      t.text :response

      t.timestamps
    end
  end
end
