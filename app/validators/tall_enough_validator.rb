class TallEnoughValidator < ActiveModel::Validator
  def validate(record)
    unless record.user.height >= record.attraction.min_height
     
      record.errors[:user_id] << "You are not tall enough to ride the #{record.attraction.name}."
    end
  end
end