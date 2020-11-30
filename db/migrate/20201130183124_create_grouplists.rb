class CreateGrouplists < ActiveRecord::Migration[6.0]
  def change
    create_table :grouplists do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
