User.destroy_all
Property.destroy_all
Question.destroy_all
Answer.destroy_all
Application.destroy_all

PASSWORD = "123"
# 10.times do
    
#     User.create(
#     first_name: "Admin",
#     last_name: "User",
#     sequence(:email){|n| "adminuser#{n}@user.com"}
#     password: PASSWORD,
#     admin?: true
# )

iterator = 0
10.times do
    User.create(
    first_name: "Admin",
    last_name: "User",
    email: "adminuser#{iterator}@user.com",
    password: PASSWORD,
    admin?: true
    )
    iterator += 1
end

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

clients = User.where(admin?: false)
admins = User.where(admin?: true)
phone_arr = [
        '(664) 204-6094)',
        '(937) 358-4444',
        '(854) 972-5243',
        '(498) 564-7540',
        '(678) 503-9730',
        '(828) 436-9133',
        '(479) 942-8373',
        '(764) 433-6850'
    ]

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
        user: admins.sample
    )
    if p.valid?

        rand(1..7).times do
            rand_client = clients.sample
            a = Application.create(
                property_id: p.id, 
                user: rand_client,
                first_name: rand_client.first_name,
                last_name: rand_client.last_name,
                age: rand(20..60),
                occupants: rand(1..8),
                sin: "123456789",
                phone_number: Faker::PhoneNumber.phone_number,
                content: Faker::Restaurant.review
                )
        end

        rand(1..2).times do
           q = Question.create(question: Faker::Restaurant.review, property_id: p.id, user: clients.sample)
           if q.valid?
                rand(1..5).times do
                    Answer.create(answer: Faker::Restaurant.review, property_id: p.id, question_id: q.id, user: admins.sample)

                end         
            end
        end 

    end
end

# super_user = User.create(
#     first_name: "Admin",
#     last_name: "User",
#     email: "adminuser@user.com",
#     password: PASSWORD,
#     admin?: true
# )

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "test@test.com",
    password: PASSWORD,
    admin?: true
)

properties = Property.all
questions = Question.all
users = User.all
answers = Answer.all
applications = Application.all

puts "Properties: #{properties.count}"
puts "Users: #{users.count}"
puts "Questions: #{questions.count}"
puts "Answers: #{answers.count}"
puts "Applications: #{applications.count}"