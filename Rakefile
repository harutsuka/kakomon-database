require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app' # app.rb 側で DB 接続・models 読み込みを行う想定

# DBタスク設定
ActiveRecord::Tasks::DatabaseTasks.env = ENV['RACK_ENV'] || 'development'
ActiveRecord::Tasks::DatabaseTasks.db_dir = 'db'
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ['db/migrate']
ActiveRecord::Tasks::DatabaseTasks.database_configuration = {
  'development' => { 'url' => ENV['DATABASE_URL'] || 'postgresql://localhost/s_todo' },
  'production'  => { 'url' => ENV['DATABASE_URL'] }
}

# ログ出力
require 'logger'
ActiveRecord::Base.logger = Logger.new($stdout)

# environment タスク（必要なら no-op）
task :environment do
  # no-op（app.rb が初期化済み）
end
