class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true, length: { maximum: 500 }

  def template
    ApplicationController.renderer.render partial: "messages/message", locals: { message: self }
  end
end
