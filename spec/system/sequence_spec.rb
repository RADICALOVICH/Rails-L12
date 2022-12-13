# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let(:number_value) { 5 }
  let(:string_array_value) { '10 36 49 50 70' }
  let(:user_email) { 'example@example.com' }
  let(:user_name) { 'example' }
  let(:user_password) { '123' }
  let(:user_log_email) { 'test@test.com' }
  let(:user_log_password) { '123' }

  scenario 'First enter' do
    visit root_path

    expect(page).to have_selector(:link_or_button, 'Sign Up')
    expect(page).to have_selector(:link_or_button, 'Log In')
  end

  scenario 'When user is not log in' do
    visit root_path

    fill_in :number, with: number_value
    fill_in :string_array, with: string_array_value

    find('#calculate-btn').click

    expect(find('#result-container')).to have_text('Войдите, чтобы воспользоваться формой')
  end


  scenario 'Sign up' do
    visit root_path

    find('#sing_up_button').click
    fill_in :email_field, with: user_email
    fill_in :name_field, with: user_name
    fill_in :password_field, with: user_password
    fill_in :password_confirmation_field, with: user_password
    find('#btn_submit').click
    expect(page).to have_text "Welcome, #{user_name}"
  end

  scenario 'Log in' do
    visit root_path

    find('#log_in_btn').click
    fill_in :email_field, with: user_log_email
    fill_in :password_field, with: user_log_password
    find('#btn_submit').click
    expect(page).to have_text 'Welcome back, test'
    expect(page).to have_selector(:link_or_button, 'Edit profile')
    expect(page).to have_selector(:link_or_button, 'Log Out')
  end
end
