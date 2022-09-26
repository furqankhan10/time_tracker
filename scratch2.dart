mixin BMI{
  double? calculateBMI(double? weight,double? height){
    return weight!/(height!*height);
  }
}

class Person with BMI{
  Person({this.name,this.age,this.height,this.weight});
  final String? name;
  final int? age;
  final double? height;
  final double? weight;

  double? get bmi{
    return calculateBMI(weight, height);
  }

}

void main(){
final person = Person(name: 'Usman', age: 26,height: 1.8,weight: 55);
print(person.bmi);

}