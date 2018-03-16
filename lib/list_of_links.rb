# list of links
require_relative './database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

class Links
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    # moved if else connection into database_connection_setup.rb
    result = DatabaseConnection.query('SELECT * FROM links ORDER BY id ASC')
    result.map { |link| Links.new(link['id'], link['url'], link['title']) }
  end

  def self.create(input)
    if valid_url?(input[:url])
      DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{input[:url]}', '#{input[:title]}');")
    end
  end

  def self.delete(name)
    DatabaseConnection.query("DELETE FROM links WHERE title = '#{name}'")
  end

  def self.update(id, update_field, new_value)
    if update_field == :url
      DatabaseConnection.query("UPDATE links SET url = '#{new_value}' WHERE id = #{id}")
    elsif update_field == :title
      DatabaseConnection.query("UPDATE links SET title = '#{new_value}' WHERE id = #{id}")
    end
  end

  private

  def self.valid_url?(url)
    url =~ URI::DEFAULT_PARSER.make_regexp ? true : false
  end
end
