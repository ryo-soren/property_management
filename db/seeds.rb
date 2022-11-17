User.destroy_all
Property.destroy_all
Question.destroy_all
Answer.destroy_all

PASSWORD = "123"

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "adminuser@user.com",
    password: PASSWORD,
    admin?: true
)

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "test@test.com",
    password: PASSWORD,
    admin?: true
)

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}@#{last_name}.com",
    password: PASSWORD
    )
end

users = User.all

20.times do
    created_at = Faker::Date.backward(days: 365 * 10)

    p = Property.create(
        name: Faker::Hacker.say_something_smart,
        price: rand(500),
        location: Faker::Address.city,
        description: Faker::ChuckNorris.fact,
        amenities: "A window, oxygen, water",
        image_url: Faker::LoremFlickr.image,
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if p.valid?
        rand(1..2).times do
           q = Question.create(question: Faker::Restaurant.review, property_id: p.id, user: users.sample)

           if q.valid?
                    rand(1..5).times do
                        Answer.create(answer: Faker::Restaurant.review, property_id: p.id, question_id: q.id, user: users.sample)

                    end         
            end
        end    
    end
end

properties = Property.all
questions = Question.all
answers = Answer.all
puts "Users: #{users.count}"
puts "Properties: #{properties.count}"
puts "Questions: #{questions.count}"
puts "Answers: #{answers.count}"