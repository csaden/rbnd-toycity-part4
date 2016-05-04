class Module
  def create_finder_methods(*attributes)
    attributes.each do |attribute|
      find_by_method = %Q{
        def self.find_by_#{attribute} val
          products = self.all.select{|data| data.#{attribute} == val}
          products.first
        end
      }
      class_eval find_by_method
    end
  end
end
