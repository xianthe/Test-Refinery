require 'spec_helper'

describe Testimonial do

  def reset_testimonial(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @testimonial.destroy! if @testimonial
    @testimonial = Testimonial.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_testimonial
  end

  context "validations" do
    
    it "rejects empty title" do
      Testimonial.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_testimonial
      Testimonial.new(@valid_attributes).should_not be_valid
    end
    
  end

end