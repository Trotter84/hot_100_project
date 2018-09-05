class Song < ApplicationRecord
  validates_presence_of :name


  belongs_to :billboard, optional: true
  belongs_to :artist
end
