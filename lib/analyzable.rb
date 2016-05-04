require_relative 'count_by'

module Analyzable
  create_count_by_methods "brand", "name"

  def average_price products
    total = products.inject 0 do |result, product|
      result += product.price.to_f
      result
    end
    (total / products.size).round(2)
  end

  def print_report products
    out = "Average Price: $#{average_price products}\n"
    out += "Inventory by Brand:\n"
    count_by_brand(products).each do |brand, count|
      out += "-".ljust(4) + "#{brand.capitalize}: #{count}\n"
    end
    out += "Inventory by Name:\n"
    count_by_name(products).each do |name, count|
      out += "-".ljust(4) + "#{name.capitalize}: #{count}\n"
    end
    out
  end
end
