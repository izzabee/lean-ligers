# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Message.destroy_all

izabella = User.create({
	first_name: 'Izabella',
	last_name: 'Stern',
	email: 'izabella@me.com',
	password: 'password',
	industry: 'Web Development',
	mentor: false
	})

alvin = User.create({
	first_name: 'Alvin',
	last_name: 'Liang',
	email: 'alvin@me.com',
	password: 'password',
	industry: 'Web Development',
	mentor: false
	})

pablo = User.create({
	first_name: 'Pablo',
	last_name: 'Orlandini',
	email: 'pablo@me.com',
	password: 'password',
	industry: 'Project Management',
	mentor: false
	})

dan = User.create({
	first_name: 'Dan',
	last_name: 'Snider',
	email: 'dan@me.com',
	password: 'password',
	industry: 'Project Management',
	mentor: false
	})

brice = User.create({
	first_name: 'Andrew',
	last_name: 'Brice',
	email: 'bric@me.com',
	password: 'password',
	industry: 'User Experience Design',
	mentor: false
	})

kevin = User.create({
	first_name: 'Kevin',
	last_name: 'Wong',
	email: 'kevin@me.com',
	password: 'password',
	industry: 'User Experience Design',
	mentor: false
	})

matt =  User.create({
	first_name: 'Matt',
	last_name: 'Short',
	email: 'matt@me.com',
	password: 'password',
	industry: 'Web Development',
	mentor: true
	})

colleen = User.create({
	first_name: 'Colleen',
	last_name: 'Lynch',
	email: 'colleen@me.com',
	password: 'password',
	industry: 'Project Management',
	mentor: true
	})

marco = User.create({
	first_name: 'Marco',
	last_name: 'Black',
	email: 'marco@me.com',
	password: 'password',
	industry: 'User Experience Design',
	mentor: true
	})

# message1 = Message.create({
# 	subject: 'Interested Developer',
# 	content: 'Hello, I am a market analyst who is looking to become a front-end developer and I would love to ask you some questions regarding your experience. Thanks!',
# 	mentor_id: ,
# 	mentee_id:  
# 	})