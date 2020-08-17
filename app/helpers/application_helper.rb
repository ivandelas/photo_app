module ApplicationHelper
  def render_message(type, content)
    case type
    when :notice
      %{
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
          #{content}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      }.html_safe
    when :alert
      %{
        <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
          #{content}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      }.html_safe
    end
  end

  def render_session_buttons
    if user_signed_in?
      %{
        #{button_to 'Logout', destroy_user_session_path, method: :delete, form_class: 'form-inline my-2 my-lg-0', class: 'btn btn-sm btn-danger'}
      }.html_safe
    else
      %{
        #{button_to 'Login', new_user_session_path, method: :get, form_class: 'form-inline my-2 my-lg-0 mr-lg-2', class: 'btn btn-sm btn-success'}
      }.html_safe
    end
  end

  def render_account_sidebar
    if user_signed_in?
      %{
        <aside class="col-lg-4 border shadow p-4 mt-lg-0 mt-4">
          #{render 'layouts/sidebar'}
        </aside>
      }.html_safe
    else
      nil
    end
  end

  def render_content_class
    if user_signed_in?
      'col-lg-8'
    else
      'col-lg-12'
    end
  end
end
