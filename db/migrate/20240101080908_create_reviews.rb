class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :rating1
      t.string :rating2
      t.string :rating3
      t.string :rating4
      t.string :comments
      t.string :order_id

      t.timestamps
    end
  end
end
