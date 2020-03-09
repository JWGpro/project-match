class Message < ApplicationRecord
  belongs_to :match
  belongs_to :user

  after_create :i_read_my_messages

  def i_read_my_messages
    self.update(read: true)
  end
end
