require 'colorize'

class CLI

    def call
        Scraper.scrape_goodfood
        puts "Welcome to my class".green
        puts "Which dish do you want to learn today?".green
        puts "Please choose a number".green 
        list_food
        menu
        goodbye
    end
    
    def list_food
        Recipes.all.each.with_index(1) do |recipe, i|
            puts "#{i}. #{recipe.name}"
        end
    end

    def menu
        puts "Enter the number of food or type 'list' to see detail or type 'exit'"
        input = gets.chomp
            if input.to_i.between?(1, Recipes.all.count)
                recipe = Recipes.all[input.to_i-1]
                display_recipe_details(recipe)
                elsif input.downcase == "list"
                list_food
                elsif input.downcase == "exit"
                    goodbye
                    exit
                else 
                puts "Not a valid number. Please enter again".red
                list_food
                menu
            end
            puts "Would you like to try another recipe?"
            puts "Please enter " + "Y".underline + " or " + "N".underline
            another_recipe = gets.strip.downcase
            if another_recipe == "y"
                list_food
                menu
                elsif another_recipe == "n"
                puts "Hope you have learnt something here!"
                exit
                else
                "I didn't get that. Please try again!"
                list_food
                menu
            end
    end

    def display_recipe_details(recipe)
        Scraper.scrape_individual_recipe(recipe)
        puts "Here are the details for " + " #{recipe.name.strip}".yellow.italic + ":"
        puts
        puts "Serve:".cyan + " #{recipe.serve}"
        puts
        puts "Difficulty:".cyan + " #{recipe.difficulty}"
        puts
        puts "Ingredients:".cyan + " #{recipe.ingredient}"
        puts
        puts "Method:".cyan + " #{recipe.method}"
        puts
    end

    def goodbye
        puts "See you next time!"
    end
end