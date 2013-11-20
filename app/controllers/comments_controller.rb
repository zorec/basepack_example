class CommentsController < ResourcesController
  belongs_to :issue, optional: true

  def create
    create! {@comment.commentable}
  end
end