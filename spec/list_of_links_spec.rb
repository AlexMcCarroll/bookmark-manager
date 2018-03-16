require 'list_of_links'

describe Links do
  describe '#self.all' do
    it 'user can see links' do
      link = Links.all
      urls = link.map(&:title)
      expect(urls).to include 'Makers Academy'
      expect(urls).to include 'Google'
      expect(urls).to include 'Facebook'
    end

    it 'returns links in order of id' do
      index = rand(3)
      expect(Links.all[index].id).to eq((index + 1).to_s)
    end
  end

  describe '#self.create' do
    it 'creates a new link' do
      Links.create(url: 'https://www.bbc.co.uk')
      link = Links.all
      urls = link.map(&:url)
      expect(urls).to include 'https://www.bbc.co.uk'
    end

    it 'rejects invalid URL input' do
      Links.create(url: 'notalink')
      link = Links.all
      urls = link.map(&:url)
      expect(urls).not_to include 'notalink'
    end
  end

  describe '#self.delete' do
    it 'deletes a link input by the user' do
      Links.delete('Makers Academy')
      link = Links.all
      urls = link.map(&:url)
      expect(urls).to_not include 'http://www.makersacademy.com'
    end
  end

  describe '#self.update' do
    it 'can update url' do
      index = rand(3)
      id = Links.all[index].id
      expect { Links.update(id, :url, 'http://valid.org') }.to change { Links.all[index].url }.to('http://valid.org')
    end

    it 'can update title' do
      index = rand(3)
      id = Links.all[index].id
      expect { Links.update(id, :title, 'Valid') }.to change { Links.all[index].title }.to('Valid')
    end
  end
end
