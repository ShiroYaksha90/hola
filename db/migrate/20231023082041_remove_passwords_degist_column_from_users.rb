class RemovePasswordsDegistColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :passwords_degist, :string
  end
end
