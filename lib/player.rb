# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  
  attr_reader :name, :level, :dead, :hiddenTreasures, :visibleTreasures, :pendingBadConsequence
  attr_accessor :canISteal, :enemy
  
  @@MAXLEVEL=10
  def initialize(name)
    @name=name
  end
  
  def getName
    @name
  end
  
  private
  def bringToLife
    @dead = false
  end
  
  private
  def getCombatLevel
    sumador = @level
    for i in @visibleTreasures.size
      sumador += @visibleTreasures.at(i).getBonus
    end
    return sumador
  end
  
  private
  def incrementLevels(l)
    if(l+@level<=10)
      @level += l
    else
      @level = 10
    end
  end
  
  private
  def decrementLevels(l)
    if(@level-l>=1)
      @level -= l
    else
      @level = 1
    end
    
  end
  
  private
  def setPendingBadConsequence(b)
    @pendingBadConsequence=b
  end
  
  private
  def applyPrize(m)
  end
  
  private
  def applyBadConsequence(m)
  end
  
  private
  def canMakeTreasureVisible(t)
  end
  
    
  private
  def howManyVisibleTreasures(tKind)
    retorno = 0 
    for i in @visibleTreasures.length
      if(@visibleTreasures.at(i).getType == tKind)
        retorno+=1
      end
    end
    return retorno
  end
  
  private
  def dieIfNoTreasures
    @comprobador = false
    for i in @hiddenTreasures.length
      if(@hiddenTreasures.at(i)!=nil)
        comprobador = true
      end
    end
    for i in @visibleTreasures
      if(@visibleTreasures.at(i)!=nil)
        comprobador = true
      end
    end
    
    if(comprobador)
      @dead = false
    else
      @dead = true
    end
  end  
  
  public 
  def isDead
    @dead
  end
  
  public
  def getHiddenTreasures
    @hiddenTreasures
  end
  
  public
  def getVisibleTreasures
    @visibleTreasures
  end
  
  public
  def combat(m)
  end
  
  public
  def makeTreasureVisible(t)
  end
  
  public
  def discardVisibleTreasure(t)
  end
  
  public
  def discardHiddenTreasure(t)
  end
  
  public
  def validState
    retorno=false
    if(@pendingBadConsequence.isEmpty && @hiddenTreasures<=4)
      retorno=true
    end
    return retorno
  end
  
  public
  def initTreasures
  end
  
  public
  def getLevels
    @level
  end
  
  public
  def stealTreasure
  end
  
  public
  def setEnemy(enemy)
    @enemy=enemy
  end
  
  private
  def giveMeATreasure
  end
  
  public
  def canISteal
    @canISteal
  end
  
  private
  def canYouGiveMeATreasure
    retorno=false
    if(@visibleTreasures.length>0)
      retorno=true
    end
    return retorno
  end
  
  private
  def haveStolen
    @canISteal=false
  end
  
  public
  def discardAllTreasures
  end  
end
