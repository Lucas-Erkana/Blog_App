module PostsHelper
  def render_comment_delete_button(user, post, comment)
    button_to user_post_comment_path(user, post, comment),
              method: :delete,
              data: { confirm: 'Are you sure?' },
              class: 'del-post-btn' do
      submit_tag '|Delete', title: 'delete comment', id: 'delete'
    end
  end

  def render_few_comment(post, user)
    content_tag(:ul, class: 'post-comments-container') do
      if post.recent_comments.any?
        post.recent_comments.each do |comment|
          concat(content_tag(:li, class: 'comment-box') do
            concat(content_tag(:p) do
              user_name = comment.user.name
              user_comment = truncate(comment.text, length: 60, omission: '...')
              comment_content = "#{user_name}: #{user_comment}".html_safe
              concat(comment_content)
              concat(render_comment_delete_button(user, post, comment)) if can? :destroy, comment
            end)
          end)
        end
      else
        content_tag(:li, 'No comments added yet')
      end
    end
  end

  def render_posts(user, post)
    link_to(user_post_path(user, post)) do
      content_tag(:div, class: 'post-containe') do
        concat(content_tag(:h3, post.title, class: 'post-title'))
        concat(content_tag(:div, class: 'post-details') do
          content_tag(:p, truncate(post.text, length: 100, omission: '...'), class: 'details')
        end)
        concat(content_tag(:div, class: 'comment-like-container') do
          content_tag(:p, class: 'coment-likes-data container') do
            comment = post.comment_counter || 0
            likes = post.likes_counter || 0
            "Comments: #{comment}, Likes: #{likes}"
          end
        end)
        concat(render_few_comment(post, user))
      end
    end
  end

  def render_all_comment(user, post, comments)
    if comments.any?
      safe_join(comments.map do |comment|
        content_tag(:li, class: 'comment-box') do
          content_tag(:p) do
            user_name = User.find_by(id: comment.user_id)&.name
            user_comment = comment.text
            comment_content = "#{user_name}: #{user_comment}".html_safe
            concat(comment_content)
            concat(render_comment_delete_button(user, post, comment)) if can? :destroy, comment
          end
        end
      end)
    else
      content_tag(:li, 'No comments added yet..')
    end
  end
end
