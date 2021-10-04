class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.integer :size
      t.string :members, array: true
      t.timestamps
    end
  end
end
