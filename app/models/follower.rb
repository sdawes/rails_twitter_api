class Follower < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :twitter_uid, :name, :screen_name
end
