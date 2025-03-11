// 웹브라우저 콘솔에 id title을 갖는 태그를 찾아서 출력

const title = document.querySelector("#title");
console.log(title);

// 링크 클릭 이벤트 연결하기
const link = document.querySelector("a");
// html문서에서 a라는 태그를 찾아라
// link.addEventListener("click", ()=>{
//     console.log("링크를 클릭했습니다.");
// });
// html 웹브라우저 내에서, 특정 이벤트가 발생했을 때 "click"이라는 속성을 잡아내라는 의미

// 링크를 클릭해도 링크가 작동되지 않고 console.log만 작동되도록 PreventDefault()
link.addEventListener("click", (e) => {
  // => : Function 만들 때 지정.
  // addEventListener gpt 통해 개념다시 정리
  e.preventDefault();
  console.log("링크를 클릭했습니다.");
});

// HTML 요소에 마우스 이벤트 연결하기
const box = document.querySelector("#box");
box.addEventListener("mouseenter", () => {
  box.style.backgroundColor = "hotpink";
});

box.addEventListener("mouseleave", () => {
  box.style.backgroundColor = "aqua";
});

// 반복되는 요소에 이벤트 한꺼번에 연결하기
const list = document.querySelectorAll(".list li");
console.log(list);
for (let el of list) {
  el.addEventListener("click", (e) => {
    e.preventDefault();
    console.log(e.currentTarget.innerText);
  });
}

// 클릭 이벤트가 발생할 때 숫자 증가, 감소하기
const btnPlus = document.querySelector(".btnPlus");
const btnMinus = document.querySelector(".btnMinus");
let num = 0; //제어할 숫자값을 0으로 초기화 (+버튼을 누르면 증가, -버튼을 누르면 감소)

// btnPlus를 클릭할 때
btnPlus.addEventListener("click", (e) => {
  e.preventDefault();
  num++; // num값을 1씩 증가
  console.log(num);
});

// javascript 할 때, 세미콜론으로 마치는 것을 유의하자.

// btnMinus를 클릭할 때
btnMinus.addEventListener("click", (e) => {
  e.preventDefault();
  num--; // num 값을 1씩 감소
  console.log(num);
});

// 버튼을 클릭하면 좌우로 회전하는 박스 만들기
const btnLeft = document.querySelector(".btnLeft");
const btnRight = document.querySelector(".btnRight");
const box2 = document.querySelector("#box2");
const deg = 45; // 회전할 각도
let num2 = 0; // 증가시킬 값을 0으로 초기화

// btnLeft를 클릭할 때
btnLeft.addEventListener("click", (e) => {
  e.preventDefault();
  num2--;
  console.log(`btnLeft를 클릭했을 때 num2에 있는 값: ${num2}`);
  // 백틱(``)은 JavaScript에서만 사용하는 문법으로, 문자열을 만들 때 사용
  // `` 과 ${변수명}을 활용하면 문자열 안에서 변수를 쉽게 삽입
  // 줄바꿈과 여러 줄 문자열도 그대로 유지할 수 있어 가독성이 좋음.
  box2.style.transform = `rotate(${num2 * deg}deg)`;
  // => 실제 계산 rotate(2*45=90deg)
});

// btnRight를 클릭할 때
btnRight.addEventListener("click", (e) => {
  e.preventDefault();
  num2++;
  console.log(`btnRight를 클릭했을 때 num2에 있는 값: ${num2}`);
  box2.style.transform = `rotate(${num2 * deg}deg)`;
});
