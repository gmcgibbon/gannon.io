module ViewHelper

  # Determine if current controller does not exist
  # in controllers folder (loaded from a gem)
  def external_controller?
    Dir[Rails.root.join('app', 'controllers', '*_controller.rb')]
      .map   { |f| File.basename(f) }
      .none? { |f| f.starts_with? controller_name }
  end

  # All categories ordered by title
  def all_categories_by_title
    Category.all.order('title')
  end

  # All articles ordered by title
  def all_articles_by_title
    Article.all.order('title')
  end

  # All pages ordered by title
  def all_pages_by_title
    Page.all.order('title')
  end

  # Builds FontAwesome footer icon link hash
  def footer_icon_links
    links = {}
    links[:envelope] = 'mailto:gannon.mcgibbon@gmail.com'
    links[:github]   = 'https://github.com/gmcgibbon'
    links[:linkedin] = 'https://www.linkedin.com/in/gannonmcgibbon'
    links[:sitemap]  = sitemap_url

    links
  end
end
