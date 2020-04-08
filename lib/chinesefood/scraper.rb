class Scraper

    GoodFood_URL = "https://www.bbcgoodfood.com/recipes/collection/chinese"
    Recipe_URL = "https://www.bbcgoodfood.com"

    def self.scrape_goodfood
        doc = Nokogiri::HTML(open(GoodFood_URL))
        doc.css(".row.pad-left.content-recipe-collection").css(".node.node-recipe.node-teaser-item.clearfix").each do |recipe|
            
            name = recipe.css(".teaser-item__title").text
            url = recipe.css(".teaser-item__title a").attr('href').value
            #time = recipe.css("li.teaser-item__info-item.teaser-item__info-item--total-time").text
            #difficulty = recipe.css("li.teaser-item__info-item.teaser-item__info-item--skill-level").text
            Recipes.new(name, url)
            
        end
            # doc = Nokogiri::HTML(open("https://www.bbcgoodfood.com/recipes/chinese-beef-aubergine-hotpot"))
            # # doc.search(".ingredients-list__group").map do |card|
            # #     card.css("li").map do |ingred|
            # words = doc.search("method__item p").text
            # words.map.with_index(1) do |card, i|    
            #     {}
                
            #     binding.pry
            #         ingred.attr("content")
                
            # end

                 
            # doc.search(".ingredients-list__item").attr("content").value
            # doc.search(".ingredients-list__item").map(&:content)

        
    end

    def self.scrape_individual_recipe(recipe)
        doc = Nokogiri::HTML(open(Recipe_URL+recipe.url))
        recipe.difficulty = doc.css("span.recipe-details__text")[1].text.strip
        recipe.serve = doc.css("span.recipe-details__text")[0].text.strip
        # recipe.ingredient = doc.search(".ingredients-list__item").map(&:content).join(',')
        recipe_ingredient = []
        doc.css("ul.ingredients-list__group").css("li.ingredients-list__item").each.with_index(1) do |x,i|
            # binding.pry
            new_ingredient = "#{i}. " + x.attr("content")
            recipe_ingredient << new_ingredient
            recipe.ingredient = recipe_ingredient.join(' ')
        end
        # recipe.method = doc.css(".method__item p").each.with_index(1){|x,i| "#{i}. #{x} "}
        recipe_method = []
        doc.css("ol.method__list").css("li.method__item").each.with_index(1) do |m,i| 
            new_method = "#{i}. ".italic.underline + m.css("p").text
            recipe_method << new_method
            recipe.method = recipe_method.join(' ')
        # binding.pry
        end

        # ingred = doc.search(".ingredients-list__item").map(&:content)
        # recipe.ingredient = ingred.to_s


        # steps = doc.css(".method__item p").text.strip
        # steps.map_with_index(1) do |step,i|
        #     binding.pry
        #     meth = "#{i}. #{step}"
        # end
        # recipe.method = 
        
        # meth = doc.css(".method__item p").text
        # meth.each_with_index(1) do |x,i|
        #     recipe.method = "#{i}. #{x}"
        # end
        # recipe.method = doc.css(".method__item p").text.strip
        # meth = doc.css(".method__item p").text
        # recipe.method = meth.each.with_index(1){|x,i| puts "#{i}. #{x}"}

        
    end

end
