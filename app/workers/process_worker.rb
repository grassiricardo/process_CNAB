class ProcessWorker
  include Sidekiq::Worker

  def process_file
    ProcessFileService.new(File.join Rails.root, "CNAB.txt").process_file
  end
end
