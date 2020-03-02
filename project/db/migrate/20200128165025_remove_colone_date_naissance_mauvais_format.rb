class RemoveColoneDateNaissanceMauvaisFormat < ActiveRecord::Migration[6.0]
  def change
    remove_column :personnes, :date_naissance
    add_column :personnes, :date_naissance, :date
  end
end
