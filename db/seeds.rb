676.times do
    Product.create(
        title: Faker::Commerce.product_name,
        price: Faker::Commerce.price(range: 0..100.0),
        stock_quantity: Faker::Number.between(from: 0, to: 100)
    )
end