class Received

  include DataMapper::Resource

  property :id, Serial
  property :status, String
  proerty :date, Date

  belongs_to, :user
  belongs_to, :space

end
