import 'dart:io';
import 'dart:math';

class CustomException implements Exception{
  String errorMessage() => 'некоректные значения параметров';
}

class Shape{
  double width;
  double heigth;

  Shape(this.width, this.heigth){
    if(width <= 0 || heigth <= 0){
      throw CustomException();
    }
  }

  double calculateArea(){
    return width * heigth;
  }
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
  try {
    var shape = Shape(10, 0); // Попытка создать объект с некорректными параметрами
    var area = shape.calculateArea(); // Вызов метода calculateArea()
    print('Площадь фигуры: $area');
  } catch (e) {
    if (e is CustomException) {
      print('Ошибка: ${e.errorMessage()}');
    } else if (e is IntegerDivisionByZeroException) {
      print('Ошибка: Деление на ноль');
    } else {
      print('Произошла ошибка: $e');
    }
  }
}
