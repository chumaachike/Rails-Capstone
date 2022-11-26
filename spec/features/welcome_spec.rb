require 'rails_helper'

RSpec.describe 'Splash page', type: :feature do
  describe 'without FactoryBot login' do
    it 'will present splash page' do
      visit '/'
      expect(current_path).to eq(root_path)
    end


    it 'will have link to "Log in"' do
      visit root_path
      expect(page).to have_link('LOG IN')
    end

    it 'will have link to "Sign up"' do
      visit root_path
      expect(page).to have_link('SIGN UP')
    end

    it 'will have classes for bootstrap cards' do
      visit root_path
      expect(page).to have_css('.card-body')
      expect(page).to have_css('.card-title')
      expect(page).to have_css('.card-image')
    end

    it 'will have log in page content' do
      visit root_path
      click_link 'LOG IN'
      expect(page).to have_content('LOGIN')
    end

    it 'will have log in page with button "Log In"' do
      visit root_path
      click_link 'LOG IN'
      expect(page).to have_button('Log In')
    end

    it 'will have log in page with link "Forgot your password?"' do
      visit root_path
      click_link 'LOG IN'
      expect(page).to have_link('Forgot your password?')
    end

    it 'will have log in page with input fields' do
      visit root_path
      click_link 'LOG IN'
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end

    it 'will have log in page with classes for bootstrap forms' do
      visit root_path
      click_link 'LOG IN'
      expect(page).to have_css('.form-group')
      expect(page).to have_css('.form-control')
    end

    it 'will have sign up page content' do
      visit root_path
      click_link 'SIGN UP'
      expect(page).to have_content('REGISTER')
    end

    it 'will have sign up page with button "Next"' do
      visit root_path
      click_link 'SIGN UP'
      expect(page).to have_button('Next')
    end

    it 'will have sign up page with input fields' do
      visit root_path
      click_link 'SIGN UP'
      expect(page).to have_field('Full name')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password (6 characters minimum)')
      expect(page).to have_field('Password (6 characters minimum)')
    end

    it 'will have sign up page with classes for bootstrap forms' do
      visit root_path
      click_link 'SIGN UP'
      expect(page).to have_css('.form-group')
      expect(page).to have_css('.form-control')
    end
  end
end
