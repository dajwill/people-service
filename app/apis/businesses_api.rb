class BusinessesApi < Grape::API
  desc 'Get a list of businesses'
  params do
    optional :ids, type: Array, desc: 'Array of business ids'
  end
  get do
    businesses = params[:ids] ? Business.where(id: params[:ids]) : Business.all
    represent businesses, with: BusinessRepresenter
  end

  # params '/business_type/(:business_type)' do
  #   requires :business_type, type: String, desc: 'business type'
  # end
  # route_param :business_type do
  #   desc 'Sort by business type'
  #   get '/:business_type' do
  #     businesses = Business.where(business_type: params[:business_type])
  #     represent businesses, with: BusinessRepresenter
  #   end
  # end

  desc 'Create an business'
  params do
    optional :name, type: String, desc: 'The Name of the business'
    optional :business_type, type: String, desc: 'The type of the business'
  end

  post do
    business = Business.create!(permitted_params)
    represent business, with: BusinessRepresenter
  end

  params do
    requires :id, desc: 'ID of the business'
  end
  route_param :id do
    desc 'Get an business'
    get do
      business = Business.find(params[:id])
      represent business, with: BusinessRepresenter
    end

    desc 'Update an business'
    params do
    end
    put do
      # fetch business record and update attributes.  exceptions caught in app.rb
      business = Business.find(params[:id])
      business.update_attributes!(permitted_params)
      represent business, with: BusinessRepresenter
    end
  end
end
