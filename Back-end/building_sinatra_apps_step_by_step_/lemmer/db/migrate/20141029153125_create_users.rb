class CreateUsers < ActiveRecord::Migration
  def change
    create_table :lems do |t|
      t.text :body
      t.references :user

      t.timestamps
    end
  end
end
