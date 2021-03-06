require 'pry'

zoos = {
    "Bronx Zoo" => {
        location: "Bronx",
        price: 25,
        weekend: true,
        animals: [
            {
                species: "Penguin",
                count: 2
            },
            {
                species: "Butterfly",
                count: 12
            },
            {
                species: "Tiger",
                count: 3
            }
        ]
    },
    "Central Park Zoo" =>  {
        location: "Manhattan",
        price: 18,
        weekend: true,
        animals: [
            #{ species: "Wolf", count: 4 },
            {
                species: "Tiger",
                count: 1
            },
            {
                species: "Monkey",
                count: 7
            }
        ]
    },
    "Staten Island Zoo" => {
        location: "Staten Island",
        price: 10,
        weekend: false,
        animals: [
            {
                species: "Gorilla",
                count: 3
            },
            {
                species: "Monkey",
                count: 4
            },
            {
                species: "Elephant",
                count: 2
            },
            {
                species: "Bird",
                count: 6
            }
            
        ]
    }
}

# Central Park Zoo has just received 4 wolves. Alter the `zoos` information to reflect this new change:
# Put this hash: { species: "Wolf", count: 4 } in the array under the `:animals` key in Central Park Zoo

zoos["Central Park Zoo"][:animals] << { species: "Wolf", count: 4 }


# The 2 penguins in the Bronx Zoo just had a baby. Alter the `zoos` information to reflect this new change:
# Increment the number for the `:count` key in the "Penguin" hash in the Bronx Zoo array by 1. 
# You can assume that the animal at index 0 will always be the "Penguin" hash.

zoos["Bronx Zoo"][:animals][0][:count] = 3 
   

# Each of the zoos in the city just received 2 pandas. Alter the `zoos` information to reflect this new change:
# In the array of animals under each Zoo, shovel this hash: { species: "Panda", count: 2 }

zoos.each do |zoo, properties|
    zoos[zoo][:animals] << { species: "Panda", count: 2 }
end


# Return the number of Tigers at the Bronx Zoo.
# Rather than assuming that the animal at index 2 will always be the "Tiger" hash:
# First find the "Tiger" hash from the array of Animals at the Bronx Zoo and then, access the value under the ":count" key


zoos["Bronx Zoo"][:animals].each do |animal|
    if animal[:species] == "Tiger"
        animal[:count]
    end
end


# Generalize the process to find the ticket price of a specific zoo.
# In other words, you're given a `name_of_zoo` variable that is a string.
# Return the price associated with the `name_of_zoo` variable.

# No matter which 1 of the 3 variable assignment you choose, your code should work:
# name_of_zoo = "Bronx Zoo" => returns 25
# name_of_zoo = "Central Park Zoo" => returns 18
# name_of_zoo = "Staten Island Zoo" => returns 10

def find_ticket_price(name_of_zoo, zoos)
    puts zoos[name_of_zoo][:price]
end

#find_ticket_price("Bronx Zoo", zoos)


# Return the sum of all the zoos' price. 
# The return value should be: 53 

#Get into the value of each price key
sum = 0 
zoos.each do |zoo, properties| # add all zoo prices
 sum += zoos[zoo][:price]
end 
#puts sum 

# Return an array of all the locations where the zoos are located.
# The return value should be an array of strings: ["Bronx", "Manhattan", "Staten Island"]
# Consider which higher-level enumerable method(s) you'd use here.

location = []
zoos.collect do |zoo, properties|
location << zoos[zoo][:location]
end
#p location 


# Find all the zoos that are open on the weekend. 
# The return value should be a hash with two keys: ["Bronx Zoo", "Central Park Zoo"]
# Consider which higher-level enumerable method(s) you'd use here.

open_on_the_weekend = {}
zoos.map{|zoo, properties|
if zoos[zoo][:weekend] == true
    open_on_the_weekend[zoo] ={}
end
}

#puts open_on_the_weekend


