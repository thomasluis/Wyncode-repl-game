@deerprompt = "> "

##Classes

# defines main player
class Player
   attr_accessor :name
   attr_accessor :health
   attr_accessor :mana
   attr_accessor :stamina

   def initialize
      @health = 55
      @mana= 55
      @stamina = 55
   end
   # defines attack power of weapon calling it in
   def attack(weapon)
      rand(10) + weapon.power
   end
end

class Animal
   attr_accessor :health
   attr_accessor :name
end

class Deer < Animal

   def initialize
      @health = 20
   end
end

class Hare < Animal

   def initialize
      @health = 20
   end
end

class Weapon
   attr_accessor :power
end

class Mana < Weapon

   def initialize
      @power = 20
   end

end

#hunting bow and arrow
class Hbow < Weapon

   #initializes the power value. which will be called into the attack method
   def initialize
      @power = 20
   end

end
#Bandit's blade you can earn
class Bblade < Weapon

   #initializes the power value. which will be called into the attack method
   def initialize
      @power = 20
   end

end

#Variable definitiions

player = Player.new
playerbow = Hbow.new
playerbblade = Bblade.new
deer = Deer.new
$deer_health = deer.health
hare = Hare.new
$hare_health = hare.health
playermana = Mana.new
deer_equipped = nil
hare_equipped = nil
enter_cave = nil
frey_distraction = nil


$player_hunt_bow_attack = player.attack(playerbow)
$player_blade_attack = player.attack (playerbblade)
$player_mana_attack = player.attack (playermana)

#Methods

def get_user_name

   puts "Greetings adventurer! What is your name?"

   @name = gets.chomp

   puts "Welcome #{@name}."
end

def intro
   puts "rules of the game are simple. You're off on an adventure to get the famous Chilledge sword."
   puts "You arrive at the entrance of chill peak cave which is the rumored location of the sword."
end

def entrance_decision_enter_cave


   puts "One of the bandits stop you."
   puts "Bandit: Stop right there! You need to pay the toll to enter this cave."
   puts "(type no money, intimidate, run away)"
   while user_input = gets.chomp.downcase.rstrip.lstrip # loop while getting user input
      case user_input
      when "intimidate"
         puts entrance_decision_enter_cave_intimidate
         break # make sure to break so you don't ask again
      when "no money"
         puts entrance_decision_enter_cave_money
         break # and again
      when "run away"
         puts "as you run away the bandits shoot an arrow into you and you die."
         break
      else
         puts "type no money, intimidate, run away only!"
         # print the prompt, so the user knows to re-enter input
      end
   end
end

#agree to bandit's favor and start this story
def entrance_decision_enter_cave_intimidate
   puts "Bandit: oh? so you think you're tough? Tell you what, you defeat me and I'll give you my sword and free passage."
   puts "You get in a brawl with the bandit leader and win."
   puts "Bandit: Argh. no more please. you can go in the cave just please no more."
   puts "Bandit sword equipped"
   puts "Bandit Sword power: 20"
   @enter_cave = true
   @bandit_beat = true
end
def riddle_stamp


   puts "What can travel around the world while staying in a corner?"
   new_answer = gets.chomp.downcase.rstrip.lstrip


   if new_answer == "stamp"
      puts "Bandit: you're absolutelyl correct!"
      puts "Here take this sword as a prize"
      @enter_cave = true
      @bandit_beat = true
   else
      puts "Wrong! the answer is stamp"
      puts ":p"
      puts "Time to skin you alive :D!"
   end
end

def bandit_favor
   puts "Bandit: all I need you to do is solve this riddle."
   puts "Who makes it, has no need of it."
   puts "Who buys it, has no use for it."
   puts "Who uses it can neither see nor feel it."
   puts "What is it? (type only the answer)"
   @riddle_answer = gets.chomp.downcase.rstrip.lstrip

   if  @riddle_answer == "coffin"

      puts riddle_answer_coffin
   else
      puts "Wrong! the answer is coffin"
      puts ":p"
      puts "Let's try a new riddle."
      puts "However if you get it wrong we'll skin you alive for our entertainment ;)"



      puts riddle_stamp
   end
end

def riddle_answer_coffin

   puts "Bandit: you're absolutelyl correct!"
   puts "Here take this sword as a prize"

   @enter_cave = true

   @bandit_beat = true
