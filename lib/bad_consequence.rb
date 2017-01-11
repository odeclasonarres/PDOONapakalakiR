# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding utf-8
require_relative 'player'

module NapakalakiGame

  class BadConsequence


    @@MAXTREASURES=4

    attr_reader :MAXTREASURES, :text, :levels, :death
    def initialize(aText, someLevels=0) 
      @text = aText
      @levels = someLevels
    end

    def getText
      @text
    end

    def getLevels
      @levels
    end  

    def to_S
      "BadConsequence{ text= #{@text}; \n levels=#{@levels};  "
    end

    protected :getLevels, :getText
    
  end

end
