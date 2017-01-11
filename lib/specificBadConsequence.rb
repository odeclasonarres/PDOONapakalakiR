# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class SpecificBadConsequence < BadConsequence
      attr_reader :specificHiddenTreasures, :specificVisibleTreasures
      
    def initialize(text,level,someSpecificVisibleTreasures=Array.new, someSpecificHiddenTreasures=Array.new)
      super(text,level)
      if(someSpecificHiddenTreasures!=nil)
        @specificHiddenTreasures = Array.new(someSpecificHiddenTreasures)
      else
        @specificHiddenTreasures = Array.new
      end
      if(someSpecificVisibleTreasures!=nil)
        @specificVisibleTreasures = Array.new(someSpecificVisibleTreasures)
      else
        @specificVisibleTreasures = Array.new
      end
    end
    
    def getSpecificVisibleTreasures
      @specificVisibleTreasures
    end

    def getSpecificHiddenTreasures
      @specificHiddenTreasures
    end
    
    def isEmpty
      return @specificHiddenTreasures.size == 0 && @specificVisibleTreasures.size == 0
    end
    
    def adjustSpecific(tB,tJ)
      retorno = Array.new 
      x = 0
      arrayMalRollo = Array.new(tB)
      arrayMalRollo.each do |tipo|
        x=tJ.index(tipo)
        if(x!=nil)
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
      sV = Array.new
      sH = Array.new 
      sV = adjustSpecific(@specificVisibleTreasures,treasureToTreasureKind(v))
      sH = adjustSpecific(@specificHiddenTreasures,treasureToTreasureKind(h))
      return SpecificBadConsequence.new(@text, @levels,sV, sH)
    end
    
    def substracVisibleTreasure(t)
      if(!@specificVisibleTreasures.empty? && @specificVisibleTreasures.include?(t.getType))
        @specificVisibleTreasures.each do |sv|
          if(sv == t.getType)
            @specificVisibleTreasures.delete(t.getType)
          end
        end
      end
    end
    
    def substracHiddenTreasure(t)
      if(!@specificHiddenTreasures.empty? && @specificHiddenTreasures.include?(t.getType))
        @specificHiddenTreasures.each do |sv|
          if(sv == t.getType)
            @specificHiddenTreasures.delete(t.getType)
          end
        end
      end
    end
    
    public
    def getText
      super
    end

    def getLevels
      super
    end
    
    def to_S
      super
      "\n specificVisibleTreasures=#{@specificVisibleTreasures}
        \n specificHiddenTreasure=#{@specificHiddenTreasures}; }"
    end
    private :treasureToTreasureKind, :adjustSpecific
  end
end