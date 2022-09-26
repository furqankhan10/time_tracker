import 'dart:math';

void main(){

  final square = Square(side: 10.0);
  printArea(square);

  final circle = Circle(radius: 5.0);
  printArea(circle);
}

void printArea(Shape shape){
  print(shape.area());
}

abstract class Shape{
  double? area();

}

class Square implements Shape{
  Square({this.side});
  final double? side;
  @override
  double? area() => side!*side!;
}

class Circle implements Shape{
  Circle({this.radius});
  final double? radius;
  @override
  double? area() => radius!*radius!*pi;
}