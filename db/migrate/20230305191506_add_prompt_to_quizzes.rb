class AddPromptToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :prompt, :text
  end
end
