class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.boolean :joined
      t.references :user, index: true, foreign_key: true
      t.references :idea, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
