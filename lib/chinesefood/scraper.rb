class Scraper

    GoodFood_URL = "https://www.bbcgoodfood.com/recipes/collection/chinese"
    Recipe_URL = "https://www.bbcgoodfood.com"

    def self.scrape_goodfood
        doc = Nokogiri::HTML(open(GoodFood_URL))
        doc.css(".row.pad-left.content-recipe-collection").css(".node.node-recipe.node-teaser-item.clearfix").each do |recipe|
            
            name = recipe.css(".teaser-item__title").text
            url = recipe.css(".teaser-item__title a").attr('href').value
            Recipes.new(name, url)
            
        end
    end

    def self.scrape_individual_recipe(recipe)
        doc = Nokogiri::HTML(open(Recipe_URL+recipe.url))
        recipe.difficulty = doc.css("span.recipe-details__text")[1].text.strip
        recipe.serve = doc.css("span.recipe-details__text")[0].text.strip

        recipe_ingredient = []
        doc.css("ul.ingredients-list__group").css("li.ingredients-list__item").each.with_index(1) do |x,i|
            new_ingredient = "#{i}.".underline + " "  + x.attr("content")
            recipe_ingredient << new_ingredient
            recipe.ingredient = "\n" + recipe_ingredient.join("\n")
        end

        recipe_method = []
        doc.css("ol.method__list").css("li.method__item").each.with_index(1) do |m,i| 
            new_method = "#{i}.".underline + " " + m.css("p").text
            recipe_method << new_method
            recipe.method = "\n" + recipe_method.join("\n")
        end
    end

end
