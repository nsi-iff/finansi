Given /^exist the following budget item:$/ do |table|
  BudgetItem.create! table.hashes
end

