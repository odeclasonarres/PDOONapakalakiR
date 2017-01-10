# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class CultistPlayer < Player

    @@totalCultistPlayers=0

    attr_accessor :totalCultistPlayers, :myCultistCard

    def initialize(p, c)
      super(Player.(p.name,p.dead,p.pendingBadConsequence,p.level,p.nLevels,p.visibleTreasures,p.hiddenTreasures)) 
      @myCultistCard=c
      @@totalCultistPlayers=@@totalCultistPlayers+1
    end

    def getCombatLevel

    end

    def getOponentLevel(m)

    end

    def shouldConvert

    end

    def giveMeATreasure

    end

    def canYouGiveMeATreasure

    end

    def self.getTotalCultistPlayers
      return @@totalCultistPlayers
    end

    private :giveMeATreasure, :canYouGiveMeATreasure
    protected :getCombatLevel, :getOponentLevel, :shouldConvert
  end

end