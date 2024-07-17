import 'dart:math';

abstract class Shape {
  double calculateArea();
}

// Интерфейс PerimeterCalculation
abstract class PerimetrCalculation{
  double calcucationPerimetr();
}

// Миксин PrintDetailsMixin
mixin PrintDetailsMixin {
  void printArea(double area) {
    print('Площадь: $area');
  }

  void printPerimeter(double perimeter) {
    print('Периметр: $perimeter');
  }

  void printRadius(double radius)
  {
    print('Радиус: $radius');
  }
}

// Класс Shape3D с функциями, принимающими различные типы параметровv
abstract class Shape3D{
  double calculateVolume();

  void functionWithIntParameter(int num) {
    print('получает integer: $num');
  }

  void functionWithDoubleParameter(double num) {
    print('получает double: $num');
  }

  void functionWithBoolParameter(bool value) {
    print('получает boolean: $value');
  }

  void functionWithStringParameter(String text) {
    print('получает string: $text');
  }
}

// Класс Square, реализующий интерфейс PerimeterCalculation
class Square extends Shape with PrintDetailsMixin implements PerimetrCalculation  {
  double side;
  int width;
  int heigth;

  Square(this.width, this.heigth, this.side);

  //именованный конструктор
  Square.fromWidthAndHeigth(int w, int h, double s) : width = w, heigth = h, side = s;

  @override
  double calculateArea() {
    return side * side;
  }

  @override
  double calcucationPerimetr() {
    return 4 * side;
  }

}

class Rectangle extends Shape {
  double width;
  double height;

  double get getWidth => width;
  double get getHeight => height;

  set setWidth(double value) {
    width = value;
  }

  set setHeight(double value) {
    height = value;
  }


  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }
}

// Класс Circle с использованием статических полей и функций
class Circle extends Shape {
  static const  double piValue = 3.14;
  static int diametr = 4;
  double radius;

  Circle(this.radius);

  static double calculateAreaPi(){
    return piValue * diametr;
  }

  @override
  double calculateArea() {
    return pi * radius * radius;
  }
}

// Класс Cube, наследуемый от Shape3D
class Cube extends Shape3D {
  double sideLength;

  Cube(this.sideLength);

  @override
  double calculateVolume() {
    return sideLength * sideLength * sideLength;
  }
}

//класс sphere, наследуемый от Shape3D
class Sphere extends Shape3D{
  double radius;

  Sphere(this.radius);

  @override
  double calculateVolume() {

    return ((4/3) * pi * (radius * radius * radius));
  }
}

void main() {
  var square = Square(5, 5, 5);
  var perimeter = square.calcucationPerimetr();

  var rectangle = Rectangle(4, 6);
  var circle = Circle(3);

  square.printPerimeter(perimeter);

  print('Площадь квадрата: ${square.calculateArea()}');
  print('Площадь прямоуголльника: ${rectangle.calculateArea()}');
  print('площадь круга: ${circle.calculateArea()}');

  Cube cube = Cube(5);
  Sphere sphere = Sphere(3);

  print('Объем кубa: ${cube.calculateVolume()}');
  print('Объем сферы: ${sphere.calculateVolume()}');

  Sphere sphere1 = Sphere(5);
  sphere1.functionWithBoolParameter(true);
  sphere1.functionWithDoubleParameter(3.14);
  sphere1.functionWithIntParameter(12124);
  sphere1.functionWithStringParameter('hi');
}
