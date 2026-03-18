class GenerateUsersJob < ApplicationJob
  queue_as :default
  retry_on StandardError, wait: 3.seconds, attempts: 5
  
  def perform
    raise 'Hell' if GenerateUsersJob.raise_error?
    
    now_in_millis = Time.now.to_i
    1000.times do |n|
      suffix = "#{now_in_millis}.#{n+1}"
      User.create!(full_name: "John Doe #{suffix}", email: "john.doe.#{suffix}@example.com", last_activity_at: rand(30).days.ago)
    end
  end
  
  class << self
    def raise_error?
      @@raise_error = false unless defined?(@@raise_error)
      @@raise_error = !@@raise_error
      @@raise_error
    end
  end
end
