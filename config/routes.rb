Rails.application.routes.draw do
  get 'static_pages/home'

  root 'documents#index'

  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }

  resources :documents do
    resources :translations, shallow: true
  end
  resources :translations, only: [:index]

  get 'tp_en/:tokipona_phrase_id' => 'english_phrases#from_tokipona',
    as: :tp_en,
    defaults: { format: 'json' }
end
