module Sortable

  module InstanceMethods
    def posting_date
      self.created_at.strftime("%b %d, %Y")
    end
  end

  module ClassMethods
    def all_sort_by_date
      all.order(created_at: "DESC" )
    end

    def order_and_paginated(params, pages)
      all_sort_by_date.page(params).per(pages)
    end
  end

end
