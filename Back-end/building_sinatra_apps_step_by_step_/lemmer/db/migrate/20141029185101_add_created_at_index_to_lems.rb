class AddCreatedAtIndexToLems < ActiveRecord::Migration
  def change
    add_index(:lems, :created_at)
  end
end