end
#hunter run away story agree to task
def entrance_decision_enter_cave_money


   puts "Bandit: Ha! You sad poor bum! well if you really want to do get into this cave then I need you to do me a favor. interested?"
   puts "type yes, no, or what kind of favor?"
   while user_input = gets.chomp.downcase.rstrip.lstrip # loop while getting user input
      case user_input
      when "what kind of favor?"



         puts "Bandit: Don't worry about it! now are you in or are you out?"
         puts "type yes or no"

         # make sure to break so you don't ask again
      when "yes"

         puts bandit_favor


         break # and again
      when "no"

         puts "Bandit: Get the hell out of here before I get pissed."
         run_away_story
         break
      else
         puts "Please type yes, no, or what kind of favor? only!"
         # print the prompt, so the user knows to re-enter input
      end
   end
end
def run_away_story_yes
   puts "Wonderful! I really appreciate it!"
   puts "Here, you're going to need this!"
   puts "Hunting Bow equipped."
   puts "Hunting Bow power = 20 - 30"
   hunter_weapons = true
   @player_hunt_bow_attack = @player.attack(@playerbow)

   frey_favor
end
def hunting_bow_deer_attack

   puts "You used your Hunting Bow!"

   if ( @deer_health - @player_hunt_bow_attack) <= 0
      puts "Deer health at 0!"
      puts "You collect the deer"
      @deer_equipped = true

   end
end
def mana_attack_deer_attack
   puts "Second response"
   if ( @deer_health - @player_mana_attack) <= 0
      puts "Deer health at 0!"
      puts "You collect the deer"
      @deer_equipped = true

   end
end
def hunting_bow_hare_attack


   puts "You used your Hunting Bow!"

   if (@hare_health - @player_hunt_bow_attack) <= 0
      puts "Hare health at 0!"
      puts "You collect the deer"
      @hare_equipped = true

   end
end



def mana_attack_hare_attack
   puts "You used your mana attack!"
   if (@hare_health - @player_mana_attack) <= 0
      puts "Hare health at 0!"
      puts "You collect the hare"
      @hare_equipped = true

   end
end
def right_path
   puts "Right path chosen"
   puts "You encounter a hare"

   @hare = Deer.new
   @hare_health = @hare.health
   puts "What do you do? (type attack or run away)"
   while user_input = gets.chomp.downcase.rstrip.lstrip  # loop while getting user input
      case user_input
      when "attack"
         puts "Battle started!"
         puts "Hare Health: 20"
         puts "What attack would you like to do?"
         puts "type hunting bow or mana attack"
         while user_input = gets.chomp.downcase.rstrip.lstrip  # loop while getting user input
            case user_input
            when "hunting bow"
               puts hunting_bow_hare_attack
               break # make sure to break so you don't ask again
            when "mana attack"
               puts mana_attack_hare_attack
               break # and again
            else
               puts "Please type hunting bow or mana attack"
               # print the prompt, so the user knows to re-enter input
            end
         end


         break # make sure to break so you don't ask again
      when "run away"

         puts "you go back to the entrance of the two paths"
         frey_favor
         break
         # and again
      else
         puts "Please type attack or run away"
         # print the prompt, so the user knows to re-enter input
      end
   end
end
def attack_story_deer_attack

   puts "type hunting bow or mana attack"
   while user_input = gets.chomp.downcase.rstrip.lstrip  # loop while getting user input
      case user_input
      when "hunting bow"

         hunting_bow_deer_attack
         break # make sure to break so you don't ask again
      when "mana attack"
         mana_attack_deer_attack
         break # and again
      else
         puts "Please type hunting bow or mana attack"
         # print the prompt, so the user knows to re-enter input
      end
   end
end

def left_path
   puts "Left path chosen"
   puts "You encounter a Deer."

   @deer = Deer.new
   @deer_health = @deer.health
   puts "What do you do? (type attack or run away)"
   while user_input = gets.chomp.downcase.rstrip.lstrip  # loop while getting user input
      case user_input
      when "attack"
         puts "Battle started!"
         puts "Deer Health: 20"
         puts "What attack would you like to do?"
         puts attack_story_deer_attack

         break # make sure to break so you don't ask again
      when "run away"
         puts "you go back to the entrance of the two paths"
         frey_favor
         break
         # and again
      else
         puts "Please type attack or run away"
         # print the prompt, so the user knows to re-enter input
      end
   end
