class Voiture < ApplicationRecord
    belongs_to :marque, required: false # Nom de la classe étrangère, en snake_case
    belongs_to :personne, required: false
    def age
        ((Date.today - date_mise_en_service)/365.25).floor
    end
    
end
