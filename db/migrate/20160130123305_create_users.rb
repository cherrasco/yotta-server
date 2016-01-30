class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :devise_token

      t.timestamps null: false
    end

    add_index :users, :devise_token
  end
end
