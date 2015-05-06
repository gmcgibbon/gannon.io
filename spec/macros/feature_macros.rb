module FeatureMacros

  def click_root_link
    click_link('to_root')
  end

  def login_as(user)
    click_link('Log in')

    fill_in('Email', with: user.email)
    fill_in('Password', with: '11111111')

    click_button('Log in')
  end

  def search_for_article(with:)
    within(:css, '.article_search') do
      fill_in('search', with: with)
      find(:css, '.btn').click
    end
  end

  def create_category(title:)
    click_link('New Category')

    #TODO: Revisit when refactored js window prompts
  end

  def create_article(title:, content:, slug:)
    click_link('New Article')

    within(:css, '#new_article') do
      fill_in('Title', with: title)
      fill_in('Content', with: content)
      fill_in('Slug', with: slug)
      click_button('Create Article')
    end
  end

  def create_page(title:, content:, slug:)
    click_link('New Page')

    within(:css, '#new_page') do
      fill_in('Title', with: title)
      fill_in('Content', with: content)
      fill_in('Slug', with: slug)
      click_button('Create Page')
    end
  end
end
