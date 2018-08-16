require "sinatra"
require "curb"
require "json"


class Pastry
  @@count = 0
  @@cookies = []
  @@cakes = []
  @@muffins = []

  attr_accessor :name, :calories, :price, :cookies, :muffins, :cakes
  def initialize(name, calories, price, description)
    @name = name;
    @calories = "#{calories} calories";
    @price = "$#{price}";
    @@count += 1;
    @description = description;
    @type = type;
    @cookies = @@cookies;
    @cakes= @@cakes;
    @muffins = @@muffins

    if @type === 'cookie'
      @@cookies<< self.name
    elsif @type === 'cake'
      @@cakes<< self.name
    elsif @type === 'muffin'
      @@muffins<< self.name
    elsif @type === 'doughnut'
      @@muffins<< self.name
    end
  end

  def self.count
    return @@count
  end

  def self.cookies
    return @@cookies
  end

  def self.muffins
    return @@muffins
  end

  def self.cakes
    return @@cakes
  end
end

class Cookie < Pastry
    attr_accessor :type, :name, :calories, :price, :description
  def type
    @type = 'cookie'
  end

end

class Cake < Pastry
  attr_accessor :type, :name, :calories, :price, :description
  def type
    @type = 'cake'
  end

end

class Muffin < Pastry
  attr_accessor :type, :name, :calories, :price, :description
  def type
    @type = 'muffin'
  end

end

class Doughnuts < Pastry
attr_accessor :type, :name, :calories, :price, :description

 def type
   @type = 'doughnut'
 end
end



get '/'do
  erb :home
end

get '/cookies'do
@chocolate_chip_cookies= Cookie.new('chocolate chip cookie', '120', '5', 'Drop cookie that originated in the United States and features chocolate chips as its distinguishing ingredient.These delicious chewy cookies are not just studded with chips but raisins as well!')
@oatmeal_cookies = Cookie.new('oatmeal cookies', '78', '10','Old-fashioned taste of these chewy raisin-studded cookies. The secret to the recipe is to measure exactly and not to overbake')
@sugar_cookies = Cookie.new('sugar cookies', '113','12', 'Main ingredients like sugar, flour, butter, eggs, vanilla, and either baking powder or baking soda')
  erb :cookies
end

get '/cakes'do
@wedding_cake = Cake.new("Wedding cake", '3,167', '450', 'Gourmet wedding cake for a special occasion. 3 layers tall with the finest ingredients in the country customized to your preference.')
@birthday_cake = Cake.new("Birthday cake","6,545", '75', 'Simple Birthday cake with ice cream inside. We will customize your cake decorations the way it want. It also includes a dancing man inside free of charge.')
@red_velvet = Cake.new("Red Velet cake", '800', '25', 'This Red Velvet cake is fat-free. Which means it can be enjoyed anytime without the worries of the extra calories. It is a delightful treat.')
  erb :cake
end

get '/muffins'do
@blueberry = Muffin.new("Blueberry muffin", '96', '3', 'Fat-free muffin with all natural blueberry flavor.')
@choco_chip = Muffin.new("Chocolate chip muffin","550", '5', 'large soft muffin with chocolate chips on top and a fudge center .')
@banana = Muffin.new("Banana muffin", '220', '6', 'A scattering of chopped nuts adds crunch to these moist, taste-tempting treats. They are the best banana nut muffins I have found. Bet you will agree.')
  erb :muffin
end

get '/doughnuts'do
  erb :home
end

get '/event' do
 @result = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search/?q=baking&token=#{ENV['API_TOKEN']}")
 @data = @result.body_str
 @parsed = JSON.parse(@data)
 @events = @parsed['events']
  erb :event
end
