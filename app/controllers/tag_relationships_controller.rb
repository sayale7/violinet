class TagRelationshipsController < ApplicationController

  def create
    @tag = Tag.find(params[:tag_id])
    unless params[:tags].nil?
      params[:tags].each do |tag|
        @tag_relationship = @tag.tag_relationships.build(:parent_id => tag)
        @tag_relationship.save
      end
    end
    redirect_to edit_tag_path(@tag)
  end
  
  def destroy
    @tag = Tag.find(params[:tag_id])
    unless params[:tags].nil?
      params[:tags].each do |tag|
        @tag_relationship = TagRelationship.find_by_parent_id(tag)
        @tag_relationship.destroy
      end
    end
    redirect_to edit_tag_path(@tag)
  end
end
