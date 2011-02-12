module ApplicationHelper
  include SavageBeast::ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Autoworker Community"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("awlogo.png", :alt => "Autoworker", :class => "round")
  end
end
