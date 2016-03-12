class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount HelloApi => '/'
  mount PeopleApi => '/people'
  mount BusinessesApi => '/businesses'
  mount CheckInsApi => '/check_ins'

  add_swagger_documentation
end
