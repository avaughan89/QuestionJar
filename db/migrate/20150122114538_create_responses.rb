class CreateResponses < ActiveRecord::Migration
  def change
    create_table    :responses do |t|
      t.belongs_to  :user, index: true
      # t.belongs_to  :survey, index: true
      t.belongs_to  :question

      t.string     :answer

      t.timestamps
    end
  end
end
