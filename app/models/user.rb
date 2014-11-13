require 'bcrypt'
require 'gravatar-ultimate'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  attr_accessor :yelp_results
  
  # not currently using this
  geocoded_by :address

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :zip, type: Integer
  field :address
  field :places, type: Array
  field :access, default: 'user'
  field :radius, type: Integer
  # field :bio
  field :latitude, type: Float, default: '0'
  field :longitude, type: Float, default: '0'
  field :traveling, type: Boolean, default: false
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :password_digest, presence: true, :confirmation => true
  # validates_presence_of :password
  # validates_length_of :password, :minimum => 5
  validates_numericality_of :zip, :in => 5
  validates :zip, presence: true
  validates_each :zip do |record, attr, value|
    if value
      if value.to_s.to_region(:state => true) != "CA"
      elsif value.to_s.to_region(:state => true) != "NY"
      elsif value.to_s.to_region(:state => true) != "TX"
      elsif value.to_s.to_region(:state => true) != "OH"
        record.errors.add attr, "Sorry, Iffy isn\'t in your area yet!" 
      end
    end
  end

  has_and_belongs_to_many :moods

# this creates @users.admin to grab all admins
  scope :admin, -> { where(access: "admin")}
  scope :user, -> { where(access: "user")}

   # password SETTER
 def password=(new_password)
     self[:password] = new_password
     self.password_digest = BCrypt::Password.create(new_password)
 end

  attr :password      # ensure this replaces the existing attr_reader

 # password GETTER
 def password
     return self[:password]
 end

  def authenticate(test_password)
    if test_password && BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end

  def gravatar(user_email)
    url = Gravatar.new(user_email).image_url
  end

  def setTravelingTrue
    self.traveling = true
    self.save!
  end

  def setTravelingFalse
    self.traveling = false
    self.save!
  end

  def saveLon x
    self.longitude = x
    self.save!
  end

  def saveLat y
    self.latitude = y
    self.save!
  end
end

