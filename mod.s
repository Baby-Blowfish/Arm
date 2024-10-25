.global main
.section .data
Fizz:       .asciz "Fizz\n"            // "Fizz" 문자열 저장
Buzz:       .asciz "Buzz\n"            // "Buzz" 문자열 저장
FizzBuzz:   .asciz "FizzBuzz\n"        // "FizzBuzz" 문자열 저장
IntFmt:     .asciz "%d\n"              // 정수를 출력할 형식 문자열

.section .text
.extern printf

main:
    str x30, [sp, -16]!                // 현재 x30(리턴 주소)을 스택에 저장
    mov x19, 1                         // x19에 1을 저장 (초기 값)
    mov x20, 100                       // x20에 100을 저장 (최대 값)

loop_start:
    cmp x19, x20                       // x19와 x20 비교
    bgt end_program                    // x19 > x20이면 프로그램 종료

    // FizzBuzz 체크 (3과 5의 공배수)
    mov x2, x19                        // x2에 현재 숫자 복사
    mov x3, x19                        // x3에도 현재 숫자 복사

    // x2 % 15 체크 (3과 5의 공배수)
    mov x5, 15
    udiv x6, x2, x5                    // x2를 15로 나눈 몫을 x6에 저장
    msub x6, x6, x5, x2                // x6 = x2 - (x6 * x5)로 나머지 계산
    cbnz x6, check_fizz                // 나머지가 0이 아니면 Fizz 체크로 이동

    // FizzBuzz 출력
    ldr x0, =FizzBuzz                  // FizzBuzz 문자열 주소를 x0에 로드
    bl printf                          // printf로 FizzBuzz 출력
    b next_number                      // 다음 숫자로 이동

check_fizz:
    // x2 % 3 체크
    mov x5, 3
    udiv x6, x2, x5                    // x2를 3으로 나눈 몫을 x6에 저장
    msub x6, x6, x5, x2                // x6 = x2 - (x6 * x5)로 나머지 계산
    cbnz x6, check_buzz                // 나머지가 0이 아니면 Buzz 체크로 이동

    // Fizz 출력
    ldr x0, =Fizz                      // Fizz 문자열 주소를 x0에 로드
    bl printf                          // printf로 Fizz 출력
    b next_number                      // 다음 숫자로 이동

check_buzz:
    // x3 % 5 체크
    mov x5, 5
    udiv x6, x3, x5                    // x3을 5로 나눈 몫을 x6에 저장
    msub x6, x6, x5, x3                // x6 = x3 - (x6 * x5)로 나머지 계산
    cbnz x6, print_number              // 나머지가 0이 아니면 숫자 출력으로 이동

    // Buzz 출력
    ldr x0, =Buzz                      // Buzz 문자열 주소를 x0에 로드
    bl printf                          // printf로 Buzz 출력
    b next_number                      // 다음 숫자로 이동

print_number:
    // 숫자 출력
    mov x1, x19                        // 출력할 숫자를 x1에 복사
    ldr x0, =IntFmt                    // 형식 문자열 주소를 x0에 로드
    bl printf                          // printf 호출로 숫자 출력

next_number:
    add x19, x19, 1                    // x19에 1을 더하여 다음 숫자로 이동
    b loop_start                       // 루프의 시작으로 이동

end_program:
    ldr x30, [sp], 16                  // 스택에서 x30(리턴 주소) 복구
    mov x0, xzr                        // 종료 코드 0 설정
    ret                                // 호출한 곳으로 복귀

