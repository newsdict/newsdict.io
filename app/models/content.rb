class Content < ApplicationRecord
  include Mongoid::Document
  include ContentConcern
  has_one :source
  has_one :user
  field :title, type: String
  field :site_name, type: String
  field :content, type: String
  field :expanded_url, type: String
  # image blob (because active-storage is not support mongoid.)
  field :image_blob, type: BSON::Binary
  field :tags, type: Array
  field :http_status, type: Integer
  field :language_code, type: String
  field :source_id, type: BSON::ObjectId
  field :user_id, type: BSON::ObjectId
  field :count_of_shared, type: Integer
  # unique id of source
  field :unique_id, type: String
  include Mongoid::Timestamps
  belongs_to :source, optional: true
  belongs_to :user, optional: true
  validates_uniqueness_of :unique_id, :allow_nil => true
  validates :language_code, length: {minimum: 2, maximum: 2}
  validates :unique_id, length: {maximum: 255}
  SORT_TYPE = {
    :created_at => {created_at: :desc},
    :updated_at => {updated_at: :desc},
    :count_of_shared => {count_of_shared: :desc}
  }
  # Get tags longer than a certain number of characters
  # @param [Integer] number tag length
  def longer_tags(number = 3)
    tags.map {|tag| tag if tag.length >= number }.compact.reject(&:empty?)
  end
  # Deduce page num from a model given a scope
  # ref: https://github.com/kaminari/kaminari/issues/205
  # @params [Array] options
  # @return [Integer] page number
  def page_num(options = {})
    column = options[:by] || :id
    order  = options[:order] || :asc
    per    = options[:per] || self.class.default_per_page
  
    operator = (order == :asc ? "<=" : ">=")
    (self.class.where("#{column} #{operator} ?" => read_attribute(column)).order("#{column} #{order}").count.to_f / per).ceil
  end
end