class ProcessGithubWebhook < ActiveJob::Base
  queue_as :default

  def perform(params)
    updater = GithubHook::Updater.new(params, params)
    updater.logger = logger
    updater.call
  end
end
