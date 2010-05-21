module SortOrder
  class Column
    class Direction < String
  
      def self.parse(value)
        new((value.to_s.upcase == 'DESC' || value.to_s == '0') ? 'DESC' : 'ASC')
      end
  
      def label
        "#{titleize}ending"
      end
  
      def asc?
        self == 'ASC'
      end
  
      def desc?
        !asc?
      end
  
      def to_param(flip=false)
        (flip ? desc? : asc?) ? '1' : '0'
      end
  
      def to_sql(flip=false)
        (flip ? desc? : asc?) ? 'ASC' : 'DESC'
      end
  
    end
  end
end