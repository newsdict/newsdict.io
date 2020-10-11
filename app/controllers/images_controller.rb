class ImagesController < ApplicationController
  # index
  def index
    content = Contents::Web.find(params[:id])
    if content && content.image_blob
      send_data content.image_blob.data, :type => 'image', :disposition => 'inline'
    elsif content && content.image_svg
      send_data content.image_svg, type: 'image/svg+xml'
    else
      raise ::ImageNotFoundException
    end
  end
  # View user's icon
  # @params [BSON::ObjectId] id
  def user_icon(id)
    source = Source.find(id)
    if source.icon
      send_data source.icon_blob.data, :type => 'image', :disposition => 'inline'
    else
      raise ::ImageNotFoundException
    end
  end
end