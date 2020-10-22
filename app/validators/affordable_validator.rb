class AffordableValidator < ActiveModel::Validator

    def validate(record)
        unless record.user.tickets >= record.attraction.tickets
            record.errors[:user_id] << "You do not have enough tickets to ride the #{record.attraction.name}."
        end
    end
end