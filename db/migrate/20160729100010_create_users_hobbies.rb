class CreateUsersHobbies < ActiveRecord::Migration
  def change
    create_table :users_hobbies do |t|
      t.integer :user_id,  :null => false
      t.integer :hobby_id,  :null => false
    end
    
    add_index :users_hobbies, :user_id
    add_index :users_hobbies, :hobby_id
 end
end
