class Match < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  belongs_to :venue
  has_many :messages

  PROPERTIES = {
    completed: {
      bg: "rgba(0,0,0,0.2)",
      icon: "far fa-check-square"
    },
    upcoming: {
      bg: "#EA5A07",
      icon: "fas fa-calendar-alt"
    },
    challenge: {
      bg: "#EACC06",
      icon: "fas fa-exclamation"
    },
    pending: {
      bg: "#EACC06",
      icon: "fas fa-hourglass-half"
    }
  }

  def get_property(current_user, key)

    if is_complete
      return PROPERTIES[:completed][key]
    elsif is_accepted
      return PROPERTIES[:upcoming][key]
    elsif current_user.id == receiver_id
      return PROPERTIES[:challenge][key]
    else
      return PROPERTIES[:pending][key]
    end

  end

end
