class RemoveResponseFromQuizzes < ActiveRecord::Migration[7.0]
  def change
    remove_column :quizzes, :response, :text
  end
end
