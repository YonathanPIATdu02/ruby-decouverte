require 'date'

require 'yaml'


class Personne
    def initialize(nom, prenom, ddn, adresse=nil)
        @nom = nom
        @prenom = prenom

        if ddn.instance_of?(String)
            dateL=ddn.split('/')
            dateLIST=[]
            dateL.each do |dateLL|
                dateLIST.push(dateLL.to_i)
            end
            @ddn = Date.new(dateLIST[2], dateLIST[1], dateLIST[0])
        else
            @ddn = ddn
        end

        @adresse = adresse

        if defined?(@@tableau)
        else
            @@tableau = []
        end
        @id = Personne.nouvel_id
    end

    def self.sauvegarder (personne)
        @@tableau.push(personne)
    end

    def self.combien
        @@tableau.count
    end

    def id
        @id
    end

    def self.nouvel_id
        if @@tableau == []
            return 1
        else
            @idMax=1
            for i in @@tableau
                if @idMax<=i.id
                    @idMax = i.id+1
                end
            end
        end
        return @idMax
    end

    def self.dans_la_liste?(personne)
        res = false
        for i in @@tableau
            if personne = i
                res = true
            end
        end
        return res
    end

    def self.supprimer(personne)
        personne.delete
    end

    def self.toutes
        @@tableau
    end
def id
        return @id
    end

    def sauvegarder!
        Personne.sauvegarder self
        "Personne sauvegardée"
    end

    def deja_sauvegarde?
        res = false
        for i in @@tableau
            if i = self
                res = true
            end
        end
        return res
    end

    def supprimer!
        @@tableau.delete_at(self.id-1)
        "Personne supprimée"
    end

    def age
        day = (Date.today - @ddn).to_i / 365
    end

    # Lire un fichier de nom et de prénoms
    # Générer des personnes avec une DDN aléatoire (par défaut, 100 personnes)
    def self.creer_en_masse nombre: 100
        tableauPrenomNom = YAML.load_file("noms_prenoms.yml")    
        today = Date.today
        nombre.time do
            # Je crée une instance avec un nom, un prénom et une date de naissance alétaoire
            p = Personne.new tableauPrenomNom["nom"],tableauPrenomNom["prenom"],Date.today
            # et je l'ajoute à la liste
            Personne.sauvegarder p
        end
    end
end

#personne = Personne.new 'DUPONT','Robert','12/12/1922'

#p personne


=begin
    p1 = Personne.new 'DUPONT', 'Bob', '01/02/2000'
    p2 = Personne.new 'DUPONT', 'Sophie', '04/12/2009'
    p3 = Personne.new 'JOBS', 'Steve', '24/02/1955'

    Personne.sauvegarder p1
    Personne.sauvegarder p2
    Personne.sauvegarder p3

    p Personne.combien
=end


=begin
    p = Personne.new "ORLERUBY", "Jade", "10/12/2003"
    Personne.sauvegarder p

    p = Personne.new "IUT", "Reims", "01/01/1969", "Chemin des rouliers, 51100 REIMS"
    Personne.sauvegarder p

    p = Personne.new "PENNAF", "Chris", "26/12/1970", "Rue Fernand Cerveau, 51100 REIMS"
    Personne.sauvegarder p

    p Personne.combien
=end

=begin
    personne = Personne.new 'DUPONT','Robert','12/12/1922'
    p personne.sauvegarder!
    p personne.deja_sauvegarde?
    p personne.supprimer!
    p personne.deja_sauvegarde?
=end

personne = Personne.new 'DUPONT','Robert','12/12/1922'

p personne.age