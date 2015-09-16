Rails.application.routes.draw do
  root 'documents#index'

  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }

  resources :translations, only: [:index]
  resources :documents do
    resources :translations, shallow: true
  end

  get 'tp_en/:tokipona_phrase_id/(:practical_role)' => 'english_phrases#from_tokipona',
    as: :tp_en,
    defaults: { format: 'json' }
end
