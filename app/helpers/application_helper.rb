module ApplicationHelper
  
  # ページング用現在位置表示
  def page_entries_info(collection)
    if collection.total_pages < 2
      case collection.size
        when 0; t("views.helpers.page_entries_info.one_page.display_entries.zero")
        when 1; t("views.helpers.page_entries_info.one_page.display_entries.one")
        else;   t("views.helpers.page_entries_info.one_page.display_entries.display_entries", {count: collection.size})
      end
    else
     offset = collection.offset_value
      %{%d  〜  %d 件を表示中 / 合計 %d件} % [
          offset + 1 ,
          offset + collection.length,
          collection.total_count
      ]
    end
  end
end
