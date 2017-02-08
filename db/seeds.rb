Restaurant.destroy_all

30.times do
  Restaurant.create!(
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    category: Restaurant::CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

Restaurant.all.each do |restaurant|
  5.times do
    review = Review.new(content: Faker::Hipster.paragraph, rating: (1..5).to_a.sample)
    review.restaurant = restaurant
    review.save
  end
end
