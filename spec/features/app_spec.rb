require 'spec_helper'

feature 'homepage' do
  scenario 'can visit index page' do
    visit '/'

    expect(page).to have_content 'Songs'
  end

  scenario 'can add a new song' do
    visit '/'
    click_on 'Add'
    fill_in 'song_name', with: 'Lonesome'
    fill_in 'artist_name', with: 'Dr Dog'
    click_on 'Save'
    expect(page).to have_content 'Dr Dog'
  end
end