/*
변수 선언
Dart 에서 var 를 사용하여 변수를 선언하면 변수에 대한 타입 추론을 지원함. var 로 변수를 선언하면 참조를 저장하기 때문에 한 번 var 로 선언한 후 다른 타입의 값으 ㄹ넣으려고 하면 에러가 발생함
*/

var name = "seongwon";
name = 12;

/*
이미 name은 String으로 타입이 결정되었기 때문에 int 타입의 값을 넣으려고 하면 에러가 발생함. 이 때 하나의 변수에 여러 타입의 변경이 필요 할 경우 dynamic 키워드를 사용할 수 있음
 */

 dynamic age = "26";
 age = 26;

 // Not error


/* 접근지정자
변수명 앞에 _ 기호를 붙이면 변수는 마치 java에서 private 키워드를 붙인 것처럼 됨. 이 프라이빗 변수에 접근하려면 게터와 세터 메서드를 작성해주어야 함
 */

class Person {
  String name;
  int _age;

  int get age => _age;
  set age(int value) => _age = value;
}

void main() {
  var person = Person();
  print(person.age); // age = null
  person.age = 1;
  print(person.age); // age = 1
}

/*
_age 변수에 게터와 세터를 선언하여 main() 에서 접근할 수 있는 것을 확인할 수 있음. 처음 person 객체를 선언한 후 _age 를 출력하면 아무 값도 들어있지 않기 때문에 null 이 출력됨
 */

 /*
 선택 매개변수

 함수를 정의할 때 {} 로 감싼 매개변수는 선택적으로 사용할 수 있는데 이런 매개변수를 Named Parameter 라고 부름 
  */

void something(String name, {int age= 10}) {}

void main() {
  something('seongwon', age: 27); // age = 27
  something('seongwon'); // age - 10
  something(age: 27); // error 필수 매개변수를 입력하지 않았음
  something();
}

/*
선택 매개변수는 호출할 때 매개변수명을 함께 써주기 때문에 가독성을 높여줌. 또한 위의 코드처럼 기본값이 필요하다면 기본값을 지정하여 줄 수 있음
 */

 /*
 믹스인
 with 키워드를 사용하여 상속하지 않고 다른 클래스의 기능을 가져오거나 오버라이드 할 수 있음
  */

  class Cat implemets Animal {

    @override
    void eat() {
      print("고양이가 음식을 먹습니다")
    }


  }

  class PersianCat extends Cat with Biology {

  }

  // 이제 PersianCat 은 Cat 이기도 하고 Animal 이기도 하고 Biology 이기도 함

  /*
  컬렉션
  Dart 에서 List, Map, Set 등의 컬렉션을 제공하는데 특이하게 배열을 제공하진 않음 List 선언부터 살펴보면
   */

//List 

  List<String> items = ['Cat', 'Dog', 'Tiger'];

  var items = ['Cat', 'Dog', 'Tiger']; // 위와 동일함.

// Map
  
  Map<String, String> personMap = {
    'seongwon' : 'hi',
    'lee' : 'hello'
  };

  var personMap = {
    'seongwon' : 'hi'
    'lee' : 'hello'
  }; // 위와 동일

  // usage
  print(personMap['seongwon']); // hi

  // Set

  Set<String> personMap = {'seongwon', 'lee'};

  var personSet = {'seongwon', 'lee'};

  print(personSet.contains('seongwon')); // true

  // 비어 있는 Set 이나 Map 을 작성할 경우 값 없이 그냥 {} 만 작성하면 Set 이 아닌 Map 으로 인식하게 됨

  var mySet = <String>{}; // Set<String>

  var mySet2 = {}; // Map<dynamic, dynamic> 으로 취급

  /*
  스프레드 연산자
  ... 연산자는 컬렉션을 펼쳐주는 연산자임. 스프레드 연산자라고 불리고 다른 컬렉션 안에 컬렉션 삽일할 떄 사용 됨
   */

   var items =[1, 2, 3, 4 ,5];

   var items = [0, ...items, 6]; // [0, 1, 2, 3, 4, 5, 6]