end
def talk_to_stranger
   puts "you: are you alright?"
   puts "the stranger jumps back and pulls out a short sword."
   puts "you: woah woah! I'm not looking for any trouble."
   puts "stranger: oh! I'm so sorry! You spooked me. I thought you were those bandits that I encountered at chill peak cave's entrance."
   puts "those bastards attacked me and I barely made it out of there alive."
   puts "I was just out there hunting for my family."
   puts "you: I just came back from that direction. they were at the entrance of the cave still."
   puts "stranger: are you an adventurer?"
   puts "..."
   puts "Oh! You are! You were probably headed towards chill peak cave looking for the rumored Chilledge blade."
   puts "Pop Pop always told me stories about it when I was younger but I've thought it's existence was a myth."
   puts "My name is Frey by the way. Yours?"
   puts "..."
   puts "Frey: Tell you what #{@name}. You help me catch dinner for my family and I'll create a distraction at the cave so you can sneak in."
   puts "What do you say? (type yes or no)"

   while user_input = gets.chomp.downcase.rstrip.lstrip # loop while getting user input
      case user_input
      when "yes"


         run_away_story_yes
         break # make sure to break so you don't ask again
      when "no"
         puts "That's okay. Safe travels #{@name}!"
         break # and again
      else
         puts "Please type yes or no"
         # print the prompt, so the user knows to re-enter input
      end
   end
end

def run_away_story
   puts "you run away and head back towards the local village."
   puts "on the way there you encounter someone who seems to be cursing into the air."
   puts "what do you do? (type talk to stranger, or keep walking)\n"
   while user_input = gets.chomp.downcase.rstrip.lstrip # loop while getting user input
      case user_input
      when "talk to stranger"

         talk_to_stranger
         break
      when "keep walking"

         keep_walking
         break # and again
      else
         puts "Please type talk to stranger, or keep walking"
         # print the prompt, so the user knows to re-enter input
      end
   end
end

def entrance_decision
   @player = Player.new
   @playerbow = Hbow.new
   @playerbblade = Bblade.new
   @playermana = Mana.new
   @enter_cave = nil

   @player_mana_attack = @player.attack(@playermana)
   puts "you encounter a group of bandits at the entrance. what do you do? (type attack, enter cave, or run away)"



   while user_input = gets.chomp.downcase.rstrip.lstrip # loop while getting user input
      case user_input
      when "attack"

         puts "You attack the group of bandits!"
         puts "You are outnumbered and die in battle."

         break
      when "enter cave"
         entrance_decision_enter_cave
         break # and again
      when "run away"
         run_away_story
         break
      else
         puts "Please type attack, enter cave, or run away"
      end
   end
end
def keep_walking
   puts "you head back home and live a boring adventureless life."
end

def frey_distraction_on
   @frey_distraction = true
end

def enter_cave_on

   @enter_cave = true

end

def frey_favor
   puts "*****************"
   puts "You're exploring the woods for food and encounter two paths."
   puts "One going to the left and one to the right"
   puts "Which do you chose?"
   #catch (:back)

   while user_input = gets.chomp.downcase.rstrip.lstrip # loop while getting user input
      case user_input
      when "left"
         left_path
         break # make sure to break so you don't ask again
      when "right"
         right_path
         break # and again
      else
         puts "Please type left or right"
         # print the prompt, so the user knows to re-enter input
      end
   end
end
def animals_equipped


   if @deer_equipped
      puts "You have the deer"
      puts "You return to Frey and give him the deer."
      puts "Frey: Wow! Thank you so much! I can feed my family or whatever."
      puts "You: Ready to cause a distraction?"
      puts "Frey: yup! let's go."
      frey_distraction_on
   end

   if @hare_equipped
      puts "You have the hare"
      puts "You return to Frey and give him the hare."
      puts "Frey: Wow! Thank you so much! I can feed my family or whatever."
      puts "You: Ready to cause a distraction?"
      puts "Frey: yup! let's go."

      frey_distraction_on
   end
end

def frey_distracts
   if @frey_distraction
      puts "Frey throws a rock at the Bandit leader."
      puts "The bandits chase him and the entrance is clear."
      puts enter_cave_on
   end
end

def end_game


   if @enter_cave && @frey_distraction

      puts "You have entered the cave and you have won the sword! you win!"

   elsif @enter_cave && @bandit_beat

      puts "You have entered the cave and you have found the sword! you win!"

   end
end

def while_loop

   while user_input = gets.chomp # loop while getting user input
      case user_input
      when "1"
         puts "First response"
         break # make sure to break so you don't ask again
      when "2"
         puts "Second response"
         break # and again
      else
         puts "Please select either 1 or 2"
         # print the prompt, so the user knows to re-enter input
      end
   end

end
##################################################
#start game

get_user_name

intro

entrance_decision

animals_equipped

frey_distracts

end_game



puts "End of game."
