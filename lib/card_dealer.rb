# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require "singleton"
require_relative 'treasure_kind'
require_relative 'monster'
require_relative 'treasure'
require_relative 'specificBadConsequence.rb'
require_relative 'deathBadConsequence.rb'
require_relative 'numericBadConsequence.rb'
require_relative 'cultist.rb'

module NapakalakiGame

  class CardDealer
    include Singleton

    attr_reader :usedTreasures, :unusedTreasures, :unusedMonsters, :usedMonsters, :unusedCultist
    def initialize
    end

    def initTreasureCardDeck
      @usedTreasures= Array.new
      @unusedTreasures= Array.new

      @unusedTreasures << Treasure.new("Si mi amo!", 4,TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigacion", 3, TreasureKind::SHOES)
      @unusedTreasures << Treasure.new("Capucha de Cthulhu",3,TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("A prueba de babas", 2,TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Botas de lluvia acida",1,TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Casco minero",2,TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Ametralladora ACME",4,TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1,TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario",3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Hacha prehistorica",2,TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Gaita",4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Escopeta de 3 caniones", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Garabato Mistico", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-comicon", 1, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necronomicon", 5, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-gnomicon", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necrotelecon", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necro-playboycon", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Tentacula de pega", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
    end

    def initMonsterCardDeck
      @usedMonsters= Array.new
      @unusedMonsters= Array.new

      bad = NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles", 5, 3, 0)
      prize = Prize.new(3,2)
      @unusedMonsters<< Monster.newBasico("El rey de rosado", 11, bad, prize)

      bad = SpecificBadConsequence.new("Te atrapan para\n" +
                "llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 \n" +
                "mano visible y 1 mano oculta", 1,
                 [TreasureKind::ONEHAND],
                 [TreasureKind::ONEHAND])
      prize = Prize.new(4,1)
      @unusedMonsters<<(Monster.newBasico("Demonios de Magaluf", 2,bad, prize))

      bad = SpecificBadConsequence.new("Pierdes tu armadura visible y otra oculta", 1,
                 [TreasureKind::ARMOR],
                 [TreasureKind::ARMOR]);
      prize = Prize.new(2,1);
      @unusedMonsters<<(Monster.newBasico("3 Byakhees de bonanza", 8,bad, prize))

      bad = SpecificBadConsequence.new("El primordial bostezocontagioso. Pierdes el calzado visible",
                  1,[TreasureKind::HELMET],nil)
      prize = Prize.new(1,1)
      @unusedMonsters<<(Monster.newBasico("Tenochtitlan", 2,bad, prize))

      bad = SpecificBadConsequence.new("El primordial bostezocontagioso. Pierdes el calzado visible",
                  1,[TreasureKind::SHOES],nil)
      prize = Prize.new(1,1)
      @unusedMonsters<<(Monster.newBasico("El sopor de Dunwich", 2,bad, prize))

      bad = SpecificBadConsequence.new(": Pierdes todos tus tesoros visibles",
              1,[TreasureKind::SHOES,TreasureKind::ARMOR,TreasureKind::ONEHAND, TreasureKind::BOTHHANDS,TreasureKind::HELMET],
              nil)
      prize = Prize.new(3,1)
      @unusedMonsters<<(Monster.newBasico("El gorron en el umbral", 13,bad, prize))

      bad = SpecificBadConsequence.new("Pierdes la armadura visible", 1,
                [TreasureKind::ARMOR], nil)
      prize = Prize.new(2,1)
      @unusedMonsters<<(Monster.newBasico("HP Munchcraft", 6,bad, prize))

      bad= SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible",
                  1,[TreasureKind::ARMOR], nil)
      prize = Prize.new(1,1)
      @unusedMonsters<<(Monster.newBasico("Necrofago", 13,bad, prize))

      bad = NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles", 2, 0, 0)
      prize = Prize.new(1,1)
      @unusedMonsters<<(Monster.newBasico("Flecher", 2,bad, prize))

      bad = DeathBadConsequence.new("Estos monstruos resultan bastantes
                superficiales y te aburren mortalmente. Estas muerto");
      prize = Prize.new(2,1)
      @unusedMonsters<<(Monster.newBasico("Los hondos", 8,bad, prize))

      bad = NumericBadConsequence.new("Mal rollo. Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
      prize = Prize.new(2,1)
      @unusedMonsters<<(Monster.newBasico("Semillas Cthulhu", 4,bad, prize))

      bad = SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible",1,
                [TreasureKind::ONEHAND], nil)
      prize = Prize.new(2,1)
      @unusedMonsters<<(Monster.newBasico("Dameargo", 1,bad, prize))

      bad = NumericBadConsequence.new("Da mucho asquito. Pierdes 3 niveles",3, 0, 0)
      prize = Prize.new(2,1)
      @unusedMonsters<<(Monster.newBasico("Pollipolipo volante", 3,bad, prize))

      bad = DeathBadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estas muerto")
      prize = Prize.new(3,1);
      @unusedMonsters<<(Monster.newBasico("Yskhtihyssg-Goth", 14,bad, prize))

      bad = DeathBadConsequence.new("La familia te atrapa. Estas muerto.")
      prize= Prize.new(3,1);
      @unusedMonsters<<(Monster.newBasico("Familia feliz", 1,bad, prize))

      bad = SpecificBadConsequence.new("La quita directiva primaria te obliga a perder 2 niveles y un
              tesoro 2 manos visible", 2,[TreasureKind::BOTHHANDS], nil)
      prize = Prize.new(2,1);
      @unusedMonsters<<(Monster.newBasico("Roboggoth", 8,bad, prize))

      bad = SpecificBadConsequence.new("Te asusta en la noche. Pierdes un casco visible", 1,[TreasureKind::HELMET], nil)
      prize= Prize.new(1,1);
      @unusedMonsters<<(Monster.newBasico("El espia sordo", 5,bad, prize))

      bad = NumericBadConsequence.new("Menudo susto te llevas. Perdes 2 niveles y 5 tesoros visibles",
                2, 5, 0)
      prize = Prize.new(1,1);
      @unusedMonsters<<(Monster.newBasico("Tongue", 20,bad, prize))

      bad = SpecificBadConsequence.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros
               visibles de las manos", 3,[TreasureKind::BOTHHANDS], nil);
      prize = Prize.new(2,1);
      @unusedMonsters<<(Monster.newBasico("Bicefalo", 21,bad, prize))
      
      
      #SECTARIOS
      bad=SpecificBadConsequence.new("Pierdes una mano visible",1,[TreasureKind::ONEHAND],[])
      prize=Prize.new(3,1) 
      @unusedMonsters<<(Monster.newLevelCultist("El mal indecible impronunciable",10,bad,prize,-2))

      bad = NumericBadConsequence.new("Pierdes tus tesores visibles jajaja",1,5,0)
      prize = Prize.new(2,1)
      @unusedMonsters<<(Monster.newLevelCultist("Testigos oculares", 6,bad,prize, 2))

      bad = DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres")
      prize = Prize.new(2,5)
      @unusedMonsters<<(Monster.newLevelCultist("El gran cthulhu", 20, bad,prize, 4))

      bad = NumericBadConsequence.new("Tu gorbierno te recorta 2 niveles", 2, 0, 0)
      prize = Prize.new(2,1)
      @unusedMonsters<<(Monster.newLevelCultist("Serpiente politico",8,bad,prize, -2))

      bad = SpecificBadConsequence.new("Pierdes tu caso y tu armadura visible. Pierdes tus manos ocultas", 1,
        [TreasureKind::HELMET,TreasureKind::ARMOR],[TreasureKind::BOTHHANDS,TreasureKind::ONEHAND])
      prize = Prize.new(1,1)
      @unusedMonsters<<(Monster.newLevelCultist("Felpuggoth",2,bad,prize, 5))

      bad = NumericBadConsequence.new("Pierdes 2 niveles", 2, 0, 0)
      prize = Prize.new(4,2)
      @unusedMonsters<<(Monster.newLevelCultist("Shoggoth", 16, bad,prize, -4))

      bad = NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles", 2, 0, 0)
      prize = Prize.new(1,1)
      @unusedMonsters<<(Monster.newLevelCultist("Lolitagooth", 2,bad,prize, 3))
      
      shuffleMonsters
    end

    def initCultistCardDeck
      @unusedCultist=Array.new
      name="1"
      gainedL=1 
      @unusedCultist<<Cultist.new(name,gainedL)

      name="2"
      gainedL=2
      @unusedCultist<<(Cultist.new(name, gainedL))

      name="3"
      gainedL=1
      @unusedCultist<< Cultist.new(name, gainedL)

      name="4"
      gainedL=2
      @unusedCultist<< Cultist.new(name, gainedL)

      name="5"
      gainedL=1
      @unusedCultist<< Cultist.new(name, gainedL)

      name="6"
      @unusedCultist<< Cultist.new(name, gainedL)

      shuffleCultist
    end

    def shuffleTreasures
      @unusedTreasures.shuffle
    end

    def shuffleMonsters
      @unusedMonsters.shuffle
    end

    def shuffleCultist
      @unusedCultist.shuffle
    end
    def nextTreasure
      if(@unusedTreasures.empty?)
        ##@unusedTreasures<<@usedTreasures
        @usedTreasures.each do |t|
          @unusedTreasures << @usedTreasures.delete(t)
        end
        
        shuffleTreasures
        @usedTreasures.clear
      end
      return @unusedTreasures.pop
    end

    def nextMonster
      if(@unusedMonsters.empty?)
        ##@unusedMonsters<<@usedMonsters
        @usedMonsters.each do |m|
          @unusedMonsters << @usedMonsters.delete(m)
        end
        
        shuffleTreasures
        @usedMonsters.clear
      end
      return @unusedMonsters.pop
    end

    def nextCultist
      return @unusedCultist.pop 
    end

    def giveTreasureBack(t)
      @usedTreasures<<t
    end

    def giveMonsterBack(m)
      @usedMonsters<<m
    end

    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
      initCultistCardDeck
      shuffleTreasures
      shuffleMonsters
      shuffleCultist
    end
    
    private_class_method :new 
    private :initTreasureCardDeck, :initMonsterCardDeck, :initCultistCardDeck, :shuffleTreasures, :shuffleMonsters, :shuffleCultist
  end

end
