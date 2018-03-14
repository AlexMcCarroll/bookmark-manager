require 'pg'
require 'rake'

desc 'test database setup initiated'
task :test_environment do
  p 'This is in your Rakefile'
  p 'Cleaning database...'

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the database
  connection.exec('TRUNCATE links;')

  # Add the test data
  connection.exec("INSERT INTO links (url) VALUES ('http://www.makersacademy.com');")
  connection.exec("INSERT INTO links (url) VALUES ('http://www.google.com');")
  connection.exec("INSERT INTO links (url) VALUES ('http://www.facebook.com');")
end

desc 'Set up test and development environment'
task :setup do
  begin
      p 'Creating databases...'

      connection = PG.connect
      connection.exec('CREATE DATABASE bookmark_manager;')
    rescue StandardError
      p 'Test database already exists'
    end

  begin
      connection = PG.connect(dbname: 'bookmark_manager')
      begin
        connection.exec('CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
      rescue StandardError
        StandardError
      end
      p 'Links table already exists in Development Database'
    end

  begin
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec('CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60));')
  rescue StandardError
    p 'Links table already exists in Test Database'
  end
end
