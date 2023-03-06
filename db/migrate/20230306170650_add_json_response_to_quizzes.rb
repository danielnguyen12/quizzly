class AddJsonResponseToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :response, :jsonb
  end
end
