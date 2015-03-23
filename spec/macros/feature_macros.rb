module FeatureMacros

  def login_as(user)
    click_link('Log in')

    fill_in('Email', with: user.email)
    fill_in('Password', with: '11111111')

    click_button('Log in')
  end

end
