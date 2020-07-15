require "pry"
require "colorize"
module SkinCare

    class CLI 

        def initialize
            @input = " "
        end

        def start
            puts "Hey There! Ready to get your Skin Fit On?!".colorize(:blue)
            user_location
            list_skin_businesses
            ask_for_choice
        
            while @input != "exit" && @input != "back"
                # binding.pry if @input == "debug"
                if @input == "list"
                    list_skin_businesses
                # elsif @input == "debug"
                    
                elsif valid?
                    puts SkinCareBusiness.find_by_number(@input).details
                else
                    puts "OOOh Snap! I didn't get that. Try again?"
                end
                ask_for_choice
            end
        end

        def user_location
            puts "Let's start looking for your Skin Guru!, where are you?".colorize(:blue)
            @location = gets.chomp
            SkinCareBusiness.load_by_location(@location)
        end


        def list_skin_businesses
            SkinCareBusiness.all.each.with_index(1) do |skin_care_business, index|
                puts "#{index}. #{skin_care_business.name}"
            end
        end
        
        def ask_for_choice
            list_of_choices
            @input = gets.strip
            start if @input == 'back'
        end

        def list_of_choices            
            puts "To view more details about the business, type it's number and hit enter."
            puts "To go back to view the list again & make another selection, type 'list'."
            puts "Type 'back' to return to the main menu."
            puts "If you would like to exit the program type 'exit'."   
        end

        def valid?
            @input.to_i.between?(1, SkinCareBusiness.all.length)
        end

    end 
    
end