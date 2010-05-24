module SortOrder
  module ViewHelper

    def link_to_order_by(name, label=nil)
      return "No call to default_sort_order in #{controller.controller_name} " unless respond_to?(:sort_order)
      column = sort_order.find(name.to_s)
      column = sort_order.current if sort_order.current?(column)
      label ||= column.label
      link_to label, {:order => column.to_param(:flip => true)}, :rel => column.to_param(:flip => true), :class => "flip-column flip-column-#{column.direction.to_param(true)}"
    end

  end
end

ActionView::Base.send :include, SortOrder::ViewHelper