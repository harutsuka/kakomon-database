require "bundler/setup"
Bundler.require

ActiveRecord::Base.establish_connection

class Post < ActiveRecord::Base
  has_many :images, dependent: :destroy
end

class Category < ActiveRecord::Base
  has_many :posts
end

class Image < ActiveRecord::Base
  belongs_to :posts
end
