module UsersHelper
  def iterate_through_attrs(user)
    signup_attrs = %w[name nausea happiness tickets height]
    @user.attributes.each do |attr, v|
      if signup_attrs.include?(attr)
        yield(attr)
      end
    end
  end
end
