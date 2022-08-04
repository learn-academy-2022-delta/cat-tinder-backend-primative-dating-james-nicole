# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
monkeys = [
    {
        id: 1,
        name: "Felipe",
        age: 3,
        enjoys: "sunshine and warm spots",
        image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
      },
      {
        id: 2,
        name: "Bertha",
        age: 4,
        enjoys: "banana splits",
        image: "https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg"
      },
      {
        id: 3,
        name: "Stella",
        age: 1,
        enjoys: "getting all the attention",
        image: "https://st2.depositphotos.com/2927537/7025/i/950/depositphotos_70253417-stock-photo-funny-monkey-with-a-red.jpg"
    },
          {
        id: 4,
        name: "Winston",
        age: 5,
        enjoys: "eating all the ticks",
        image: "https://media.npr.org/blogs/monkeysee/2009/10/22/angrymonkey-480fe8cb9c9c711f76b537f3a7f7e186696e1b0c-s1100-c50.jpg"
      }
]

monkeys.each do |attributes|
    Monkey.create(attributes)
    p "Creating monkey #{attributes}"
end