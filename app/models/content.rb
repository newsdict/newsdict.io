class Content < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps
  include ContentConcern
  field :title, type: String
  field :site_name, type: String
  field :content, type: String
  field :expanded_url, type: String
  # image blob (because active-storage is not support mongoid.)
  field :image_blob, type: BSON::Binary
  field :tags, type: Array
  field :language_code, type: String
  field :source_id, type: BSON::ObjectId
  field :user_id, type: BSON::ObjectId
  field :count_of_shared, type: Integer
  SORT_TYPE = {
    :newest => [:created_at, :desc],
    :updated => [:updated_at, :asc],
    :count => [:count_of_shared, :desc]
  }
  # Get the records
  # @param order default :desc
  # @param limit default: 50
  # @param skip default: 0
  def self.contents(order: :desc, skip: 0, limit: 50)
    self.in(source_id: Sources::TwitterAccount.all.map {|u| u.id })
      .order_by(SORT_TYPE[:newest])
      .skip(skip)
      .limit(limit)
  end
  # Sort the content by sort_type
  # @param [String] SORT_TYPE key
  def self.sortable(sort_type)
    if sort_type && SORT_TYPE.key?(sort_type.to_sym)
      self.order_by(SORT_TYPE[sort_type.to_sym])
    else
      self.order_by(SORT_TYPE[:newest])
    end
  end
end