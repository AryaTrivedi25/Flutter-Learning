import 'dart:io';

void main(){
  print("Welcome to DART");

  // stdout.write("Enter your name : ");
  //
  // var name = stdin.readLineSync();
  // print("Your name is : $name");

  var n = myClass();
  n.printName("Brumbhrahh..");
  n.printName("name");
  n.printName("Martin");

}

class myClass{
  void printName(String name){
    print(name);
  }
}