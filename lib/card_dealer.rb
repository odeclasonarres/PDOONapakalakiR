# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"
class CardDealer
  include Singleton
  
  attr_reader :usedTreasures, :unusedTreasures, :unusedMonsters, :usedMonsters
  def initialize
  end
  
  def initTreasureCardDeck
    @usedTreasures= Array.new
    @unusedTreasures= Array.new
    
    @unusedTreasures << Treasure.new("¡Śı mi amo!", 4,HELMET)
    @unusedTreasures << Treasure.new("Botas de investigación", 3, SHOES)
    @unusedTreasures << Treasure.new("Capucha de Cthulhu",3,HELMET)
    @unusedTreasures << Treasure.new("A prueba de babas", 2,ARMOR)
    @unusedTreasures << Treasure.new("Botas de lluvia ácida",1,BOTHHANDS)
    @unusedTreasures << Treasure.new("Casco minero",2,HELMET)
    @unusedTreasures << Treasure.new("Ametralladora ACME",4,BOTHHANDS)
    @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1,ARMOR)
    @unusedTreasures << Treasure.new("Clavo de rail ferroviario",3, ONEHAND)
    @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, ONEHAND)
    @unusedTreasures << Treasure.new("Fez alópodo", 3, HELMET)
    @unusedTreasures << Treasure.new("Hacha prehistórica",2, ONEHAND)
    @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, ARMOR)
    @unusedTreasures << Treasure.new("Gaita",4, BOTHHANDS)
    @unusedTreasures << Treasure.new("Insecticida", 2, ONEHAND)
    @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, BOTHHANDS)
    @unusedTreasures << Treasure.new("Garabato Mistico", 2, ONEHAND)
    @unusedTreasures << Treasure.new("La rebeca metálica", 2, ARMOR)
    @unusedTreasures << Treasure.new("Lanzallamas", 4, BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-comicón", 1, ONEHAND)
    @unusedTreasures << Treasure.new("Necronomicón", 5, BOTHHANDS)
    @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-gnomicón", 2, ONEHAND)
    @unusedTreasures << Treasure.new("Necrotelecom", 2, HELMET)
    @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, ONEHAND)
    @unusedTreasures << Treasure.new("Necro-playboycon", 3, ONEHAND)
    @unusedTreasures << Treasure.new("Porra preternatural", 2, ONEHAND)
    @unusedTreasures << Treasure.new("Shogulador", 1, BOTHHANDS)
    @unusedTreasures << Treasure.new("Varita de atizamiento", 3, ONEHAND)
    @unusedTreasures << Treasure.new("Tentácula de pega", 2, HELMET)
    @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, SHOES)
  end
  
  def initMonsterCardDeck
    @usedMonsters=Array.new
    @unusedMonsters=Array.new
    
    @bad = BadConsecuence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles", 5, 3, 0)
    @prize = Prize.new(3,2)
    @unusedMonsters<< Monster.new("El rey de rosado", 11, @bad, @prize)

    @bad = BadConsecuence.newLevelSpecificTreasures("Te atrapan para\n" +
              "llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 \n" +
              "mano visible y 1 mano oculta", 1,
               [TreasureKind::ONEHAND],
               [TreasureKind::ONEHAND])
    @prize = Prize.new(4,1)
    @unusedMonsters<<(Monster.new("Demonios de Magaluf", 2,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta", 1,
               [TreasureKind::ARMOR],
               [TreasureKind::ARMOR]);
    @prize = Prize.new(2,1);
    @unusedMonsters<<(Monster.new("3 Byakhees de bonanza", 8,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("El primordial bostezocontagioso. Pierdes el calzado visible",
                1,[TreasureKind::HELMET],nil)
    @prize = Prize.new(1,1)
    @unusedMonsters<<(Monster.new("Tenochtitlan", 2,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("El primordial bostezocontagioso. Pierdes el calzado visible",
                1,[TreasureKind::SHOES],nil)
    @prize = Prize.new(1,1)
    @unusedMonsters<<(Monster.new("El sopor de Dunwich", 2,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures(": Pierdes todos tus tesoros visibles",
            1,[TreasureKind::SHOES,TreasureKind::AMOR,TreasureKind::ONEHAND, TreasureKind::BOTHHANDS,TreasureKind::HELMET],
            nil)
    @prize = Prize.new(3,1)
    @unusedMonsters<<(Monster.new("El gorron en el umbral", 13,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("Pierdes la armadura visible", 1,
              [TreasureKind::ARMOR], nil)
    @prize = Prize.new(2,1)
    @unusedMonsters<<(Monster.new("HP Munchcraft", 6,@bad, @prize))

    @bad= BadConsecuence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible",
                1,[TreasureKind::ARMOR], nil)
    @prize = Prize.new(1,1)
    @unusedMonsters<<(Monster.new("Necrófago", 13,@bad, @prize))

    @bad = BadConsecuence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2, 0, 0)
    @prize = Prize.new(1,1)
    @unusedMonsters<<(Monster.new("Flecher", 2,@bad, @prize))

    @bad = BadConsecuence.newDeath("Estos monstruos resultan bastantes
              superficiales y te aburren mortalmente. Estas muerto",true);
    @prize = Prize.new(2,1)
    @unusedMonsters<<(Monster.new("Los hondos", 8,@bad, @prize))

    @bad = BadConsecuence.newLevelNumberOfTreasures("Mal rollo. Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
    @prize = Prize.new(2,1)
    @unusedMonsters<<(Monster.new("Semillas Cthulhu", 4,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible",1,
              [TreasureKind::ONEHAND], nil)
    @prize = Prize.new(2,1)
    @unusedMonsters<<(Monster.new("Dameargo", 1,@bad, @prize))

    @bad = BadConsecuence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles",3, 0, 0)
    @prize = Prize.new(2,1)
    @unusedMonsters<<(Monster.new("Pollipólipo volante", 3,@bad, @prize))

    @bad = BadConsecuence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto", true)
    @prize = Prize.new(3,1);
    @unusedMonsters<<(Monster.new("Yskhtihyssg-Goth", 14,@bad, @prize))

    @bad = BadConsecuence.newDeath("La familia te atrapa. Estas muerto.", true)
    @prize= Prize.new(3,1);
    @unusedMonsters<<(Monster.new("Familia feliz", 1,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("La quita directiva primaria te obliga a perder 2 niveles y un
            tesoro 2 manos visible", 2,[TreasureKind::BOTHHANDS], nil)
    @prize = Prize.new(2,1);
    @unusedMonsters<<(Monster.new("Roboggoth", 8,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible", 1,[TreasureKind::HELMET], nil)
    @prize= Prize.new(1,1);
    @unusedMonsters<<(Monster.new("El espía sordo", 5,@bad, @prize))

    @bad = BadConsecuence.newLevelNumberOfTreasures("Menudo susto te llevas. Perdes 2 niveles y 5 tesoros visibles",
              2, 5, 0)
    @prize = Prize.new(1,1);
    @unusedMonsters<<(Monster.new("Tongue", 20,@bad, @prize))

    @bad = BadConsecuence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros
             visibles de las manos", 3,[TreasureKind::BOTHHANDS], nil);
    @prize = Prize.new(2,1);
    @unusedMonsters<<(Monster.new("Bicefalo", 21,@bad, @prize))
  end
  
  def shuffleTreasures
    @unusedTreasures.shuffle
  end
  
  def shuffleMonsters
    @unusedMonster.shuffle
  end
  
  def nextTreasure
  end
  
  def nextMonster
  end
  
  def giveTreasureBack(t)
    @usedTreasures<<t
  end
  
  def giveMonsterBack(m)
    @usedMonsters<<m
  end
 
  def initCards
  end
end
