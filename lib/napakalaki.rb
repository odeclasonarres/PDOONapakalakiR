# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'treasure'
require_relative 'bad_consequence'
require_relative 'monster'
require_relative 'player'
require_relative 'combat_result'
require_relative 'card_dealer'

module NapakalakiGame

  
  require 'singleton'

  class Napakalaki
    include Singleton

    attr_accessor :currentPlayer, :players, :dealer, :currentMonster


    def initialize

    end


    def initPlayers(names)
      names.each do |n|
        @players << Player.new(n)
      end
    end


    def nextPlayer
      total_players = @players.size 
      x=0
      if (@currentPlayer == nil)   
        x = rand(total_players)    
      else    
        
        x = @players.index(@currentPlayer)  
        x = (x+1)%@players.size
        
        
        ## if (current_player_index == total_players) then
        ##  next_index = 0
        ## else
        ##  next_index = current_player_index + 1
        ## end
        
      end

      ## @currentPlayer = @players.at(next_index)
      
      return @players.at(x)
    end


    def nextTurnIsAllowed
      if @currentPlayer == nil 
        allowed = true
      else
        allowed = @currentPlayer.validState
      end
      return allowed
    end

    def setEnemies

      @players.each do |p|
        x = rand(@players.size)
        if(x==@players.index(p))
          if(@players.index(p)==@players.size-1)
            x=0
          else
            x=x+1
          end
        end
        p.setEnemy(@players[x])
      end
    end


    def developCombat
      retorno = @currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      return retorno
    end

    def discardVisibleTreasures(treasures)
      treasures.each do |t|
        @currentPlayer.discardVisibleTreasure(t)
      end
    end

    def discardHiddenTreasures(treasures)
      treasures.each do |t|
        @currentPlayer.discardHiddenTreasure(t)
      end
    end

    def makeTreasuresVisible(treasures)
      treasures.each do |t|
        @currentPlayer.makeTreasureVisible(t)
      end
    end

    def initGame(players)
      @players = Array.new
      @dealer = CardDealer.instance
      @currentPlayer = nil
      initPlayers(players) 
      setEnemies
      @dealer.initCards
      nextTurn
    end

    def getCurrentPlayer
      return @currentPlayer
    end

    def getCurrentMonster
      return @currentMonster
    end

    def nextTurn
      stateOk = nextTurnIsAllowed
      puts stateOk
      if(stateOk)
        @currentMonster = @dealer.nextMonster
        
        @currentPlayer = nextPlayer
        dead =  @currentPlayer.isDead
        if(dead)
          @currentPlayer.initTreasures
        end
      end
      return stateOk
    end

    def endOfGame(result)
      if result == WINGAME
        return true
      else
        return false
      end
    end

    private_class_method :new 
    private :initPlayers, :nextPlayer, :nextTurnIsAllowed, :setEnemies
  end

end