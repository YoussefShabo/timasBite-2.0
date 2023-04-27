class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      ## Remove the following line:
      # t.string :encrypted_password, null: false, default: ""

      ## Devise columns
      t.string :username, null: false, default: ""
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""
      t.index :uid, unique: true
      t.index [:uid, :provider], unique: true
    end

    ## Uncomment the following line to add Devise encrypted_password column:
    # add_column :users, :encrypted_password, :string, null: false, default: ""
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
