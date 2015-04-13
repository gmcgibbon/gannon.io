class CategoriesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  
end
