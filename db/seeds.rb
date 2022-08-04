monkeys = [
    {
        name: "Felipe",
        age: 7,
        enjoys: "Sunshine and warm spots"
    },
    {
        name: "Bertha",
        age: 10,
        enjoys: "Banana Splits"
    },
    {
        name: "Stella",
        age: 3,
        enjoys: "Getting all of the attention"
    },
    {
        name: "Winston",
        age: 11,
        enjoys: "Eating all the ticks"
    }
]

monkeys.each do |attributes|
    Monkey.create(attributes)
    p "Creating Monkey #{attributes}"
end