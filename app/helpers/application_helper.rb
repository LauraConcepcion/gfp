module ApplicationHelper
  def sort_by_tlresult_name(collection)
    collection.sort do |record1, record2|
      sortable1 = record1.sortable_item
      sortable2 = record2.sortable_item

      if sortable1.size == sortable2.size
        sortable1 <=> sortable2
      elsif sortable1.size < sortable2.size
        1
      else
        -1
      end
    end
  end
end
