class ChangeQuizlengthToNumberofQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :quizzes, :length, :integer
    add_column :quizzes, :numberOfQuestions, :integer
  end
end
