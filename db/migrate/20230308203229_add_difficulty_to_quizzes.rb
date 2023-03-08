class AddDifficultyToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :difficulty, :string
  end
end
