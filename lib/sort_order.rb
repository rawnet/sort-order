module SortOrder
  VERSION = '0.1.1'
  
  def self.new *cols
    Columns.new *cols
  end
  
  class NoDefaultColumnsError < StandardError; end

end

require 'sort_order/column'
require 'sort_order/columns'
require 'sort_order/column/field'
require 'sort_order/column/direction'
require 'sort_order/view_helper' if defined?(ActionView::Base)
require 'sort_order/controller_helper' if defined?(ActionController::Base)