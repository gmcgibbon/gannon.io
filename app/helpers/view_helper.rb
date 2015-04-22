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

  # All category titles unordered
  def all_category_titles
    Category.all.map(&:title)
  end

  # Builds FontAwesome footer icon link hash
  def footer_icon_links
    links = {}
    links[:envelope] = 'mailto:' << I18n.t('gannon.meta.email')
    links[:github]   = 'https://github.com/' << I18n.t('gannon.meta.github')
    links[:linkedin] = 'https://www.linkedin.com/in/' << I18n.t('gannon.meta.linkedin')
    links[:sitemap]  = sitemap_url

    links
  end
end
