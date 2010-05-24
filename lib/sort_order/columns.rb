module SortOrder
  class Columns < Array

    def initialize(*defaults)
      super defaults.map { |d| Column.parse(d) }
      raise SortOrder::NoDefaultColumnsError, "Please supply some default columns e.g. 'name', 'email desc', etc." if empty?
    end

    def to_sql(options={})
      options.delete(:current) ? current.to_sql(options) : map {|c| c.to_sql(options) }.join(', ')
    end
    
    def to_params(options={})
      { :order => options.delete(:current) ? current.to_param(options) : map {|c| c.to_param(options) } }
    end

    def current
      @current ||= first
    end

    def current=(token=nil)
      @current = merge(token) if token.present?
    end
  
    def current?(other)
      current == other
    end
  
    def column(token)
      SortOrder::Column.parse(token)
    end
  
    def fields
      map(&:field)
    end
    
    def <<(token)
      merge token
      return self
    end
    
    def merge(token) 
      new_col = column(token)
      if old_col = find(new_col.name)
        old_col.direction = new_col.direction
        return old_col
      end
    end

    def find(name)
      super() {|c| c.name == name }
    end

    def include?(name)
      find(name).present?
    end

  end
end