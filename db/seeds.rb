require 'faker'

# create a few users
# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
end

# create a few technical skills
computer_skills = %w(Ruby Sinatra Rails JavaScript jQuery HTML CSS)
computer_skills.each do |skill|
  Skill.create :name => skill, :context => 'technical'
end

@years = (1..4).to_a
@formal = [true, false]

# create a few creative skills
design_skills = %w(Photoshop Illustrator Responsive-Design)
design_skills.each do |skill|
	year = @years.sample
	bool = @formal.sample
  Skill.create(:name => skill, :context => 'creative', :years => year, :formal => bool)
  # binding.pry
end

# TODO: create associations between users and skills
users = User.all
skills = Skill.all

users.each_with_index do |user, index|
	user.skills << skills[index]
end