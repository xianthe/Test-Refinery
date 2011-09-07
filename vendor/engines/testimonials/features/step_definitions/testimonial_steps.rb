Given /^I have no testimonials$/ do
  Testimonial.delete_all
end

Given /^I (only )?have testimonials titled "?([^\"]*)"?$/ do |only, titles|
  Testimonial.delete_all if only
  titles.split(', ').each do |title|
    Testimonial.create(:title => title)
  end
end

Then /^I should have ([0-9]+) testimonials?$/ do |count|
  Testimonial.count.should == count.to_i
end
