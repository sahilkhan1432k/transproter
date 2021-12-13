require "administrate/field/base"

class GravatarField < Administrate::Field::Base
  def to_s
    data
  end
end