# Find the first zoo that are open on the weekend AND has the price under 20 dollars.
# The return value should be an array with two elements: ["Central Park Zoo", { location: "Manhattan", ... }]
# Consider which higher-level enumerable method(s) you'd use here.

open_on_the_weekend_and_under_20 = []
zoos.map do |zoo, properties|
if zoos[zoo][:weekend] == true && zoos[zoo][:price] <20
    open_on_the_weekend_and_under_20.push(zoo,zoos[zoo])
end
end

#p open_on_the_weekend_and_under_20


# Find all the zoos where there are monkeys.
# The return value should be a hash with two keys: ["Central Park Zoo", "Staten Island Zoo"]
# Consider which higher-level enumerable method(s) you'd use here.

zoo_with_monkeys ={}
zoos.each do |zoo, properties|
    zoos[zoo][:animals].each{|animal|
    if animal[:species] == "Monkey"
        zoo_with_monkeys[zoo] = {}
    end
    }
end

#puts zoo_with_monkeys

# def new_zoos
#     zoos = {
#         "Bronx Zoo" => {
#             location: "Bronx",
#             price: 25,
#             weekend: true,
#             animals: [
#                 {
#                     species: "Penguin",
#                     count: 2
#                 },
#                 {
#                     species: "Butterfly",
#                     count: 12
#                 },
#                 {
#                     species: "Tiger",
#                     count: 3
#                 }
#             ]
#         },
#         "Central Park Zoo" =>  {
#             location: "Manhattan",
#             price: 18,
#             weekend: true,
#             animals: [
#                 #{ species: "Wolf", count: 4 },
#                 {
#                     species: "Tiger",
#                     count: 1
#                 },
#                 {
#                     species: "Monkey",
#                     count: 7
#                 }
#             ]
#         },
#         "Staten Island Zoo" => {
#             location: "Staten Island",
#             price: 10,
#             weekend: false,
#             animals: [
#                 {
#                     species: "Gorilla",
#                     count: 3
#                 },
#                 {
#                     species: "Monkey",
#                     count: 4
#                 },
#                 {
#                     species: "Elephant",
#                     count: 2
#                 },
#                 {
#                     species: "Bird",
#                     count: 6
#                 }
                
#             ]
#         }
#     }
    
# zoos["Bronx Zoo"][:animals][0][:count] = 3 
# zoos.each do |zoo, properties|                 #add the count in each zoo 
# zoos[zoo][:animals] << { species: "Panda", count: 2 }
# end 
# end

# Return an array of 3 numbers, each describing the total sum of the number of animals in a zoo.
# The return value should be an array of 3 numbers: [20, 14, 17]
# # Consider which higher-level enumerable method(s) you'd use here.
# # def total_sum_of_each_zoo
#     new_zoos

#define a variable to get the sums 
    sum = 0
#define a empty array to shovel the sum into the array
    total_sum_of_animals = []
#first, looping over the counts
    zoos.collect { |zoo, properties|
    sum=0
#second loop
    zoos[zoo][:animals].each{|animal|
    sum +=animal[:count]
}
    total_sum_of_animals << sum
}

#p total_sum_of_animals
# end





# Find the zoo with the highest count of any species in it. (Butterflies with the 12 count is the highest)
# The return value should be an array with two elements: ["Bronx Zoo", { location: "Bronx", ... }]
# Consider which higher-level enumerable method(s) you'd use here.


max_value = -1
zoos.collect{|zoo,properties|
zoos[zoo][:animals].collect{|animal|
if max_value < animal[:count]
    max_value = animal[:count]
end
}
}

#define a empty array to get the return value
zoo_with_the_highest_count_of_species = []
#do the loop
zoos.collect{|zoo,properties|
zoos[zoo][:animals].collect{|animal|
if animal[:count]==max_value
    zoo_with_the_highest_count_of_species.push(zoo, properties)
end
}
}