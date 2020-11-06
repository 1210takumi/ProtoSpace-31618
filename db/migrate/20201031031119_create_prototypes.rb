class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|

      t.timestamps

      t.string    :title    
      t.text      :catch
      t.text      :consept
      t.references :user, foreign_key: true
    end
  end
end
