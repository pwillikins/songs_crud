require 'spec_helper'

feature 'homepage' do
  scenario 'can visit index page' do
    visit '/songs'
    expect(page).to have_content 'Song List'
  end

  scenario 'can add a new song and view the details' do
    visit '/songs'
    click_on 'Add New Song'
    fill_in 'song_name', with: 'Lonesome'
    fill_in 'artist_name', with: 'Dr Dog'
    click_on 'Save'
    expect(page).to have_link 'Lonesome'

    click_on 'Lonesome'
    expect(page).to have_content 'Artist: Dr Dog'
    expect(page).to have_content 'Song Title: Lonesome'
  end

  scenario 'user can edit a song' do
    visit '/songs'
    click_on 'Add New Song'
    fill_in 'song_name', with: 'Lonesome'
    fill_in 'artist_name', with: 'Dr Dog'
    click_on 'Save'
    expect(page).to have_link 'Lonesome'

    click_on 'Lonesome'
    click_on 'Edit'
    fill_in 'artist_name', with: 'Dr Dog'
    fill_in 'song_name', with: 'Do the Trick'
    click_on 'Save'
    expect(page).to have_content 'Do the Trick'
  end
end