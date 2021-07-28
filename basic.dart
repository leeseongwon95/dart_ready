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