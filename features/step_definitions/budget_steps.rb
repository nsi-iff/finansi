Given /^exist the following budgets$/ do |table|
  hashes = table.hashes.map(&:clone)
  hashes.each do |hash|
    acronym = hash['source']
    hash['source'] = Source.find_by_acronym(acronym) || Source.create!(:acronym => acronym)
  end
  Budget.create!(hashes)
end

