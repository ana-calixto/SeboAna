
# User.delete_all
# Product.destroy_all 

5.times do
  category = Category.create! name: Faker::Book.genre
  puts "Created a new category: #{category.name}"
end

    # user = User.create! email: "quirino@gmail.com", password:'souadmin', isadmin: true
    # puts "Created a new user: #{user.email}"


# 15.times do
#   user = User.create! email: Faker::Internet.email, password:'aninha12345'
#   puts "Created a new user: #{user.email}"
#   2.times do
#       product = Product.create!(
#       title: Faker::Book.title,
#       author: Faker::Book.author,
#       category_id: rand(1..5),
#       price: rand(1..100),
#       published: true,
#       user_id: user.id
#       )
#       puts "Created a brand new product: #{product.title}"    
#   end
# end
