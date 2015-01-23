class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to  :user
      t.string      :survey_title #changed from :title


      t.timestamps
    end
  end
end
