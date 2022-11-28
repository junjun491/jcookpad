FactoryBot.define do
  factory :post do
   sequence(:rname, "rname_1")
   rinformation { "" }
   rimage { "" }
   ingredient { "" }
   procedure_1 { "" }
   procedure_2 { "" }
   procedure_3 { "" }
   created_at { "" }
   updated_at { "" }
   Energy { "" }
   Protein { "" }
   Lipid { "" }
   Carbohydrate { "" }
   Dietary_fiber { "" }
   Potassium { "" }
   Calcium { "" }
   iron { "" }
   Zinc { "" }
   VitaminA { "" }
   VitaminB1 { "" }
   VitaminB2 { "" }
   VitaminC { "" }
   Salt_equivalent { "" }
   quantity { "" }   
   association :user
  end
end
