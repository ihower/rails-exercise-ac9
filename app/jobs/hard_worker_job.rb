class HardWorkerJob < ActiveJob::Base
  queue_as :default

  def perform(topic_id)
    Rails.logger.debug("start doing something: #{topic_id}")
    sleep(10)
    Rails.logger.debug("finish something: #{topic_id}")
  end

end
