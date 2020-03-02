class AjouteDesClesEtranger < ActiveRecord::Migration[6.0]
  def change
    add_column :voitures, :marque_id, :integer
    add_column :voitures, :personne_id, :integer
  end
end
