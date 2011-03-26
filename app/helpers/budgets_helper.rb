module BudgetsHelper
  def render_table(table_lines, options = {})
    lines = table_lines.clone
    table = "<table#{options.map {|k, v| " #{k}='#{v}'"}.join}><thead><tr>"
    lines.delete_at(0).each {|item| table += "<th>#{item}</th>" }
    table += "</tr></thead><tbody>"
    lines.each do |line|
      table << "<tr>"
      line.each_with_index do |item, index|
        table += index == 0 ? "<th>#{item}</th>" : "<td>#{item.to_f.reais}</td>"
      end
      table << "</tr>"
    end
    table + "</tbody></table>"
  end
end

