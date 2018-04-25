class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :password_digest
      t.string :token
      t.boolean :email_confirmed, default: false

      t.timestamps
    end
  end
end
