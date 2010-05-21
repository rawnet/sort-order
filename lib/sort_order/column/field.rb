module SortOrder
  class Column
    class Field < String
  
      def table
        split('.').first || ''
      end
  
      def name
        split('.').last
      end
  
      def label
        name.titleize
      end
  
    end
  end
end