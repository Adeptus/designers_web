module DesignerHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to_remote title, {:url => {:action    => "sort",
                                    :direction => direction,
                                    :sort      => column }}, 
                           :class => css_class,
                           :href => "designers?direction=#{direction}&sort=#{column}"
  end

end
