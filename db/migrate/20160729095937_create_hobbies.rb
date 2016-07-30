class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.string :name

      t.timestamps null: false
    end
    
    require 'active_record/fixtures'
    ActiveRecord::FixtureSet.create_fixtures 'spec/fixtures', 'hobbies'
  end
end
