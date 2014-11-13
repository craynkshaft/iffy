require 'yelp'

class Mood
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  field :name, type: String
  field :description, type: String
  field :keywords, type: Array, default: []
  field :days, type: Array, default: []
  field :photo, type: String
  field :sort, type: Integer
  field :selected, type: Integer
  slug :name
  validates :name, presence: true, uniqueness: true 

  belongs_to :category
  has_and_belongs_to_many :dayparts
  has_and_belongs_to_many :places

  def searchYelp(current_user)
    
    params = {
      category_filter: self.category.path,
      # limit: 1,
      radius_filter: current_user.radius,
      sort: self.sort,
      term: self.keywords.join('+')
    }

    # if current_user.latitude > 0 && current_user.traveling
    # pop up modal
    # Iffy noticed you're not searching from cityname. Would you like to search in newcityname instead? You could also update your location in your account profile
      coordinates = {
        latitude: current_user.latitude,
        longitude: current_user.longitude
      }
    # else
      # coordinates = {
      #   latitude: current_user.zip.to_s.to_lat,
      #   longitude: current_user.zip.to_s.to_lon
      # }
    # end
      # current_user.places << @mood.searchYelp(current_user).businesses[0].id
      
    @yelp_results ||= Yelp.client.search_by_coordinates(coordinates, params)
    

  end
end

