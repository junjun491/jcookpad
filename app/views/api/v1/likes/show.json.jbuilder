
  json.array! @liked_lists do |post|
    json.id post.id
    json.user_id post.user_id
    json.name post.rname
    json.rinformation post.rinformation
    json.rimage post.rimage.url
    json.ingredient post.ingredient
    json.procedure_1 post.procedure_1
    json.procedure_2 post.procedure_2
    json.procedure_3 post.procedure_3
    json.created_at post.created_at
    json.updated_at post.updated_at
    json.Energy post.Energy
    json.Protein post.Protein
    json.Protein post.Lipid
    json.Carbohydrate post.Carbohydrate
    json.Dietary_fiber post.Dietary_fiber
    json.Potassium post.Potassium
    json.Calcium post.Calcium
    json.iron post.iron
    json.Zinc post.Zinc
    json.VitaminA post.VitaminA
    json.VitaminB1 post.VitaminB1
    json.VitaminB2 post.VitaminB2
    json.VitaminC post.VitaminC
    json.Salt_equivalent post.Salt_equivalent
  end
