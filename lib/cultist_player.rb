# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class CultistPlayer < Player

    @@totalCultistPlayers=0

    attr_accessor  :myCultistCard

    def initialize(p, c)
      newCopia(p)   ## Revisar
      @myCultistCard=c
      @@totalCultistPlayers=@@totalCultistPlayers+1
    end
    
    def self.newCopia(p)
      super(p)
    end

    def getCombatLevel
      #ACABAR tiene que truncar los decimales
      x = super+(super*0.7)+(@@totalCultistPlayers*@myCultistCard.gainedLevels)
      return x.to_i #posible solucion
    end

    def getOponentLevel(m)
      return m.getCombatLevelAgainstCultistPlayer
    end

    def shouldConvert
      d = Dice.instance
      if(d.nextNumber==6)
        return true
      end
      return false
    end

    def giveMeATreasure
      if(canYouGiveMeATreasure)
        tam = super.getEnemy.getVisibleTreasures.size
        return super.getEnemy.getVisibleTreasures.delete(rand(tam))
      end
      return nil
    end

    def canYouGiveMeATreasure
      if(super.getVisibleTreasures.size>0)
        return true
      end
      return false
    end

    def self.getTotalCultistPlayers
      return @@totalCultistPlayers
    end

    private :giveMeATreasure, :canYouGiveMeATreasure
    protected :getCombatLevel, :getOponentLevel, :shouldConvert
  end

end
