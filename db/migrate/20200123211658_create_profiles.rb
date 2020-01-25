class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :first_name
      t.string :last_name
      t.string :bio

      t.timestamps
    end
  end
end
