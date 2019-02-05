class AddEventsCounterToActor < ActiveRecord::Migration[5.2]
  def change
      add_column :actors, :events_count, :integer, default: 0
  end
end
