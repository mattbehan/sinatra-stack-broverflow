include Faker

bro_names = ["Brobama", "EdgarAllenBro", "Broseidon", "seniorBroGrammer", "chadbrochill69", "theDMB518", "aBROham Lincoln", "BrozoTheClown22", "ScottBroscius32", "Brobi-wan Kenobi", "TonyBromo11", "Blake", "Brody", "Brodo Baggins", "ezpz", "Skyler", "Tad", "Kelly", "Carson", "laxxx00", "topCheddar34", "Johnnyjabroni00", "BobbyLeeSwagger", "skittles", "butters", "joeyBones", "TommyD89", "curlBro00", "Gronk87", "McLovin"]

bro_questions=["Brahs, wher is the chillest spot 2 lax in Lincoln Park?", "Does Subway ever get old?", "Is it chill to do yoga in my lax pinnie?",  "Partied with Nic Cage in Vegas. I think he stole my wallet", "Are vegetables actually 'necessary'?", "How many of you guys cried during Bambi? Don't Lie","Can't stop falling asleep in Stats 101", "Can any nerds here help me program my drone to fly around and make breakfast like that chillass robot from flubber?", "Least chill bro showoff- Donald Trump vs. Kanye West", "Is it dangerous to eat a pound of protein powder? What about if you didn't drink any water with it?", "I just got fired for showing up to a client meeting in my lax pinnie. Whats the deal?","What do people mean when they say for all intense and purposes?", "I knew Hermione from Harry Potter would grow up to be a looker", "I can't stop drinking milk...", "Watched Gladiator for the thirty first time last night. Never gets old. Russell Crowe is such a bro","Tom Cruise used to be the man. What happened to that jabroni.", "People keep saying tell me how you feel. What the hell are they talking about?", "Old spice v Pantene Flow V. What do you love more", "Dave Matthews at Spac.... worth?", "How many times do they let you go back to college before they kick you out?"]

x=Array.new(10,Faker::Lorem.sentence)
bro_questions += x


20.times {
    new_user = User.create(
    display_name: bro_names.shift,
    email: Faker::Internet.free_email,
    password: ( Faker::Internet.password(16)[0].upcase ) ,
    birthday: 40.years.ago,
    bio: Faker::Lorem.paragraph,
    website_link: Faker::Internet.url
     )
}

# create 30 questions
30.times {
  questions_time = (rand(10)+1)
  question = Question.create(
    user_id: rand(20)+1,
    title: bro_questions.shift,
    body: Faker::Lorem.paragraph,
    created_at: questions_time.days.ago
    )
  # for every question, create 2 questions and 2 comments,
  2.times {
    question.comments.create(
      user_id: rand(20)+1,
      text: Faker::Lorem.sentence,
      created_at: (rand(questions_time)+1).days.ago
      )

    answers_time = rand(questions_time) + 1
    answer = question.answers.create(
      text: Faker::Lorem.paragraph,
      # answers user_id cannot be the questions user_id
      user_id: ([*1..20]-[question.user_id]).sample,
      created_at: answers_time.days.ago
      )
    # for every answer, create two comments
    2.times {
      answer.comments.create(
        user_id: rand(20)+1,
        text: Faker::Lorem.sentence,
        created_at: (rand(answers_time)+1).days.ago
        )
    }
  }
}


# question.tags.find_or_create_by(name: [Faker::Hacker.noun, Faker::Hacker.adjective, Faker::Lorem.word].sample)

1000.times {
  type = ["Answer", "Question", "Comment"].sample
  id = rand(Object.const_get(type).count)+1
  Vote.create(
    value: [1,1,1,-1].sample,
    user_id: rand(20)+1,
    votable_type: type,
    votable_id: id
    )
}

i=1
30.times do
  Tag.create(
    name: Faker::Company.catch_phrase
    )
  j=0
  4.times do
    Tagging.find_or_create_by(
      tag_id: [i+j, 30].min,
      question_id: i
      )
    j+=1
  end
  i+=1
end