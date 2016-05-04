class Module
  def create_count_by_methods(*attributes)
    attributes.each do |attribute|
      new_method = %Q{
        def self.count_by_#{attribute} products
          counts = Hash.new(0)
          products.inject counts do |result, product|
            result[product.#{attribute}] += 1
            result
          end
          counts
        end
      }
      class_eval new_method
    end
  end
end
