::Refinery::Application.routes.draw do
  resources :testimonials, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :testimonials, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
