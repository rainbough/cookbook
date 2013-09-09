

class Cookbook
	
	attr_reader :book_title
	
	def initialize(book_title)
		@recipes = []
		@book_title = book_title
	


	end
	def add_recipe(recipe)
		@recipes << recipe

	end

  def list
  	@recipes.each do |recipe|
  		puts recipe.title
  		#puts "#{recipe.ingredients.count} ingredients"
  		#puts "Ingredients: #{recipe.ingredients}"
  		#puts "#{recipe.steps.count}"
  	end
  end
  def ingredients(recipe)
  		
  		puts recipe.ingredients
  end
  def steps(recipe)
  	puts recipe.steps
  end

	def to_s()
		"#{@book_title}"
  	 
	end
	def menu
		options = "active"
		until options == "q"
		puts "commands: list = list recipes in cookbook"
		puts "add = add recipes to cookbook"
		puts "What would you like to do"
		puts "q = quit"
		options = gets.chomp 

		case options
		when "list"
			self.list
		when "add"
			puts "Please enter the following:"
			puts "recipe title"
			title = gets.chomp 
			puts "recipe ingredients (separate with commas)"
			ingredients = gets.chomp.split(", ")
			puts "What are the steps for this recipe (separate with commas)"
			steps = gets.chomp.split(", ")
			new_recipe = gets.chomp
			new_recipe = Recipe.new(title, ingredients, steps)
			self.add_recipe(new_recipe)
			puts "you just added #{new_recipe.title}, #{new_recipe.ingredients}, #{new_recipe.steps}"

		when "q"
			break
		else 
			puts "response not understood"

		end
	end
		
	end
end
	



class Recipe
	
	attr_accessor  :ingredients, :steps, :title
	
	def initialize(title, ingredients=nil, steps=nil)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

  def to_s()
		"This is a #{@title} recipe."
  end

end

mex_cuisine = Cookbook.new("Mexican Cooking")


burrito = Recipe.new("Bean and Cheese Burrito", ["tortilla", "bean", "cheese"], ["heat beans", "heat tortilla", "place beans in tortilla", "sprinkle cheese on top", "roll up"])
chips_n_salsa = Recipe.new("Chips and Salsa", ["tortilla chips", "Salsa"], ["place chips in bowl", "pour salsa over"])
#puts burrito
#puts chips_n_salsa


mex_cuisine.add_recipe(burrito)
mex_cuisine.add_recipe(chips_n_salsa)
#mex_cuisine.list
#mex_cuisine.ingredients(burrito)
#mex_cuisine.steps(burrito)
mex_cuisine.menu
