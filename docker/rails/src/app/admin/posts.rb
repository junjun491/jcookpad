ActiveAdmin.register Post do
      permit_params :rname, :rinformation, :rimage, :ingredient, :procedure_1, :procedure_2, :procedure_3
end
