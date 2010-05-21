module SortOrder
  class Column
    
    attr_accessor :field, :direction
  
    def self.parse(token)
      token.is_a?(SortOrder::Column) ? token : new(*token.to_s.split(' '))
    end
  
    def initialize(field, direction=nil)
      @field, @direction = Field.new(field), Direction.parse(direction)
    end
  
    def label
      field.label
    end
    
    def name
      field.name
    end
  
    def to_sql(options = {})
      "#{field} #{direction.to_sql(options[:flip])}"
    end

    def to_param(options = {})
      "#{field.name} #{direction.to_param(options[:flip])}"
    end
  
    def direction=(value)
      @direction = Direction.parse(value)
    end
    
    def flip!
      self.direction = direction.to_param(true)
    end
    
  end
end

