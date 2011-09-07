if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'testimonials').blank?
      user.plugins.create(:name => 'testimonials',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Testimonials',
    :link_url => '/testimonials',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/testimonials(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end