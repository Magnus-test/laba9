Rails.application.routes.draw do
  get 'palindrome/input'
  get 'palindrome/view'

  root 'palindrome#input'
end
