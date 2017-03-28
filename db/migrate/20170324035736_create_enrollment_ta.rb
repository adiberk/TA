class CreateEnrollmentTa < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollment_ta do |t|
      t.integer :course_id
      t.integer :user_id

      t.timestamps
    end
  end
end
