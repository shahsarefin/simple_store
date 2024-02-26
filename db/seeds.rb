# 676.times do
#     Product.create(
#         title: Faker::Commerce.product_name,
#         price: Faker::Commerce.price(range: 0..100.0),
#         stock_quantity: Faker::Number.between(from: 0, to: 100)
#     )
# end

require "csv"

# Clear existing data to prevent issues with duplicate entries
Product.destroy_all
Category.destroy_all

csv_file_path = Rails.root.join('db', 'products.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
    category_name = row['category'].try(:strip)
    title = row['name'].try(:strip) 
    price = row['price'].try(:strip)
    stock_quantity = row['stock quantity'].try(:strip) 
  
    if category_name.present? && title.present? && price.present? && stock_quantity.present?
      category = Category.find_or_create_by!(name: category_name)
      category.products.create!(
        title: title,
        price: price,
        stock_quantity: stock_quantity
      )
    else
      puts "Skipping invalid row: #{row.inspect}"
    end
  end
  

puts "Imported #{Product.count} products."



