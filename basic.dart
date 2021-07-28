// main은 function
// main () 안에 parameter 받을 수 있음
// dart 맨 처음 시작시 main function을 찾음
// main function  이 아닐 때 에러 (no main method found)
// dart에서는 세미콜론 ; 명령문 끝을 의미

main() {
  // function body
  mtPrint('Hello, Dart!');
}

// 인자로 전달 받은 값 print
myPrint(String text) {
  // dart 기본 function
  print(text);
}

// Variable : 데이터를 저장하는 장소

// var은 변수라는 것을 컴파일러 에게 알려주는 keyword
// 변수명 앞에 데이터 타입을 지정하지 않고 var로 키워도를 선언해도 저장된 데이터에 따라 데이터 타입 정해짐
// 선택권이 있을 땐 직접 data type 을 지정하는 것이 좋음 (String name = 'lala';) = 추후 가독성을 위함

main() {
  // String
  var name = 'Voyager I';
  // int 
  var year = 1995;
  // double
  var antennaDiameter = 3.7;
  // List<String>
  var flybyObject = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  // Map<String, Object> // 첫번쨰는 key, 두번째는 value
  var image = {
    // key 는 String, value는 object
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
}

// Fucntion : 함수 정의

// int x의 값을 인자로 전달받아
int timesTwo(int x) {
  // x*2 한 값을 return 한다
  return x * 2;
}

// arrow function 으로 만들어보면
// int timesTwo(int x) => x * 2;

// Arrow Function (js와 비슷)
// function body 가 한 줄 이면 {return 값;} 생략가능
int timesFour(int x) => timesTwo(timesTwo(x));
// 일반 함수 형식으로 정의하면
// int timesFour(int x) {
//  return timesTwo(timesTwo(x));
// }

// Functions parameter 로 전달 가능
// Function은 Object 이다
// int runTwice(int x, Function f) {
//    for (var i = 0; i < 2; i++) {
//        x = f(x);
//    }
//    return x;
// }

int runTwice(int x, Function f) {
  // x = timesTow(2) // 2 * 2
  x = f(x);
  // x = timesTwo(timesTwo(2)) 즉 timesTwo(4) // 2 * 2 * 2
  x = f(x);
  return x;
}

// js의 template literals
// 변수값을 String과 섞어서 사용하고 싶을 때 ${} 사용
// 간단한 변수 자체만 넣을때는 {} 생략이 가능하다 ($은 생략 x)
// int num = 16; print("number is $num")
main() {
  print("4 times two is ${timesTwo(4)}");
  print("4 times four is ${timesFour(4)}");
  print("2 x 2 x 2 is ${runTwice(2, timesTwo)}");
}

// Control flow

// boolean type true, false
bool isEven(int x) {
  if (x % 2 == 0) {
    return true;
  } else {
    return false;
  }
}
// 3항 연산자 사용 가능
// bool isEven(int x) {
//   return x % 2 == 0 ? true : false;
// }
// Arrow syntax 도 사용 가능
// bool isEven(int x) => x % 2 == 0 ? true : false;

// 정수(int)가 들어있는 List
// getEvenNumvers로 붙어 받아온 int를 List로
List<int> getEvenNumbers(Iterable<int> numbers) {
  // 짝수를 저장해줄 변수 선언 , int로 된 빈 list
  var evenNumbers = <int>[];

  // A for-in loop.
  // numbers가 1, 2, 3, 4, 5로 가정하다면
  // 처음으로 body안에 1을 전달 , 조건에 만족하면 list에 추가
  // 그 다음 2를 전달 ... 5까지 반복

  for (var i in numbers) {
    // A single-line if statement.
    // isEven이 true라면 evenNumbers list에 isEven의 값을 추가
    // 홀수면 pass
    if (isEven(i)) evenNumbers.add(i);
  }

  // evenNumvers를 return
  return evenNumbers;
}

main() {
  // numbers의 data를 list로 만든다 
  // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  // 0부터 시작
  var numbers = List.generate(10, (i) => i);
  print(getEvenNumbers(numbers));
}

// String 

main() {
  // single, double quato 둘 다 가능
  print('a single quoted string');
  print("a double quoted string");

  // Strings can be combined with the + operator.
  print('cat' + 'dog');

  // Triple quotes define a multi-line string.
  print('''triple quoted strings are for multiple lines''');

  // Dart supports string interpolation.
  // String 안에 변수값 포함하고 싶을 때

  const pi = 3.14;
  print('pi is $pi');

  // print('pi is' + pi) 도 가능
  // {} 있는 이유는 복잡한 계산, object안의 변수 값을 들여다 볼 때 필요
  print('tau is ${2 * pi}');
}

// Class

class Car {
  int seats;
  String color;

//   constructor
//   Car(int sts, String clr) {    
//   [] 대괄호 지정하면 기본값, 옵션값이 된다, 넣어도 되고 안넣어도 된다
//   기본값 특정한 값으로 지정 가능
//   Car(int sts, [String clr = 'black']) {
//     {} 중괄호 instance에 순서 상관 없이 쓰고 싶을 때
//   중괄호 값도 옵션 , @required를 플러터에서 쓰면 꼭 들어가야하는 값 
    Car ({int sts, String clr = 'black'}) {
    this.seats = sts;
    this.color = clr;
  }
  
//   function
  printVars() {
    print('seat: $seats, color: $color');
  }
}

main() {
  // instance, object 둘 다 해당
  // 생상된 차 라고 생각
  // new Car(~~) 에서 new 사용 안해도 됨
  // Car newCar = new Car(4, 'red');
  // Car newCar = new Car(4);
  Car new Car = new Car(clr: 'red', sts: 6);

  // function 사용
  newCar.printVars();

  // function 미사용
  // print('seat: ${newCar.seats}, color: ${newCar.color}');
}

// 생성자 간단하게 쓰고 싶을 떄 아래와 같이 사용 가능 
Car({this.seats, this.color = "black"});
Car new Car = Car (Color: 'red', seats: 6);