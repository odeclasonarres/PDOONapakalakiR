# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class DeathBadConsequence < NumericBadConsequence
    def initialize(aText)
      super(aText,Player.MAXLEVEL,BadConsequence.MAXTREASURES,BadConsequence.MAXTREASURES)
    end
  end
  
  def to_S
     "\n death=#{true};"
  end
end