# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mentor.destroy_all
Mentee.destroy_all
Message.destroy_all
Question.destroy_all

izabella = Mentee.create({
	first_name: 'Izabella',
	last_name: 'Stern',
	email: 'izabella@me.com',
	password: 'password',
	industry: 'Web Development',
	fun_fact: 'I speak English, Dutch and Italian'
	})

alvin = Mentee.create({
	first_name: 'Alvin',
	last_name: 'Liang',
	email: 'alvin@me.com',
	password: 'password',
	industry: 'Web Development',
	fun_fact: 'I am a chess master'
	})

pablo = Mentee.create({
	first_name: 'Pablo',
	last_name: 'Orlandini',
	email: 'pablo@me.com',
	password: 'password',
	industry: 'Product Management',
	fun_fact: 'I am Chilean but grew up in Brazil'
	})

dan = Mentee.create({
	first_name: 'Dan',
	last_name: 'Snider',
	email: 'dan@me.com',
	password: 'password',
	industry: 'Product Management',
	fun_fact: "I'm a DJ"
	})

brice = Mentee.create({
	first_name: 'Andrew',
	last_name: 'Brice',
	email: 'bric@me.com',
	password: 'password',
	industry: 'User Experience Design',
	fun_fact: 'I competed in the junior olympics for fencing.'
	})

kevin = Mentee.create({
	first_name: 'Kevin',
	last_name: 'Wong',
	email: 'kevin@me.com',
	password: 'password',
	industry: 'User Experience Design',
	fun_fact: 'I am a professional ice skater'
	})

matt =  Mentor.create({
	first_name: 'Matt',
	last_name: 'Short',
	email: 'matt@me.com',
	password: 'password',
	industry: 'Web Development',
	fun_fact: 'I have a PHD in mathematics',
	})

colleen = Mentor.create({
	first_name: 'Colleen',
	last_name: 'Lynch',
	email: 'colleen@me.com',
	password: 'password',
	industry: 'Product Management',
	fun_fact: 'I knit crazy things',
	})

marco = Mentor.create({
	first_name: 'Marco',
	last_name: 'Black',
	email: 'marco@me.com',
	password: 'password',
	industry: 'User Experience Design',
	fun_fact: 'I found a painting by banksy on the street.',
	})

q1 = Question.create({
	question: 'What is your favorite place you have ever visited?'
	})

q2 = Question.create({
	question: 'What is your favorite outdoor activity?'
	})

q3 = Question.create({
	question: 'Cat or dog?'
	})

q4 = Question.create({
	question: 'What is your favorite movie?'
	})

q5 = Question.create({
	question: 'What is your favorite music genre?'
	})

q6 = Question.create({
	question: 'What is a website you love?'
	})

q7 = Question.create({
	question: 'Winter or summer?'
	})

q8 = Question.create({
	question: 'What is your favorite indoor activity?'
	})

q9 = Question.create({
	question: "What would you do if technology didn't exist?"
	})

q10 = Question.create({
	question: "What is something interesting about you that most people don't care about?"
	})

q11 = Question.create({
	question: 'What is your favorite food?'
	})

q12 = Question.create({
	question: 'Do you have any hobbies? What are they?'
	})

# message1 = Message.create({
	# subject: 'Interested Developer',
	# content: 'Hello, I am a market analyst who is looking to become a front-end developer and I would love to ask you some questions regarding your experience. Thanks!',
	# mentor_id: ,
	# mentee_id:
	# })
