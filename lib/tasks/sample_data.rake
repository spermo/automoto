require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_articles
  end
end

def make_users
  admin = User.create!(:name => "gregoire",
                       :email => "g@g.com",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "fake-#{n+1}@test.com"
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_articles
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Lorem.sentence(5)
      user.articles.create!(:content => content)
    end
  end
end
