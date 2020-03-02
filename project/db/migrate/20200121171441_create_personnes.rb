class CreatePersonnes < ActiveRecord::Migration[6.0]
  def change
    create_table :personnes do |t|
      t.string :noms
      t.string :prenom
      t.string :date_naissance

      t.timestamps
    end
  end
end
