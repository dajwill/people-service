class CheckInsApi < Grape::API
  desc 'Get a list of check_ins'
  params do
    optional :ids, type: Array, desc: 'Array of check_in ids'
  end
  get do
    check_ins = params[:ids] ? CheckIn.where(id: params[:ids]) : CheckIn.all
    represent check_ins, with: CheckInRepresenter
  end

  desc 'Create an check_in'
  params do
    requires :person_id, type: Integer, desc: 'Id of user checking in'
    requires :business_id, type: Integer, desc: 'Id of business'
  end

  post do
    check_in = CheckIn.create!(permitted_params)
    represent check_in, with: CheckInRepresenter
  end

  params do
    requires :id, desc: 'ID of the check_in'
  end
  route_param :id do
    desc 'Get an check_in'
    get do
      check_in = CheckIn.find(params[:id])
      represent check_in, with: CheckInRepresenter
    end

    desc 'Update an check_in'
    params do
    end
    put do
      # fetch check_in record and update attributes.  exceptions caught in app.rb
      check_in = CheckIn.find(params[:id])
      check_in.update_attributes!(permitted_params)
      represent check_in, with: CheckInRepresenter
    end
  end
end
