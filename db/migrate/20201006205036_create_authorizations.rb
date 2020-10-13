class CreateAuthorizations < ActiveRecord::Migration[6.0]
  def change
    create_table :authorizations, id: :uuid do |t|
      t.string :uid
      t.string :provider
      t.string :email

      t.timestamps
    end
  end
end
