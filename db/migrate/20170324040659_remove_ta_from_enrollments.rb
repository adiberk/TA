class RemoveTaFromEnrollments < ActiveRecord::Migration[5.0]
  def change
    remove_column :enrollments, :ta, :boolean
  end
end
