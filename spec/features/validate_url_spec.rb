require_relative '../../app.rb'

feature 'Validate URL' do
  scenario 'Check user entry is a url' do
    visit('/')
    fill_in 'url', with: 'notalink'
    click_button 'Submit'
    expect(page).to have_content('Not valid!')
  end
end
