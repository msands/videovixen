class CommentPolicy
  attr_reader :user, :comment

  def intialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.talent?
  end

  def destroy?
    comment.user == user
  end
end
