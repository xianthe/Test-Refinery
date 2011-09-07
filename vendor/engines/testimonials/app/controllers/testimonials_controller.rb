class TestimonialsController < ApplicationController

  before_filter :find_all_testimonials
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @testimonial in the line below:
    @testimonial = Testimonial.find(:all, :order => 'random()').first
    puts "TEST TYPE: #{@testimonial.class}"
    present(@page)
    
  end

  def show
    @testimonial = Testimonial.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @testimonial in the line below:
    present(@page)
  end

protected

  def find_all_testimonials
    @testimonials = Testimonial.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/testimonials").first
  end

end
