class CreateLargestRanges < ActiveRecord::Migration[6.1]
  def change
    create_table :largest_ranges do |t|
      t.string :end_array

      t.timestamps
    end
  end
end
