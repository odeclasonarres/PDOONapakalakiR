# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding utf-8

require_relative 'bad_consequence'
require_relative 'monster'
require_relative 'prize'
require_relative 'treasure_kind'

class Prueba
  def combate10(monsters)
    monstruosn10 = Array.new 
      for i in 0..monsters.size-1
        if monsters[i].level >10
          monstruosn10<<monsters[i]
          puts "#{monster[i].toString}\n"
        end
      end
    return monstruosn10
  end
    
  def perderNiveles(monsters)
    monstruosquitan = Array.new
    for i in 0..monsters.size-1
        if(monsters[i].bq.levels>0 && monsters[i].bq.nHiddenTreasures == 0 && monsters[i].bq.nVisibleTreasures == 0)
            monstruosquitan<<monsters[i]   
            puts "#{monster[i].toString}\n"
        end
    end
    return monstruosquitan
  end
    
  def ganarNiveles(monsters)
    monstruosdan = Array.new
    for i in 0..monsters.size-1
        if monsters[i].prize.level>1
          monstruosdan<<monsters[i]  
          puts "#{monster[i].toString}\n"
        end
    end
    return monstruosdan
  end    
    
  def perderEspecifico(variable, monsters)
    monstruosquitad = Array.new
    for i in 0..monsters.size-1
        if (monsters[i].bq.specificHiddenTreasures ==variable || monsters[i].bq.SpecificVisibleTreasures==variable)
          monstruosquitad<<monsters[i] 
          puts "#{monster[i].toString}\n"
        end  
    end
    return monstruosquitad
  end  
end

p=Prueba.new
  
monsters = Array.new  
  
  @bad = BadConsecuence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles", 5, 3, 0)
  @prize = Prize.new(3,2)
  monsters<< Monster.new("El rey de rosado", 11, @bad, @prize)
 
  @bad = BadConsecuence.newLevelSpecificTreasures("Te atrapan para\n" +
            "llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 \n" +
            "mano visible y 1 mano oculta", 1,
             [TreasureKind::ONEHAND],
             [TreasureKind::ONEHAND])
  @prize = Prize.new(4,1)
  monsters<<(Monster.new("Demonios de Magaluf", 2,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta", 1,
             [TreasureKind::ARMOR],
             [TreasureKind::ARMOR]);
  @prize = Prize.new(2,1);
  monsters<<(Monster.new("3 Byakhees de bonanza", 8,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures("El primordial bostezocontagioso. Pierdes el calzado visible",
              1,[TreasureKind::HELMET],nil)
  @prize = Prize.new(1,1)
  monsters<<(Monster.new("Tenochtitlan", 2,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures("El primordial bostezocontagioso. Pierdes el calzado visible",
              1,[TreasureKind::SHOES],nil)
  @prize = Prize.new(1,1)
  monsters<<(Monster.new("El sopor de Dunwich", 2,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures(": Pierdes todos tus tesoros visibles",
          1,[TreasureKind::SHOES,TreasureKind::AMOR,TreasureKind::ONEHAND, TreasureKind::BOTHHANDS,TreasureKind::HELMET],
          nil)
  @prize = Prize.new(3,1)
  monsters<<(Monster.new("El gorron en el umbral", 13,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures("Pierdes la armadura visible", 1,
            [TreasureKind::ARMOR], nil)
  @prize = Prize.new(2,1)
  monsters<<(Monster.new("HP Munchcraft", 6,@bad, @prize))
  
  @bad= BadConsecuence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible",
              1,[TreasureKind::ARMOR], nil)
  @prize = Prize.new(1,1)
  monsters<<(Monster.new("Necrófago", 13,@bad, @prize))

  @bad = BadConsecuence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2, 0, 0)
  @prize = Prize.new(1,1)
  monsters<<(Monster.new("Flecher", 2,@bad, @prize))

  @bad = BadConsecuence.newDeath("Estos monstruos resultan bastantes
            superficiales y te aburren mortalmente. Estas muerto",true);
  @prize = Prize.new(2,1)
  monsters<<(Monster.new("Los hondos", 8,@bad, @prize))
  
  @bad = BadConsecuence.newLevelNumberOfTreasures("Mal rollo. Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
  @prize = Prize.new(2,1)
  monsters<<(Monster.new("Semillas Cthulhu", 4,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible",1,
            [TreasureKind::ONEHAND], nil)
  @prize = Prize.new(2,1)
  monsters<<(Monster.new("Dameargo", 1,@bad, @prize))
  
  @bad = BadConsecuence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles",3, 0, 0)
  @prize = Prize.new(2,1)
  monsters<<(Monster.new("Pollipólipo volante", 3,@bad, @prize))
  
  @bad = BadConsecuence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto", true)
  @prize = Prize.new(3,1);
  monsters<<(Monster.new("Yskhtihyssg-Goth", 14,@bad, @prize))

  @bad = BadConsecuence.newDeath("La familia te atrapa. Estas muerto.", true)
  @prize= Prize.new(3,1);
  monsters<<(Monster.new("Familia feliz", 1,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures("La quita directiva primaria te obliga a perder 2 niveles y un
          tesoro 2 manos visible", 2,[TreasureKind::BOTHHANDS], nil)
  @prize = Prize.new(2,1);
  monsters<<(Monster.new("Roboggoth", 8,@bad, @prize))
  
  @bad = BadConsecuence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible", 1,[TreasureKind::HELMET], nil)
  @prize= Prize.new(1,1);
  monsters<<(Monster.new("El espía sordo", 5,@bad, @prize))
  
  @bad = BadConsecuence.newLevelNumberOfTreasures("Menudo susto te llevas. Perdes 2 niveles y 5 tesoros visibles",
            2, 5, 0)
  @prize = Prize.new(1,1);
  monsters<<(Monster.new("Tongue", 20,@bad, @prize))
   
  @bad = BadConsecuence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros
           visibles de las manos", 3,[TreasureKind::BOTHHANDS], nil);
  @prize = Prize.new(2,1);
  monsters<<(Monster.new("Bicefalo", 21,@bad, @prize))
  
  p.combate10(monsters)
  p.perderNiveles(monsters) 
  p.ganarNiveles(monsters)
  p.perderEspecifico([TreasureKind::BOTHHANDS], monsters)
  p.perderEspecifico([TreasureKind::ONEHANDS], monsters)
  p.perderEspecifico([TreasureKind::HELMET], monsters)
  p.perderEspecifico([TreasureKind::ARMOR], monsters)
  p.perderEspecifico([TreasureKind::SHOES], monsters)
  