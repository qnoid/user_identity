class CreateResidences < ActiveRecord::Migration
  def self.up
    create_table :residences do |t|
      t.string :residence
      t.boolean :isAuthorised
	  t.string :token

      t.references :user
      t.timestamps
    end
	add_index :residences, :residence
    add_index :residences, :token
  end

  def self.down
    drop_table :residences
  end
end
