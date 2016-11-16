# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'
require_relative 'treasure'
require_relative 'bad_consequence'
require_relative 'monster'
require_relative 'player'
require_relative 'combat_result'
require_relative 'card_dealer'

class Napakalaki
  include Singleton
  
  attr_accessor :currentPlayer, :players, :dealer, :currentMonster
    
  def initialize
    @players=Array.new
  end
  
  private
  def initPlayers()
  end
  
  private
  def nextPlayer()
  end
  
  private
  def nextTurnAllowed()
  end
  
  private
  def setEnemies()
  end
  
  public
  def developCombat()
  end
  
  def discardVisibleTreasures(treasures)
  end
  
  def discardHiddenTreasures(treasures)
  end
  
  def makeTreasuresVisible(treasures)
  end
  
  def initGame(players)
  end
  
  def getCurrentPlayer()
  end
  
  def getCurrentMonster()
  end
  
  def nextTurn()
  end
  
  def endOfGame(result)
  end
end
