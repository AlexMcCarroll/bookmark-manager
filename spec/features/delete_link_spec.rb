require_relative '../../app.rb'

feature 'Delete link' do
  scenario 'Delete a url link on the homepage' do
    visit('/')
    fill_in 'url', with: 'https://www.bb.co.uk'
    fill_in 'title', with: 'bb'
    click_button 'Submit'
    fill_in 'title_delete', with: 'bb'
    click_button 'Delete'
    expect(page).not_to have_content('bb')
  end
end
