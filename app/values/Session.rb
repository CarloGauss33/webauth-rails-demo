class Session
  attr_reader :user_id, :challenge

  def initialize(user_id: nil, challenge: nil)
    @user_id = user_id
    @challenge = challenge
  end

  def self.find(user_id)
    challenge = Redis.new.call("GET", "challenge:#{user_id}")
    return unless challenge

    new(user_id: user_id, challenge: challenge)
  end

  def self.create(user_id)
    challenge = SecureRandom.base64(32)

    Redis.new.call("SET", "challenge:#{user_id}", challenge)

    new(user_id: user_id, challenge: challenge)
  end

  def self.find_or_create(user_id)
    find(user_id) || create(user_id)
  end

  def self.destroy(user_id)
    Redis.new.call("DEL", "challenge:#{user_id}")
  end
end
