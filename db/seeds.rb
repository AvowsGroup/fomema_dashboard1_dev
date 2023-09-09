# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



country_names = [
  'United States', 'Canada', 'United Kingdom', 'Australia', 'Germany',
  'France', 'India', 'Japan', 'Brazil', 'Mexico', 'China', 'South Africa'
]

country_names.each { |name|Country.create(name: name)}


malaysian_states = [
  'Johor', 'Kedah', 'Kelantan', 'Melaka', 'Negeri Sembilan',
  'Pahang', 'Perak', 'Perlis', 'Pulau Pinang', 'Sabah', 'Sarawak', 'Selangor', 'Terengganu'
]
malaysian_states.each { |name| State.create!(name: name) }

sector_names = [
  'Technology', 'Finance', 'Healthcare', 'Education', 'Manufacturing',
  'Retail', 'Hospitality', 'Transportation', 'Energy', 'Entertainment'
]
sector_names.each { |name| JobType.create!(name: name) }


State.ids.each {|id| Doctor.create!(state_id:id)}

1000.times do |i| 
  Transaction.create!(fw_job_type_id: JobType.ids.shuffle.first,fw_country_id: Country.ids.shuffle.first,doctor_id: Doctor.ids.shuffle.first,fw_gender: ["male","female"].shuffle.first,fw_date_of_birth: Faker::Date.birthday,created_at: Date.today - rand(1..1000).days,medical_examination_date:Date.today - rand(1..1000).days ,organization_id: Organization.ids.shuffle.first,registration_type: ["new_registration","renewal"].shuffle.first,certification_date: (Date.today - (rand(1.1000)).days))
  puts "#{i} records created"
end 
# Transaction.all.map{|i| i.update(created_at: Date.today - rand(1..1000).days,medical_examination_date:Date.today - rand(1..1000).days ,organization_id: Organization.ids.shuffle.first,registration_type: ["new","renewal"].shuffle.first)}



["northern","central","southern","east_coast","agency","web_portal"].each do |name|
  Organization.create!(name: name)
end

# Transaction.all.each {|i| i.update(organization_id: Organization.ids.shuffle.first,registration_type: ["new","renewal"].shuffle.first))}

# Transaction.all.each {|i| i.update(registration_type: ["new","renewal"].shuffle.first)}

Transaction.ids.each do |i|
  a = MedicalAppeal.new()
  a.transaction_id = i
  a.save!(validate: false)
  MyimmsTransaction.create!(transaction_id: i,status: ["0","1","96","97","98","99"].shuffle.first) rescue nil
end

# Transaction.ids.each {|i|  MyimmsTransaction.create!(transaction_id: i,status: ["0","1","96","97","98","99"].shuffle.first)}