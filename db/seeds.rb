include Faker

20.times {
    new_user = User.create(
    display_name: Faker::Internet.user_name,
    email: Faker::Internet.free_email,
    password_hash: ( Faker::Internet.password(16)[0].upcase ) ,
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
    title: Faker::Lorem.sentence,
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
