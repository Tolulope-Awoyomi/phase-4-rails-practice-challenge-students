class AddForeignKeyToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :instructor_id, :integer
    add_foreign_key :students, :instructors
  end
end
