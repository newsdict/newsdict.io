class Page < ApplicationRecord
  include Mongoid::Document
  field :url_suffix, type: String
  field :title, type: String
  field :content, type: String
  include Mongoid::Timestamps
  validates :url_suffix, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: [1..200]
end