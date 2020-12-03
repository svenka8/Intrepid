class AddExpToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :Answers, :exp, :boolean
  end
end
