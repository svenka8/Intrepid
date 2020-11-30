class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :url
      t.string :course_name

      t.timestamps
    end
  end
end
