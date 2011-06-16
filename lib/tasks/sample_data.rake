require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_articles
    make_roles
  end
end

def make_users
  admin = User.create!(:name => "admin",
                       :email => "a@a.com",
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
  User.all(:limit => 1).each do |user|
    50.times do
      title   = Faker::Name.name
      content = Faker::Lorem.sentence(15)
      user.articles.create!(:content => content, :title => title)
    end
  end
end

def make_roles
  Role.create!(:name => 'admin')
  Role.create!(:name => 'intervenant')
  Role.create!(:name => 'direction')
  Role.create!(:name => 'student')
  Role.create!(:name => 'webuser')
end





















