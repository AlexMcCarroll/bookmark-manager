require 'list_of_links'

describe Links do
  describe '#self.all' do
    it 'user can see links' do
      links = Links.all
      expect(links).to include 'http://www.makersacademy.com'
      expect(links).to include 'http://www.google.com'
      expect(links).to include 'http://www.facebook.com'
    end
  end

  describe '#self.create' do
    it 'creates a new link' do
      Links.create('https://www.bbc.co.uk')
      expect(Links.all).to include 'https://www.bbc.co.uk'
    end

    it 'rejects invalid URL input' do
      Links.create('notalink')
      expect(Links.all).not_to include 'notalink'
    end
  end
end
