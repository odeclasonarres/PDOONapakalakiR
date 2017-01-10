# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding utf-8

module NapakalakiGame

  class Prize
    attr_reader :treasures, :levels
    def initialize(t, l)
      @treasures=t
      @levels=l
    end

    def getTreasures
      @treasures
    end

    def getLevels
      return @levels
    end

    def to_S
      "Tesoros ganados: #{@treasures} \n Niveles ganados: #{@level}"
    end
    
    private :treasures, :levels
  end

end

