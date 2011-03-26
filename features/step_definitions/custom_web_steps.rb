Then /^I should see the "([^"]*)" table$/ do |id, table|
  columns = {}
  table.hashes.first.keys.each do |title|
    n = 1
    while true do
      begin
        with_scope("##{id} thead tr th:nth-child(#{n})") do
          columns[title] = n if page.has_content?(title)
          n += 1
        end
      rescue Capybara::ElementNotFound
        break
      end
    end
  end

  columns.keys.sort.should == table.hashes.first.keys.sort

  table.hashes.each_with_index do |hash, index|
    hash.each_pair do |title, value|
      begin
        with_scope("##{id} tbody tr:nth-child(#{index+1}) td:nth-child(#{columns[title]})") do
          page.should have_content(value)
        end
      rescue Capybara::ElementNotFound
        with_scope("##{id} tbody tr:nth-child(#{index+1}) th:nth-child(#{columns[title]})") do
          page.should have_content(value)
        end
      end
    end
  end
end

