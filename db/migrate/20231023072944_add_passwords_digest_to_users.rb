class AddPasswordsDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :passwords_degist, :string
  end
end
