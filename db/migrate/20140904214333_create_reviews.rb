class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :pull_request_url, null: false, default: ""
      t.string :coach, null: false, default: ""
      t.boolean :active, null: false, default: false
      t.boolean :finished, null: false, default: false

      t.timestamps
    end
  end
end
