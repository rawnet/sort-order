module SortOrder
  
  module ControllerHelper
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def default_sort_order(*args)
        if args.any?
          @@default_sort_order ||= {}
          @@default_sort_order[name] = args
          include InstanceMethods unless included_modules.include?(SortOrder::ControllerHelper::InstanceMethods)
          helper_method :sort_order
        end
        @@default_sort_order[name]
      end
    end
    
    module InstanceMethods
      
      def sort_order
        @sort_order ||= SortOrder.new *self.class.default_sort_order
      end

      private :sort_order
    end
    
  end
end

ActionController::Base.send :include, SortOrder::ControllerHelper