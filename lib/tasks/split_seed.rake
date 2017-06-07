# --=== 客製任務（Task）：rake db:seed:single ===-- #
namespace :db do
  namespace :seed do
    task :single => :environment do

      # 透過路徑找到檔案
      filename = Dir[File.join(Rails.root, 'db', 'seeds', "#{ENV['SEED']}.rb")][0]

      puts "檔案：#{filename}，開始執行。"

      # 如果檔案存在，執行檔案內容
      load(filename) if File.exist?(filename)

      puts "檔案：#{filename}，執行成功。"
    end
  end
end
