Given /^the following tokens: (.+)$/ do |tokens|
  @sort_order = SortOrder.new(*tokens.split(', '))
end


When /^I output (.+) as (.+)$/ do |item, format|
  @result = case [item, format]
  when ['each', 'a parameter']
    @sort_order.map(&:to_param)
  when ['each', 'sql']
    @sort_order.map(&:to_sql)
  when ['the columns', 'sql']
    @sort_order.to_sql
  when ['the columns', 'sql (current only)']
    @sort_order.to_sql(:current => true)   
  when ['the columns', 'sql (current only without table)']
    @sort_order.to_sql(:current => true, :table => false)
  when ['the columns', 'parameters']
    @sort_order.to_params
  when ['the columns', 'parameters (current only)']
    @sort_order.to_params(:current => true)
  end
  raise "No list set!" if @result.blank?
end

When /^I flip the current column$/ do
  @sort_order.current.flip!
end


When /^I set the current column to: (.+)$/ do |token|
  @sort_order.current = token
end



Then /^I should get the following list: (.+)$/ do |tokens|
  @result.should == tokens.split(', ')
end

Then /^I should get the following string: (.+)$/ do |tokens|
  @result.should == tokens
end

Then /^I should get the following hash$/ do |tokens|
  @result.should == tokens.split(', ')
end

Then /^I should get the following hash: (.+)$/ do |hash|
  @result.inspect.should == hash
end

