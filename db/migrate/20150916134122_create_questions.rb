class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user, index: true, null: false
      t.text :title, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
