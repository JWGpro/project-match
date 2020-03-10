class User < ApplicationRecord
  has_one_attached :avatar
  has_many :availabilities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  # has_many :matches
  def matches
    Match.where(sender_id: id).or(Match.where(receiver_id: id))
  end

  def sort_matches
    sorted = []

    # challenges
    matches.where(is_accepted: false, receiver_id: self.id).each { |match| sorted << match }

    # pending
    matches.where(is_accepted: false, sender_id: self.id).each { |match| sorted << match }

    # upcoming
    matches.where(is_accepted: true, is_complete: false).each { |match| sorted << match }

    # completed
    matches.where(is_complete: true).each { |match| sorted << match }

    return sorted
  end
end
