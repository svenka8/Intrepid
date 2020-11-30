class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.boolean :proactive
      t.boolean :tasking
      t.boolean :claim
      t.boolean :assessment
      t.boolean :collection

      t.timestamps
    end
  end
end
