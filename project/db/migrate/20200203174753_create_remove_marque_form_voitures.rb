class CreateRemoveMarqueFormVoitures < ActiveRecord::Migration[6.0]
  def change
    remove_column :voitures ,:marque
  end
end
