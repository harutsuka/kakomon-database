# Rakefile
require 'bundler/setup'
require 'logger'
require 'active_record'

# app.rb で establish_connection しているなら先に読み込む
require './app'

# ActiveRecordのDBタスク
require 'active_record/railties/databases.rake'

# DBタスクに必要な設定
ActiveRecord::Tasks::DatabaseTasks.env = ENV['RACK_ENV'] || 'production'
ActiveRecord::Tasks::DatabaseTasks.db_dir = 'db'
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ['db/migrate']
ActiveRecord::Tasks::DatabaseTasks.database_configuration = {
  'production'  => { 'url' => ENV.fetch('DATABASE_URL') },
  'development' => { 'url' => ENV['DATABASE_URL'] || 'postgresql://localhost/s_todo' }
}

# ログが見えると便利
ActiveRecord::Base.logger = Logger.new($stdout)

# Railsが無いので environment タスクをダミー定義
task :environment do
  # no-op
end
