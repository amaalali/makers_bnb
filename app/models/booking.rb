class Booking

  include DataMapper::Resource

  property :id, Serial
  property :status, String, default: "not confirmed"
  property :date, Date

  belongs_to :user
  belongs_to :space

end
