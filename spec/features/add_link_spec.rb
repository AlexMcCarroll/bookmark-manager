require_relative '../../app.rb'

feature 'Add link' do
  scenario 'Add a url link to homepage' do
    visit('/')
    fill_in 'url', with: 'https://www.bbc.co.uk'
    click_button 'Submit'
    expect(page).to have_content('https://www.bbc.co.uk')
  end
end
