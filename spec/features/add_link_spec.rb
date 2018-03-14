require_relative '../../app.rb'

feature 'Add link' do
  scenario 'Add a url link to homepage' do
    visit('/')
    fill_in 'url', with: 'http://www.makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    click_button 'Submit'
    expect(page).to have_content('Makers Academy')
  end
end
