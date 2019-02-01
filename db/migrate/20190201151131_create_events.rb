class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :type
      t.references :actor, foreign_key: true
      t.references :repo
      t.datetime :created_at

      t.timestamps
    end
  end
end
