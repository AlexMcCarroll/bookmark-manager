require_relative '../../app.rb'

feature 'Add link' do
  scenario 'Add a url link to homepage' do
    visit('/')
    fill_in 'url', with: 'https://www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    click_button 'Submit'
    expect(page).to have_content('BBC')
  end
end
