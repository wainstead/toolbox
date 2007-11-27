#include <iostream>
#include <string>
using namespace std;

// forward declarations? note we don't do Square but this still works.
class Shape;
class Circle;

class Shape {
public:
  Shape() { cout << "Shape constructor called" << endl; }
  // the book says: as a rule make destructors virtual
  virtual ~Shape() {  cout << "Shape destructor called" << endl; }
  virtual int draw() { cout << "Shape draws" << endl; }
};

class Circle : public Shape {
public:
  Circle() {  cout << "Circle constructor called" << endl; }
  ~Circle() {  cout << "Circle destructor called" << endl; }
  int draw() { cout << "Circle draws" << endl; }
};

class Square : public Shape {
public:
  Square() {  cout << "Square constructor called" << endl; }
  ~Square() {  cout << "Square destructor called" << endl; }

  int draw() { cout << "Square draws" << endl; }
};

int main(int argv, char** argc) {
  cout << "Hello, sailor!" << endl;
  Circle c;
  Shape* sc = &c;
  Square q;
  Shape* sq = &q;
  Shape sh;
  sc->draw();
  sq->draw();
  sh.draw();
}
