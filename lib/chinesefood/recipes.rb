# class Chinesefood::Recipe
class Recipes
    # attr_accessor :name, :time, :difficulty, :ingredient, :steps, :url
    attr_accessor :name, :url, :serve, :difficulty, :method, :ingredient

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.today
    #     #I should return a bunch of instances of Recipe
    #     # puts <<-DOC.gsub /^\s*/, ''
    #     # 1. beef
    #     # 2. chicken
    #     # DOC
    #     self.scrape_recipes
    # end

    # def self.scrape_recipes
    #     #extract
    #     #instantiate
    #     recipes = []

    #     recipes << self.scrape_goodfood

        
    #     # recipe_1 = self.new
    #     # recipe_1.name = "steak"
    #     # recipe_1.time = "1hr"
    #     # recipe_1.difficulty = "easy"
    #     # recipe_1.ingredient = "beef"
    #     # recipe_1.steps = "abcd"
    #     # recipe_1.url = "https://www.bbcgoodfood.com/recipes/stir-fried-beef-oyster-sauce"

    #     # recipe_2 = self.new
    #     # recipe_2.name = "chicken"
    #     # recipe_2.time = "0.5hr"
    #     # recipe_2.difficulty = "easy"
    #     # recipe_2.ingredient = "chich"
    #     # recipe_2.steps = "efgh"
    #     # recipe_2.url = "https://www.bbcgoodfood.com/recipes/cashew-chicken"

    #     recipes
    # end

    # # def self.scrape_goodfood
    # #     doc = Nokogiri::HTML(open("https://www.bbcgoodfood.com/recipes/collection/chinese"))
        
    # #     # recipe = self.new
    # #     doc.css("node.node-recipe.node-teaser-item.clearfix").each do |recipe|
    # #         name = doc.css("h3.teaser-item__title").first.text
    # #         time = doc.css("li.teaser-item__info-item.teaser-item__info-item--total-time").first.text
    # #         difficulty = doc.css("li.teaser-item__info-item.teaser-item__info-item--skill-level").first.text
    # #         recipes.new
    # #     end


    # # end




end