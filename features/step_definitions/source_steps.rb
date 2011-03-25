Given /^exist the following source:$/ do |table|
  Source.create! table.hashes
end

