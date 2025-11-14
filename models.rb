require 'bundler/setup'
Bundler.require
require 'yaml'

# Sinatra/Rackの環境（RACK_ENV）がなければ development を使う
env = ENV['RACK_ENV'] || 'development'

# DATABASE_URL 優先。なければ config/database.yml を使う。
db_config = ENV['DATABASE_URL'] || YAML.load_file('config/database.yml')[env]

# ActiveRecord に接続設定を渡す
ActiveRecord::Base.establish_connection(db_config)

# タイムゾーン設定
Time.zone = 'Tokyo'
ActiveRecord::Base.default_timezone = :local

class Post < ActiveRecord::Base
  has_many :images, dependent: :destroy
end

class Category < ActiveRecord::Base
  has_many :posts
end

class Image < ActiveRecord::Base
  belongs_to :post
end
