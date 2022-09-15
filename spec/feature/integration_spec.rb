# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
   
    expect(page).to have_content('3 errors prohibited this book from being saved:')
  end
end


RSpec.describe 'Testing added attributes', type: :feature do
  let!(:book) {Book.create(title: 'harry potter', author: 'mark twain', price: '10.00', publishedDate: '2017-03-09')}
  
  scenario 'title check' do
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'show author' do
   visit books_path
   click_on 'Show'
    
   expect(page).to have_content('mark twain')
  end

  scenario 'update price' do
   visit books_path
   click_on 'Edit'
   fill_in 'Price', with: '2.00'
   click_on 'Update Book'
   expect(page).to have_content('2.0')
  end

  scenario 'show date' do
   visit books_path
   click_on 'Show'
    
   expect(page).to have_content('2017-03-09')
  end

end

