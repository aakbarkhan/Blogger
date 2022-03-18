require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'Page should have username of other users' do
    @user1 = User.create(name: 'aku', email: 'aku@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    @user2 = User.create(name: 'aku1', email: 'aku1@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    @user3 = User.create(name: 'aku2', email: 'aku2@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    expect(page).to have_content 'aku'
    expect(page).to have_content 'aku1'
    expect(page).to have_content 'aku2'
  end

  scenario 'Page should have profile photo for each user' do
    @user1 = User.create(name: 'aku', email: 'aku@gmail.com', password: 'qwerty', confirmed_at: Time.now,
                         photo: 'http/url/image')
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    expect(find('img') do |img|
             img[:src] == 'http/url/image'
           end).to be_truthy
  end

  scenario 'Should see number of post for each user' do
    @user1 = User.create(name: 'aku', email: 'aku@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    @user2 = User.create(name: 'aku1', email: 'aku1@gmail.com', password: 'qwerty', confirmed_at: Time.now)

    Post.create(title: 'Today is holiday', text: 'going to the moon', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    expect(page).to have_content "Number of posts: #{@user1.posts.size}"
    expect(page).to have_content 'Number of posts: 1'
  end

  scenario "When click on user Should redirected to that user's show page" do
    @user1 = User.create(name: 'Raland', email: 'Raland@gmail.com', password: 'helloworld', confirmed_at: Time.now)
    @user2 = User.create(name: 'femi', email: 'femi@gmail.com', password: 'helloworld', confirmed_at: Time.now)

    Post.create(title: 'Going to the money',
                text: 'Once opon time', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    expect(page).to have_content 'Once opon time'
  end
  # rubocop:enable Metrics/BlockLength
end
