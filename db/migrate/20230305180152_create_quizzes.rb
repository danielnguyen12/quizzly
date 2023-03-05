class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.string :topic
      t.integer :level
      t.text :objectives
      t.string :format
      t.integer :length

      t.timestamps
    end
  end
end
