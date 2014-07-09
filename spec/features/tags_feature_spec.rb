require 'rails_helper'

describe 'tagging posts' do
  context 'when logged in' do
    before do
      alex = User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
      login_as alex
    end

    it 'adds the post to the homepage' do
      visit '/posts/new'
      fill_in 'Title', with: 'My new post'
      fill_in 'Description', with: 'Lorem ipsum'
      fill_in 'Tags', with: '#yolo, #swag'
      click_button 'Post it!'

      expect(page).to have_link '#yolo'
      expect(page).to have_link '#swag'
    end
  end
end