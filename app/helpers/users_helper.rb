module UsersHelper
  def render_user(user)
    content_tag(:li, class: 'user-container') do
      concat(content_tag(:div, class: 'user-profile-pic') do
        link_to(user_path(user)) do
          image_tag(user.photo || '', alt: 'profile-picture')
        end
      end)
      concat(content_tag(:div, class: 'user-info') do
        concat(content_tag(:h3) do
          link_to(user.name, user_path(user))
        end)
        concat(content_tag(:p, class: 'posts-counter') do
          "Number of posts: #{user.posts_counter || 0}"
        end)
      end)
    end
  end

  def render_post(user, post)
    link_to(user_post_path(user, post)) do
      content_tag(:div, class: 'post-container') do
        concat(content_tag(:h3, post.title, class: 'post-title'))
        concat(content_tag(:div, class: 'post-details') do
          content_tag(:p, truncate(post.text, length: 100, omission: '...'), class: 'details')
        end)
        concat(content_tag(:div, class: 'comment-like-container') do
          content_tag(:p, class: 'coment-likes-data') do
            "Comments: #{post.comment_counter || 0}, Likes #{post.likes_counter || 0}"
          end
        end)
      end
    end
  end
end
