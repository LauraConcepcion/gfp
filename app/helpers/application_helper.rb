module ApplicationHelper
  def sort_by(collection, field)
    collection.sort do |record1, record2|
      sortable1 = record1.send(field)
      sortable2 = record2.send(field)
      if sortable1.class == sortable2.class
        sortable1 <=> sortable2
      elsif sortable1.kind_of?(Numeric)
        -1
      elsif sortable2.kind_of?(Numeric)
        1
      end
    end
  end
end
