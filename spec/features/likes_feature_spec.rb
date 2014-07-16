require 'rails_helper'

describe 'liking posts' do
  before do
    alex = User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
    alex.posts.create(title: 'Cool post', description: 'Hello world')
  end

  it 'is initially at 0 likes' do
    visit '/posts'
    expect(page).to have_link '❤ 0'
  end

  it 'can be liked, incrementing the likes count', js: true do
    visit '/posts'
    click_link '❤ 0'
    expect(page).to have_link '❤ 1'
  end
end
