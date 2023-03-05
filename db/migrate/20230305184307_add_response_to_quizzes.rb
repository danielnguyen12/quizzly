class AddResponseToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :response, :text
  end
end
