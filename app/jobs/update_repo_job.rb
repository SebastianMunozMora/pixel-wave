class UpdateRepoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    system("echo 'updating repo' || git pull")
  end
end
