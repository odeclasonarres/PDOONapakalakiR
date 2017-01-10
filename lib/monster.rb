# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#encoding utf-8
require_relative 'prize'
require_relative 'bad_consequence'

module NapakalakiGame

  class Monster
    attr_reader :name, :combatLevel, :prize, :badConsequence

      @levelChangeAgainstCultistPlayer=0
    def initialize(n,l, b,p, lC=0)
      @name=n
      @combatLevel=l
      @badConsequence=b
      @prize=p
      @levelChangeAgainstCultistPlayer=lC
    end

    def getName
      @name
    end

    def getCombatLevel
      @combatLevel
    end

    def getBadConsequence
      @badConsequence
    end

    def getLevelsGained
      @prize.getLevels 
    end

    def getTreasuresGained
      @prize.getTreasures
    end

    def getCombatLevelAgainstCultistPlayer

    end

    def to_s
      return "Monster{ nombre=  #{@name} ; \n nivel = #{@combatLevel}; \n Premio=#{@prize.to_S};
       \n Mal rollo=#{@badConsequence.to_S} }"
    end
  end

end
