class MemberSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :initials, :role, :scope

  def full_name
    object.full_name
  end

  def role
    @board ||= Board.find(serialization_options[:board_id] || scope[:board_id])
    object.has_role?(:admin, @board) ? 'admin' : 'member'
  end

  def initials
    object.initials
  end
end
