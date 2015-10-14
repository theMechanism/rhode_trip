class Admins::UploadsController < Admins::BaseController
  include RestActionsConcern

  def permitted_params
    params.
      require( :upload ).
      permit( :attached )
  end
end
