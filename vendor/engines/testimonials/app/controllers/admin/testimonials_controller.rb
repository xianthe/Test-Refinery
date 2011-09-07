module Admin
  class TestimonialsController < Admin::BaseController

    crudify :testimonial, :xhr_paging => true
  
  end
end
