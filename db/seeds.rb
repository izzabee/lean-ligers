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
	current_job: 'GA WDI Student',
	fun_fact: 'I speak English, Dutch and Italian',
	quote: 'Curiousity is key',
	location: 'New York, NY'
	})

alvin = Mentee.create({
	first_name: 'Alvin',
	last_name: 'Liang',
	email: 'alvin@me.com',
	password: 'password',
	industry: 'Web Development',
	fun_fact: 'I am a chess master',
	quote: 'Do your thing',
	location: 'New York, NY'
	})

pablo = Mentee.create({
	first_name: 'Pablo',
	last_name: 'Orlandini',
	email: 'pablo@me.com',
	password: 'password',
	industry: 'Product Management',
	fun_fact: 'I am Chilean but grew up in Brazil',
	quote: 'Always think twice',
	location: 'New York, NY'
	})

dan = Mentee.create({
	first_name: 'Dan',
	last_name: 'Snider',
	email: 'dan@me.com',
	password: 'password',
	industry: 'Product Management',
	fun_fact: "I'm a DJ",
	quote: 'Nice try, smartypants',
	location: 'New York, NY'
	})

brice = Mentee.create({
	first_name: 'Andrew',
	last_name: 'Brice',
	email: 'brice@me.com',
	password: 'password',
	industry: 'User Experience Design',
	fun_fact: 'I competed in the junior olympics for fencing.',
	quote: 'If you fail, try and try again.',
	location: 'New York, NY'
	})

kevin = Mentee.create({
	first_name: 'Kevin',
	last_name: 'Wong',
	email: 'kevin@me.com',
	password: 'password',
	industry: 'User Experience Design',
	fun_fact: 'I am a professional ice skater',
	quote: 'Do not be afraid of failure',
	location: 'New York, NY'
	})

matt =  Mentor.create({
	first_name: 'Matt',
	last_name: 'Short',
	email: 'matt@me.com',
	password: 'password',
	industry: 'Web Development',
	fun_fact: 'I have a PHD in mathematics',
	quote: "If you can't take the heat, get out of the kitchen.",
	location: 'New York, NY',
	current_job: 'GA WDI Instructor',
	site: "codepen.io/"
	})

colleen = Mentor.create({
	first_name: 'Colleen',
	last_name: 'Lynch',
	email: 'colleen@me.com',
	password: 'password',
	industry: 'Product Management',
	fun_fact: 'I knit crazy things',
	quote: 'Be kind!',
	location: 'New York, NY',
	current_job: 'GA PMI Instructor',
	site: 'www.producthunt.com/'
	})

marco = Mentor.create({
	first_name: 'Marco',
	last_name: 'Black',
	email: 'marco@me.com',
	password: 'password',
	industry: 'User Experience Design',
	fun_fact: 'I found a painting by banksy on the street.',
	quote: 'Art is everywhere',
	location: 'New York, NY',
	current_job: 'GA UXDI Instructor',
	site: 'onepagelove.com/'
	})

jessica = Mentor.create({
	first_name: 'Jessica',
	last_name: 'Bergman',
	email: 'jessica@bergman.com',
	password: 'password',
	industry: 'Product Management',
	fun_fact: "I always loved to fly. My father used to be a pilot and would take me on trips on a rented light plane",
	quote: "As a product manager you will wear many hats: business, UX, project management, etc. But first of all, you are a communicator!",
	location: 'Redwood City, CA',
	current_job: 'Product Manager',
	site: 'toggl.com/'
	})

mike = Mentor.create({
	first_name: 'Mike',
	last_name: 'Burnham',
	email: 'mike@burnham.com',
	password: 'password',
	industry: 'User Experience Design',
	fun_fact: "When I was 8 I was on a famous children's television show; I can tell you more about it later
",
	quote: 'If you are not talking to users, you are not doing user-centered design',
	location: 'Boston, MA',
	current_job: 'UI Designer',
	site: 'pttrns.com'
	})

peter = Mentor.create({
	first_name: 'Peter',
	last_name: 'Armstrong',
	email: 'peter@armstrong.com',
	password: 'password',
	industry: 'Web Development',
	fun_fact: "I destroyed my father's work computer when I was 12",
	quote: 'Getting into Web Development has never been as easy as it is now. But you still need a good strategy to get there!',
	location: 'Raleigh, NC',
	current_job: 'Senior Web Developer',
	site: 'getbootstrap.com/'
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
