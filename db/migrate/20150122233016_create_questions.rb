# new table of questions
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to  :survey
      t.string      :inputted_question


      t.timestamps
    end
  end
end
