require 'rails_helper'

describe 'posts' do
  context 'no posts' do
    it 'displays a prompt to create posts' do
      visit '/posts'

      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New post'
    end
  end

  context 'with posts' do
    before do
      alex = User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
      alex.posts.create(title: 'Cool post', description: 'Hello world')
    end

    it 'displays the posts' do
      visit '/posts'

      expect(page).to have_content 'Cool post'
    end
  end
end

describe 'creating posts' do
  context 'when logged out' do
    it 'is impossible' do
      visit '/posts'
      click_link 'New post'
      expect(page).to have_content 'Sign in'
      expect(page).not_to have_field 'Title'
    end
  end

  context 'when logged in' do
    before do
      alex = User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
      login_as alex
    end

    it 'adds the post to the homepage' do
      visit '/posts/new'
      fill_in 'Title', with: 'My new post'
      fill_in 'Description', with: 'Lorem ipsum'
      click_button 'Post it!'

      expect(current_path).to eq posts_path
      expect(page).to have_content 'My new post'
      expect(page).to have_content 'Posted by: alex@example.com'
      expect(page).not_to have_css 'img.uploaded-pic'
    end

    it 'can add a photo to our posts' do
      visit '/posts/new'
      fill_in 'Title', with: 'My new post'
      fill_in 'Description', with: 'Lorem ipsum'
      attach_file 'Image', Rails.root.join('spec/images/old-man1.jpg')

      click_button 'Post it!'

      expect(current_path).to eq posts_path
      expect(page).to have_css 'img.uploaded-pic'
    end
  end
end