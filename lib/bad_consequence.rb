# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding utf-8

class BadConsequence
  private_class_method :new
  
  @@MAXTREASURES=10
  
  attr_reader :MAXTREASURES, :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures
  def initialize(aText, someLevels=0, someVisibleTreasures=0, someHiddenTreasures=0,someSpecificVisibleTreasures=Array.new, someSpecificHiddenTreasures, death) 
    @text = text
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
    @text=aText
    @death=true
  end
  
  def isEmpty
    retorno=false
    if(@nVisibleTreasures==0 && @nHiddenTreasures==0 && @specificHiddenTreasures==nil && @specificVisibleTreasures==nil)
      retorno=true
    end
    return retorno
  end
  
  def getLevels
  end  
    
  def getNVisibleTreasures
  end
  
  def getNHiddenTreasures
  end
  
  def getSpecificVisibleTreasures
  end
  
  def getSpecificHiddenTreasures
  end
  
  def substracVisibleTreasure(t)
  end
  
  def substracHiddenTreasure(t)
  end
  
  def adjustToFitTreasureLists(v,h)
  end
  
  def to_S
    "BadConsequence{ text= #{@text}; \n levels=#{@levels}; \n nVisibleTreasures= #{@nVisibleTreasures}, 
    \n nHiddenTreasures=#{@nHiddenTreasures}; \n death=#{@death}; \n specificHiddenTreasure=#{@specificHiddenTreasure}; 
    \n specificVisibleTreasures=#{@specificVisibleTreasures} }"
  end
end
