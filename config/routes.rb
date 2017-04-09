Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'results.json' => 'results#get_all_results'
  post 'results.json' => 'results#add_result'

end
