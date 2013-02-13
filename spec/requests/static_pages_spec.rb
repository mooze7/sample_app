require 'spec_helper'

describe "Static pages" do

	let (:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }
	
	shared_examples_for "all_static_pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: title) }
	end

  	describe "Home page" do
		before { visit root_path }
		let (:heading) { 'Sample App' }
		let (:title) { "#{base_title}" }
		it_should_behave_like 'all_static_pages' 
		it { should_not have_selector('title', text: '| Home') }
	end    
	
  	describe "Help page" do
		before { visit help_path }		
		let (:heading) { 'Help' }
		let (:title) { "#{base_title} | Help" }
		it_should_behave_like 'all_static_pages' 			
	end
	
  	describe "About page" do
		before { visit about_path }		
		let (:heading) { 'About Us' }
		let (:title) { "#{base_title} | About Us" }		
		it_should_behave_like 'all_static_pages' 			
	end
		
  	describe "Contact page" do
		before { visit contact_path }		
		let (:heading) { 'Contact' }
		let (:title) { "#{base_title} | Contact" }		
		it_should_behave_like 'all_static_pages' 			
	end
	
	it "It should have proper links" do
	
		visit root_path 
		click_link "About"
		should have_selector 'title', text: "#{base_title} | About Us"
		click_link "Help"
		should have_selector 'title', text: "#{base_title} | Help"
		click_link "Contact"
		should have_selector 'title', text: "#{base_title} | Contact"
		click_link "Home"
		should have_selector 'title', text: "#{base_title}"
		click_link "Sign up now!"
		should have_selector 'title', text: "#{base_title} | Sign up"
		click_link "sample app"
		should have_selector 'title', text: "#{base_title}"
	end
end

