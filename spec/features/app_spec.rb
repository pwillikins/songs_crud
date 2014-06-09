require 'spec_helper'

feature 'homepage' do
  scenario 'can visit index page' do
    visit '/songs'

    expect(page).to have_content 'Songs'
  end

  scenario 'can add a new song and view the details' do
    visit '/songs'
    click_on 'Add'
    fill_in 'song_name', with: 'Lonesome'
    fill_in 'artist_name', with: 'Dr Dog'
    click_on 'Save'
    expect(page).to have_link 'Dr Dog'

    click_on 'Dr Dog'
    expect(page).to have_content 'Artist: Dr Dog'
    expect(page).to have_content 'Song Title: Lonesome'
  end
end