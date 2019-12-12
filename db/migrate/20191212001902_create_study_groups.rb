class CreateStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :study_groups do |t|
      t.belongs_to :course, null: false, foreign_key: true
      t.string :days
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
