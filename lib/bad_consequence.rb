# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding utf-8
require_relative 'player'


class BadConsequence
  
  
  @@MAXTREASURES=4
  
  attr_reader :MAXTREASURES, :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures
  def initialize(aText, someLevels=0, someVisibleTreasures=0, someHiddenTreasures=0,someSpecificVisibleTreasures=Array.new, someSpecificHiddenTreasures=Array.new, death=false) 
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @death=death
    @specificHiddenTreasures=someSpecificHiddenTreasures
    @specificVisibleTreasures=someSpecificVisibleTreasures
  end
  
  def self.newLevelNumberOfTreasures(aText, someLevels,someVisibleTreasures, someHiddenTreasures)
    new(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
  end
  
  def self.newLevelSpecificTreasures(aText, someLevels,someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
  end
  
  def BadConsequence.newDeath(aText)
    new(aText, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, Array.new, Array.new, true)
  end
  
  def isEmpty
    retorno=false
    if(@nVisibleTreasures==0 && @nHiddenTreasures==0 && @specificHiddenTreasures==nil && @specificVisibleTreasures==nil)
      retorno=true
    end
    return retorno
  end
  
  def getLevels
    @levels
  end  
    
  def getNVisibleTreasures
    @nVisibleTreasures
  end
  
  def getNHiddenTreasures
    @nHiddenTreasures
  end
  
  def getSpecificVisibleTreasures
    @specificVisibleTreasures
  end
  
  def getSpecificHiddenTreasures
    @specificHiddenTreasures
  end
  
  def substracHiddenTreasure(t)
    if(@nHiddenTreasures > 0)
      @nHiddenTreasures = @nHiddenTreasures-1 
    end
    if(!@specificHiddenTreasures.empty? && @specificHiddenTreasures.include?(t))
      @specificHiddenTreasures.each do |sv|
        if(sv == t.getType)
          @specificHiddenTreasures.delete(t.getType)
        end
      end
    end
  end
  
  def substracVisibleTreasure(t)
    if(@nVisibleTreasures > 0)
      @nVisibleTreasures = @nVisibleTreasures-1 
    end
    if(!@specificVisibleTreasures.empty? && @specificVisibleTreasures.include?(t))
      @specificVisibleTreasures.each do |sv|
        if(sv == t.getType)
          @specificVisibleTreasures.delete(t.getType)
        end
      end
    end
  end
  
  def adjustSpecific(tB,tJ)
    retorno = Array.new 
    tB.each do |tipo|
      x=tJ.index(tipo)
      if(x>=0)
        retorno << tJ.delete_at(x) 
      end
    end
    return retorno
  end
  
  def treasureToTreasureKind(t)
    retorno = Array.new 
    t.each do |tk|
      retorno << tk.getType
    end
    return retorno
  end
  
  def adjustToFitTreasureLists(v,h)
    if(@nVisibleTreasures !=0 || @nHiddenTreasures !=0)
      nV = [@nVisibleTreasures,v.size].min
      nH = [@nHiddenTreasures,h.size].min
      retorno = self.newLevelNumberOfTreasures(@text, @levels,nV,nH)
    else
      sV = Array.new
      sH = Array.new 
      sV = adjustSpecific(@specificVisibleTreasures,treasureToTreasureKind(v))
      sH = adjustSpecific(@specificHiddenTreasures,treasureToTreasureKind(h))
      retorno = self.newLevelSpecificTreasures(@text, @levels,sV, sH)
    end
    return retorno
  end
  
  def to_S
    "BadConsequence{ text= #{@text}; \n levels=#{@levels}; \n nVisibleTreasures= #{@nVisibleTreasures}, 
    \n nHiddenTreasures=#{@nHiddenTreasures}; \n death=#{@death}; \n specificHiddenTreasure=#{@specificHiddenTreasures}; 
    \n specificVisibleTreasures=#{@specificVisibleTreasures} }"
  end
  
  private_class_method :new 
  private :treasureToTreasureKind, :adjustSpecific
end

