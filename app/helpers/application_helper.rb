module ApplicationHelper
  def bootstrap_class_for flash_type
    return {"success" => "alert-success", "error" => "alert-danger", "alert" => "alert-warning", "notice" => "alert-info"}[flash_type]
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      puts "#{msg_type}, #{message}"
      concat(content_tag(:div, message, id: "flashMessage", class: "alert #{bootstrap_class_for(msg_type)}") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, request.query_parameters.merge({:sort => column, :direction => direction})
  end
end
