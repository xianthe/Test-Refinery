class CreateTestimonials < ActiveRecord::Migration

  def self.up
    create_table :testimonials do |t|
      t.string :title
      t.text :blurb
      t.integer :position

      t.timestamps
    end

    add_index :testimonials, :id

    load(Rails.root.join('db', 'seeds', 'testimonials.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "testimonials"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/testimonials"})
    end

    drop_table :testimonials
  end

end
