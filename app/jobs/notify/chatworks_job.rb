class Notify::ChatworksJob < ApplicationJob
  queue_as :default
  def perform
    Configs::Tokens::Chatwork.all.each do |chatwork|
      schedule = chatwork.configs_schedule
      if schedule.is_active && schedule.runnable_time?
        gt = schedule.last_schedule_at.to_s
        lte = Time.now.to_s
        contents = Contents::Web.contents(category_id: chatwork.notify_target_category_id).sortable.term(gt, lte)
        if contents.exists?
          text = Array.new
          contents.each do |content|
            text.push("- #{content.title}")
            text.push("+-- #{content.expanded_url}")
          end
          chatwork.client.create_message(room_id: chatwork.room_id, body: chatwork.create_message(text))
        end
      end
    end
  end
end