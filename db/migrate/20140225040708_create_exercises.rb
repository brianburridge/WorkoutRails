class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :machine_weight
      t.boolean :split, :default => false
      t.boolean :record_per_dumbbell, :default => false
      t.timestamps
    end
  end
end
