module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Awesomr"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Awesomr", :class => "round")
  end
end
