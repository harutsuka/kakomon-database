require 'active_record'
require 'pg'

# データベース接続
db_config = ENV['DATABASE_URL'] || 'postgresql://localhost/s_todo'
ActiveRecord::Base.establish_connection(db_config)

# マイグレーションタスクを読み込み
require 'active_record/tasks/database_tasks'

# データベース設定
db_dir = File.expand_path('db', __dir__)
ActiveRecord::Tasks::DatabaseTasks.database_configuration = {
  'development' => {
    'adapter' => 'postgresql',
    'database' => 's_todo'
  },
  'production' => {
    'adapter' => 'postgresql',
    'url' => ENV['DATABASE_URL']
  }
}
ActiveRecord::Tasks::DatabaseTasks.db_dir = db_dir
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ["#{db_dir}/migrate"]
ActiveRecord::Tasks::DatabaseTasks.env = ENV['RACK_ENV'] || 'development'

# マイグレーションタスクを定義
namespace :db do
  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::MigrationContext.new(ActiveRecord::Tasks::DatabaseTasks.migrations_paths).migrate
    Rake::Task["db:schema:dump"].invoke if ActiveRecord::Tasks::DatabaseTasks.env == 'development'
  end

  desc "Rollback the database"
  task :rollback do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::MigrationContext.new(ActiveRecord::Tasks::DatabaseTasks.migrations_paths).rollback(step)
  end

  desc "Create the database"
  task :create do
    ActiveRecord::Tasks::DatabaseTasks.create_current
  end

  desc "Drop the database"
  task :drop do
    ActiveRecord::Tasks::DatabaseTasks.drop_current
  end

  namespace :schema do
    desc "Dump the database schema"
    task :dump do
      require 'active_record/schema_dumper'
      filename = "#{db_dir}/schema.rb"
      File.open(filename, "w:utf-8") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end

    desc "Load the database schema"
    task :load do
      load("#{db_dir}/schema.rb")
    end
  end
end

require "./models"
