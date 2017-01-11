# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class NumericBadConsequence < BadConsequence
    
    attr_reader  :nVisibleTreasures, :nHiddenTreasures
    
    def initialize(aText, someLevels,someVisibleTreasures=0, someHiddenTreasures=0)
      super(aText,someLevels)
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
    end
    
    def getNVisibleTreasures
      @nVisibleTreasures
    end

    def getNHiddenTreasures
      @nHiddenTreasures
    end
    
    def isEmpty
      return @nVisibleTreasures==0 && @nHiddenTreasures==0
    end
    
    def adjustToFitTreasureLists(v,h)
      nV = [@nVisibleTreasures,v.size].min
      nH = [@nHiddenTreasures,h.size].min
      return NumericBadConsequence.new(@text, @levels,nV,nH)
    end
    
    def substracHiddenTreasure(t)
      if(@nHiddenTreasures > 0)
        @nHiddenTreasures = @nHiddenTreasures-1 
      end
      
    end

    def substracVisibleTreasure(t)
      if(@nVisibleTreasures > 0)
        @nVisibleTreasures = @nVisibleTreasures-1 
      end
      
    end
    
    def to_S
      super
      "\n nVisibleTreasures= #{@nVisibleTreasures}, 
      \n nHiddenTreasures=#{@nHiddenTreasures};"
    end
  end
end