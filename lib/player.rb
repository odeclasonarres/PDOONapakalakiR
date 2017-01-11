# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind'
require_relative 'combat_result'
require_relative 'monster'
require_relative 'treasure'
require_relative 'dice'

module NapakalakiGame

  class Player


    attr_accessor :canISteal, :enemy, :name, :level, :dead, :pendingBadConsequence, :level, :hiddenTreasures, :visibleTreasures

    @@MAXLEVEL=10
    def initialize(name,l=1,ht=Array.new,vt=Array.new,d=true,cI=true, pending=BadConsequence.newLevelNumberOfTreasures("",0,0,0), enemy=nil)
      @name=name
      @level = l
      @hiddenTreasures = ht
      @visibleTreasures = vt
      @dead=d
      @canISteal=cI
      @pendigBadConsequence=pending
      @enemy=enemy
    end
    
    def self.newCopia(p)
      new(p.name,p.level,p.hiddenTreasures,p.visibleTreasures,p.dead,p.canISteal, p.pendingBadConsequence, p.enemy)
    end

    def self.MAXLEVEL
      @@MAXLEVEL
    end

    def getName
      @name
    end


    def bringToLife
      @dead = false
    end


    def getCombatLevel
      sumador = @level
      @visibleTreasures.each do |t|
        sumador += t.getBonus
      end
      return sumador
    end


    def incrementLevels(l)
      if(l+@level<=10)
        @level += l
      else
        @level = 10
      end
    end


    def decrementLevels(l)
      if(@level-l>=1)
        @level -= l
      else
        @level = 1
      end

    end


    def setPendingBadConsequence(b)
      @pendingBadConsequence=b
    end


    def applyPrize(m)
      nLevels = m.getLevelsGained
      incrementLevels(nLevels)
      nTreasures = m.getTreasuresGained
      if(nTreasures>0)
        dealer = CardDealer.instance
        for i in nTreasures
          t=dealer.nextTreasure
          @hiddenTreasures << t
        end
      end
    end


    def applyBadConsequence(m)
      badConsequence = m.getBadConsequence
      nLevels = badConsequence.getLevels
      decrementLevels(nLevels)
      pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)
    end


    def canMakeTreasureVisible(t)


      case t.getType
      when TreasureKind::BOTHHANDS
        @visibleTreasures.each do |tv|
          if(tv.getType == TreasureKind::BOTHHANDS || tv.getType == TreasureKind::ONEHAND)
            return false
          end
        end

      when TreasureKind::ONEHAND
        x=0
        @visibleTreasures.each do |tv|
          if(tv.getType == TreasureKind::BOTHHANDS)
            return false
          end
          if(tv.getType == TreasureKind::ONEHAND)
            x = x+1
          end
          if(x ==2)
            return false
          end
        end

      else
        @visibleTreasures.each do |tv|
          if(tv.getType == t.getType)
            return false
          end
        end

      end
      return true

    end



    def howManyVisibleTreasures(tKind)
      retorno = 0 
      for i in @visibleTreasures.length
        if(@visibleTreasures.at(i).getType == tKind)
          retorno+=1
        end
      end
      return retorno
    end


    def dieIfNoTreasures
      if(@hiddenTreasures.empty? && @visibleTreasures.empty?)
        @dead=true
      end
    end  


    def isDead
      @dead
    end


    def getHiddenTreasures
      return @hiddenTreasures
    end


    def getVisibleTreasures
      return @visibleTreasures
    end


    def combat(m)
      myLevel = getCombatLevel
      m.name
      monsterLevel = m.combatLevel  
      if(!canISteal)
        dice = Dice.instance
        number = dice.nextNumber
        if(number<3)
          enemyLevel = @enemy.getCombatLevel
          monsterLevel = monsterLevel + enemyLevel
        end
      end

      if(myLevel>monsterLevel)
        applyPrize(m)
        if(level>=MAXLEVEL)
          cr = CombatResult::WINGAME
        else
          cr = CombatResult::WIN
        end
      else
        applyBadConsequence(m)
        cr = CombatResult::LOSE
      end
      return cr
    end


    def makeTreasureVisible(t)
      canI = canMakeTreasureVisible(t)
      if(canI)
        @visibleTreasures << t
        @hiddenTreasures.delete(t)
      end
    end


    def discardVisibleTreasure(t)
      if(!@visibleTreasures.empty?)
        @visibleTreasures.delete(t)
      end
      if(@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty)
        @pendingBadConsequence.substracVisibleTreasure(t)
      end
      dieIfNoTreasures
      dealer = CardDealer.instance
      dealer.giveTreasureBack(t)
    end


    def discardHiddenTreasure(t)
      if(!@hiddenTreasures.empty?)
        @hiddenTreasures.pop(t)
      end

      if(@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty)
        @pendingBadConsequence.substracHiddenVisibleTreasure(t)
      end
      dieIfNoTreasures
      dealer = CardDealer.instance
      dealer.giveTreasureBack(t)
    end


    def validState
     ## retorno=false
     ## if(@pendingBadConsequence.isEmpty && @hiddenTreasures<=4)
     ##   retorno=true
     ## end
      return @pendingBadConsequence == nil || (@pendingBadConsequence.isEmpty && @hiddenTreasures.size <=4)
    end


    def initTreasures
      dealer = CardDealer.instance
      dice = Dice.instance 
      bringToLife
      treasure =dealer.nextTreasure
      @hiddenTreasures << treasure
      number = dice.nextNumber
      if(number > 1)
        treasure =dealer.nextTreasure
        @hiddenTreasures << treasure
      end
      if(number == 6)
        treasure =dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end


    def getLevels
      @level
    end


    def stealTreasure
      tesoro = nil
      canI = canISteal
      if(canI)
        canYou = @enemy.canYouGiveMeATreasure
        if(canYou)
          tesoro = @enemy.giveMeATreasure
          @hiddenTreasures << tesoro
          haveStolen
        end

      end
      return tesoro
    end


    def setEnemy(enemy)
      @enemy=enemy
    end


    def giveMeATreasure
      x = rand(@hiddenTreasures.size)
      t = @hiddenTreasures[x]
      @hiddenTreasures.delete(t)
    end


    def canISteal
      @canISteal
    end


    def canYouGiveMeATreasure
      retorno=false
      if(@visibleTreasures.length>0)
        retorno=true
      end
      return retorno
    end


    def haveStolen
      @canISteal=false
    end


    def discardAllTreasures
      while(!@visibleTreasures.empty?)
        discardVisibleTreasure(@visibleTreasures[0])
      end
      while(!@hiddenTreasures.empty?)
        discardHiddenTreasure(@hiddenTreasures[0])
      end

      ## @visibleTreasures.each do |t|
      ##  discardVisibleTreasure(t)
      ## end
      ## @hiddenTreasures.each do |t|
      ##  discardHiddenTreasure(t)
      ## end
    end 

    def getOponentLevel(m)

    end

    def shouldConvert
        return if @dice.nextNumber==6
    end

    def to_s
      "Nombre= #{@name} Nivel= #{@level} "
    end

    protected :getCombatLevel
    private :haveStolen, :canYouGiveMeATreasure, :giveMeATreasure, :dieIfNoTreasures, :howManyVisibleTreasures, :bringToLife,  :incrementLevels, :decrementLevels, :setPendingBadConsequence, :applyPrize, :applyBadConsequence, :canMakeTreasureVisible
  end

end
