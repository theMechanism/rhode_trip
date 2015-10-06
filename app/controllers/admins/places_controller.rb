class Admins::PlacesController < Admins::BaseController
  include RestActionsConcern

  def permitted_params
    params.
      require(:place).
      permit(:line_1, :line_2, :city, :zip, :lat, :long, :name, :approved, :people)
  end
end
