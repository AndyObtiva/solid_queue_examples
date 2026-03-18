class GenerateUserJob < ApplicationJob
  queue_as :default
  
  def perform
    suffix = "#{Time.now.to_i}"
    User.create!(full_name: "Jane Doe #{suffix}", email: "jane.doe.#{suffix}@example.com", last_activity_at: rand(30).days.ago)
  end
end
