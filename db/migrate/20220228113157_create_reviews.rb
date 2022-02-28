class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
