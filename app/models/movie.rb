# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord

  has_many(:characters, { :class_name => "Character", :foreign_key => "movie_id", :dependent => :destroy })

  belongs_to(:director, { :required => false, :class_name => "Director", :foreign_key => "director_id" })

  has_many(:cast, { :through => :characters, :source => :actor })

  
end
