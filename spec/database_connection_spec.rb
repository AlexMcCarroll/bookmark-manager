require 'database_connection'

describe DatabaseConnection do

  describe '#self.setup' do
    it 'sets up database connection with PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#self.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM links;")
      DatabaseConnection.query("SELECT * FROM links;")
    end
  end
end
