class Attachment < ActiveRecord::Base
  belongs_to :attachmentable, :polymorphic => true
  attr_accessible :attachment_name, :attachmentable_type, :attachmentable_id
  mount_uploader :attachment_name, AttachmentUploader
end
