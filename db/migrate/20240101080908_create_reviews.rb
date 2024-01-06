class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :review
      t.string :name
      t.string :rating
      t.string :order_id

      t.timestamps
    end
  end
end
