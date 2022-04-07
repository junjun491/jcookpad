export default class Nutrients {
  constructor(
    Energy = "0",
    Protein = "0",
    Lipid = "0",
    Carbohydrate = "0",
    Dietary_fiber = "0",
    Potassium = "0",
    Calcium = "0",
    iron = "0",
    Zinc = "0",
    VitaminA = "0",
    VitaminB1 = "0",
    VitaminB2 = "0",
    VitaminC = "0",
    Salt_equivalent = "0"
  ) {
    this.Energy = Energy;
    this.Protein = Protein;
    this.Lipid = Lipid;
    this.Carbohydrate = Carbohydrate;
    this.Dietary_fiber = Dietary_fiber;
    this.Potassium = Potassium;
    this.Calcium = Calcium;
    this.iron = iron;
    this.Zinc = Zinc;
    this.VitaminA = VitaminA;
    this.VitaminB1 = VitaminB1;
    this.VitaminB2 = VitaminB2;
    this.VitaminC = VitaminC;
    this.Salt_equivalent = Salt_equivalent;
  }
  keyname() {
    return Object.keys(this);
  }
}
