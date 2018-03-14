# list of links
require_relative './database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

class Links
  attr_reader :links

  def self.all
    # moved if else connection into database_connection_setup.rb
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| link['url'] }
  end

  def self.valid_url?(url)
    url =~ URI::DEFAULT_PARSER.make_regexp ? true : false
  end

  def self.create(url)
    if valid_url?(url)
      DatabaseConnection.query("INSERT INTO links (url) VALUES('#{url}')")
    end
  end
end
