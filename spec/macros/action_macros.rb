module ActionMacros

  def scroll_to_bottom
    page.driver.scroll_to(0, 100000)
  end

  def scroll_to_top
    page.driver_scroll_to(0, -100000)
  end

end
