Rails.application.routes.draw do
  mount Root => '/'
  mount GrapeSwaggerRails::Engine => '/swagger', as: 'swagger'
end
