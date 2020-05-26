# Deprecated class
module Sources
  class WebSection < ::Source
    include ::SourceWebSiteConcern
    field :source_url, type: String
    field :xpath, type: String, default: ""
    validates :name, :category_id, presence: true
    validates :source_url, presence: true, format: { with: URI.regexp }, length: { maximum: 2000 }
    def media_name
      "WebSection"
    end
  end
end