module Admin
  class EventsController < Admin::BaseController

    crudify :event, :order => "date DESC", :sortable => false, :xhr_paging => true

  end
end
