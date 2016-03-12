class CheckInRepresenter < Napa::Representer
  property :id, type: String
  property :person_id, type: Integer
  property :business_id, type: Integer
end
