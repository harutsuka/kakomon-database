# Rakefile
require 'bundler/setup'
require 'logger'
require 'active_record'

# app.rb で ActiveRecord::Base.establish_connection 済みの場合
require './app'

# Sinatra + ActiveRecord 用タスクを読み込み
require 'sinatra/activerecord/rake'

# DB設定
ActiveRecord::Tasks::DatabaseTasks.env = ENV['RACK_ENV'] || 'production'
ActiveRecord::Tasks::DatabaseTasks.db_dir = 'db'
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ['db/migrate']
ActiveRecord::Tasks::DatabaseTasks.database_configuration = {
  'production'  => { 'url' => ENV.fetch('DATABASE_URL') },
  'development' => { 'url' => ENV['DATABASE_URL'] || 'postgresql://localhost/s_todo' }
}

# ログ
ActiveRecord::Base.logger = Logger.new($stdout)

# environmentタスク（Railsなしで必要）
task :environment do
  # no-op
end
