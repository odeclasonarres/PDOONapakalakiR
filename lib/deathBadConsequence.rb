# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'bad_consequence.rb'
require_relative 'numericBadConsequence.rb'

module NapakalakiGame
  class DeathBadConsequence < NumericBadConsequence
    def initialize(aText)
      super(aText,Player.MAXLEVEL,getMAXTREASURES,getMAXTREASURES)
    end
  end
  
  def getMAXTREASURES
    super
  end
  
  public
  def getText
      super
  end

  def getLevels
    super
  end
  
  def to_S
     "\n death=#{true};"
  end
end