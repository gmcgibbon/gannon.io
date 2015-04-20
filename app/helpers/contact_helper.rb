module ContactHelper

  def fa_contact_links
    links = {}
    links[:envelope] = 'mailto:gannon.mcgibbon@gmail.com'
    links[:github]   = 'https://github.com/gmcgibbon'
    links[:linkedin] = 'https://www.linkedin.com/in/gannonmcgibbon'

    links
  end
end
