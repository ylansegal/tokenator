class CreateTokens < ActiveRecord::Migration[4.2]
  def change
    create_table :tokens do |t|
      t.string :name
      t.string :secret
      t.references :user

      t.timestamps
    end

    add_index :tokens, :user_id
  end
end
