class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.boolean :admin, :default => false, :null => false
      t.timestamp :last_login_at
      t.timestamp :last_logout_at

      t.timestamps
    end

    add_index :users, :email, unique: true
    
    User.create! email: 'admin@hoge.com', password: 'password', 
      password_confirmation: 'password', admin: true
  end
end
