require 'pg'
require 'rake'

task :test_environment do
  p 'Cleaning database...'

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the database
  connection.exec('TRUNCATE TABLE links;')
  connection.exec("ALTER SEQUENCE id RESTART WITH 1")

  # Add the test data
  connection.exec("INSERT INTO links (url,title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links (url,title) VALUES('http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links (url,title) VALUES('http://www.facebook.com', 'Facebook');")
end

task :setup do
  p 'Creating databases...'

  %w[bookmark_manager bookmark_manager_test].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
  end
end

task :empty do
  p 'Removing existing databases...'
  %w[bookmark_manager bookmark_manager_test].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("DROP DATABASE #{database};")
  end
end
