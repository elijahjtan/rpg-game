STDOUT.sync = true

buyprice = {"old rusty sword" => 25, "dagger" => 50, "broadsword" => 75, "longsword" => 100, "crossbow" => 150, "crossbow bolts" => 5, "health potion" => 50, "mana potion" => 40  }
sellprice = {"old rusty sword" => 12, "dagger" => 25, "broadsword" => 37 , "longsword" => 50, "crossbow" => 75, "crossbow bolts" => 2, "health potion" => 25, "mana potion" => 20  }
#initial user prompt THIS SHOULD BE IN ITS OWN FUNCTION AS WELL
puts "Hello there, traveller, and welcome to my shop. Can I interest you in some wares?

Buy
Sell
Exit"

#METHOD NAMING CONVENTION, DO SOMETHING LIKE defMainMenu, usually for methods, the first word is lowercase, and the rest of the words are uppercase
def mainMenu
while 1
	puts "Choose an option."
	#user input for initial menu
	startmenuinput = gets.chomp
	#removes empty characters/spaces/commas from the command
	startmenuinput = startmenuinput.strip()
	startmenuinput = startmenuinput.downcase
	case startmenuinput
	when 'buy'
	buymenu
	when 'sell'
	sellmenu
	when  'exit'
		exit
	else 
		puts "Something went wrong. Try again."
	end
end
end	

#have some spacing between your methods, makes it more readable, (also if you only do the naming convention for mainmenu i'm gonna get mad because that means you're being lazy)
def buyMenu
	puts "Here's what I have for sale. What interests you?"
       
       #wtf is up with your indenting, also, this buyprice hash should be declared at the top. Usually, if something is a global variable, you want it defined at the top of your file, you can put it right after STDOUT.sync
	   buyprice.each do |key, value|
	      puts "#{key} - #{value} Gold".split.map(&:capitalize).join(' ')
	    end

	      #user input for buy screen
	      buyinput = gets.chomp
	      #removes empty characters
	      buyinput = buyinput.strip()
	      buyinput = buyinput.downcase
	      puts "That'll be #{buyprice[buyinput]}  gold. Would you like to buy this item?" 

	      buyverify
end

def sellMenu	
		puts "What would you like to sell?"
                #same issue with indenting, and also you should have this hash at the top as a global variable, why you ask? what if you want to reference the sell price hash in another method? that method won't have access to this hash, because you are declaring it in a method. variables declared in a method are only accessible to that method (in most cases anyways)


        #This piece of code can be used for both buy price and sell price, why not make it a method? all you need to do is pass in buyprice/sellprice as a parameter depending on what you want to display
		sellprice.each do |key, value|
	      		puts "#{key} - #{value} Gold".split.map(&:capitalize).join(' ')
	   	end

		
		sellinput=gets.chomp
		sellinput=sellinput.strip()
		puts "I'll buy that off of you for #{sellprice[sellinput]}. Do you want to sell that to me?"
		sellverify	
end

def buyVerify(item)
		
			confirm = gets.chomp
			confirm=confirm.strip()
			
case confirm
			
			when 'yes'
				puts "Sale completed."
			returnmaintxt
			when 'no'
				puts "Sale aborted."
			returnmaintxt
			else
				puts "Input error, returning to inital menu"
                #you were asking about this right? how do i get the user to go back to the buy menu if he fucks up? why don't you just call the function "displayBuyMenu"
			returnmaintxt

			end
end	

def sellVerify
			confirm = gets.chomp
			confirm=confirm.strip()
			
case confirm
			
			when 'yes'
				puts "Sale completed."
			returnmaintxt
			when 'no'
				puts "Sale aborted."
			returnmaintxt
			else
				puts "Input error, returning to inital menu"
                #same issue here
			returnmaintxt

			end
end	



def returnmaintxt
	puts "Returning to initial menu
	Buy
	Sell
	Exit"
end

mainMenu

