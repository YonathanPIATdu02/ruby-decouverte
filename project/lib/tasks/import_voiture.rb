contenu = File.read('db/voitures.xml')
h = Hash.from_xml(contenu)

# gem 'awesome_print'


h["voitures"].each do |voiture|
    marque = Marque.where(libelle: voiture["marque"]["nom"]).first
    if marque==nil
        # marque = Marque.new
        # marque.libelle = voiture["marque"]["nom"]
        # marque.save
        marque = Marque.create!(libelle: voiture["marque"]["nom"])
    end

    ma_voiture = Voiture.new
    ma_voiture.couleur = voiture["couleur"]
    # ma_voiture.voitureid = voiture["id"]
    ma_voiture.immatriculation = voiture["immatriculation"]
    ma_voiture.modele =  voiture["modele"]
    # ma_voiture.date_mise_en_service = voiture["created_at"]
    ma_voiture.marque_id = marque.id
    ma_voiture.save!
end