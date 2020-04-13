class Content < ApplicationRecord
  include Mongoid::Document
  include ContentConcern
  has_one :source
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
  # unique id of source
  field :unique_id, type: String
  include Mongoid::Timestamps
  belongs_to :source, optional: true
  belongs_to :user, optional: true
  validates_uniqueness_of :unique_id, :allow_nil => true
  SORT_TYPE = {
    :newest => [:created_at, :desc],
    :updated => [:updated_at, :desc],
    :count => [:count_of_shared, :desc]
  }
  # Get the records
  # @param order default :desc
  # @param category default: nil
  def self.contents(order: :desc, category: nil, name: nil)
    if name
      self.in(source_id: Sources::TwitterAccount.find_by(name: name))
    elsif category
      self.in(source_id: Sources::TwitterAccount.where(category: category).map {|u| u.id })
    else
      self.in(source_id: Sources::TwitterAccount.all.map {|u| u.id })
    end
  end
  # Sort the content by sort_type
  # @param [String] sort_type
  def self.sortable(sort_type)
    if sort_type && SORT_TYPE.key?(sort_type.to_sym)
      self.order_by((SORT_TYPE[sort_type.to_sym]))
    else
      self.order_by((SORT_TYPE[:newest]))
    end
  end
  # Exclude domain
  def self.exclude_domain
    if ::Filters::Content.exists?
      self.not(expanded_url: /(#{::Filters::Content.all.map {|c| c.exclude_domain }.join('|')})/)
    else
      self.all
    end
  end
end