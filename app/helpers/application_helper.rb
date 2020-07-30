module ApplicationHelper
  def render_message(type, content)
    case type
    when :notice
      %{
        <div class="alert alert-success alert-dismissible fade show mb-5" role="alert">
          #{content}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      }.html_safe
    when :alert
      %{
        <div class="alert alert-danger alert-dismissible fade show mb-5" role="alert">
          #{content}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      }.html_safe
    end
  end
end
