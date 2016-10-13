# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


company = User.create!({:email => "company@email.com", :password => "password", :password_confirmation => "password", :role => 1 })
company = User.create!({:email => "user@email.com", :password => "password", :password_confirmation => "password", :role => 0 })

Category.create!(name: "Full-Time")
Category.create!(name: "Part-Time")
Category.create!(name: "Remote")
Category.create!(name: "Internship")


Job.create!(
 title: "Senior Web Developer",
 description: "This position is for a strong Full Stack developer who would like to drive their own growth inside of our company. You will have a lot of agency (and responsibility!) from the outset, and you will be expected to run projects from start to finish, interface with clients, and oversee more junior developers",
 company_name: "Dom & Tom",
 url: "http://domandtom.applytojob.com/",
 location: "New York",
 category_id: 1,
 company_id: company.id
)

Job.create!(
 title: "Junior Web Developer",
 description: "This position is for a junior Full Stack developer who would like to drive their own growth inside of our company. You will have a lot of agency (and responsibility!) from the outset, and you will be expected to run projects from start to finish, interface with clients, and oversee more junior developers",
 company_name: "Tom & Jerry",
 url: "http://tomandjerry.applytojob.com/",
 location: "San Francisco",
 category_id: 2,
 company_id: company.id
)

Job.create!(
 title: "IOS Developer",
 description: "This position is for a IOS developer who would like to drive their own growth inside of our company. You will have a lot of agency (and responsibility!) from the outset, and you will be expected to run projects from start to finish, interface with clients, and oversee more junior developers",
 company_name: "A-Team",
 url: "http://ateam.applytojob.com/",
 location: "Houston",
 category_id: 3,
 company_id: company.id
)

Job.create!(
 title: "Junior Java Developer",
 description: "This position is for a junior java developer who would like to drive their own growth inside of our company. You will have a lot of agency (and responsibility!) from the outset, and you will be expected to run projects from start to finish, interface with clients, and oversee more junior developers",
 company_name: "Google",
 url: "http://google.applytojob.com/",
 location: "New York",
 category_id: 1,
 company_id: company.id
)

Job.create!(
 title: "Senior Web Developer",
 description: "This position is for a strong Full Stack developer who would like to drive their own growth inside of our company. You will have a lot of agency (and responsibility!) from the outset, and you will be expected to run projects from start to finish, interface with clients, and oversee more junior developers",
 company_name: "Dom & Tom",
 url: "http://domandtom.applytojob.com/",
 location: "New York",
 category_id: 1,
 company_id: company.id
)
