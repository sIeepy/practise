class CommentDecorator < Draper::Decorator
  delegate_all

  def user_name
    user = User.find_by(id: object.user_id)
    user.name
  end
end
