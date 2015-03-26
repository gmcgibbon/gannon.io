module FeatureMacros

  def login_as(user)
    click_link('Log in')

    fill_in('Email', with: user.email)
    fill_in('Password', with: '11111111')

    click_button('Log in')
  end

  def strip_paras(text)
    text.gsub('</p><p>', '').gsub('<p>', ' ').gsub('</p>', '')
  end

  def scroll_to_bottom
    page.execute_script 'window.scrollBy(0 ,10000);'
  end

  def scroll_to_top
    page.execute_script 'window.scrollBy(0, -10000);'
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

end
