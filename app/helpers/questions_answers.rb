def create_if_different_vote_value(votes,session,value)
  duplicate_checker = false
  votes.each do |vote|
    if vote.user_id == session
      duplicate_checker = true
      vote.destroy
      if vote.value != value
        duplicate_checker = true
        votes.create(user_id: session, value: value)
      end
      return
    end
  end
  if duplicate_checker == false
    votes.create(user_id: session, value: value)
  end
end

def destroy_old_vote_and_create_new_vote(votes,session,value)
  # logger.info (votes)
  # logger.info (session)
  # logger.info (value)
  if votes != []
    create_if_different_vote_value(votes,session,value)
  else
    votes.create(user_id: session, value: value)
  end
end

def errors_exist?
  !self.errors.messages.empty?
end
