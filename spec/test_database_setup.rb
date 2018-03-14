# require 'pg'
#
# p 'Cleaning database...'
#
# connection = PG.connect(dbname: 'bookmark_manager_test')
#
# # Clear the database
# connection.exec('TRUNCATE links;')
#
# # Add the test data
# connection.exec("INSERT INTO links (url) VALUES ('http://www.makersacademy.com');")
# connection.exec("INSERT INTO links (url) VALUES ('http://www.google.com');")
# connection.exec("INSERT INTO links (url) VALUES ('http://www.facebook.com');")
