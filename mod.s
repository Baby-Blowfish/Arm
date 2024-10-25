.global main
.section .data
Fizz:       .asciz "Fizz\n"            // "Fizz" ���ڿ� ����
Buzz:       .asciz "Buzz\n"            // "Buzz" ���ڿ� ����
FizzBuzz:   .asciz "FizzBuzz\n"        // "FizzBuzz" ���ڿ� ����
IntFmt:     .asciz "%d\n"              // ������ ����� ���� ���ڿ�

.section .text
.extern printf

main:
    str x30, [sp, -16]!                // ���� x30(���� �ּ�)�� ���ÿ� ����
    mov x19, 1                         // x19�� 1�� ���� (�ʱ� ��)
    mov x20, 100                       // x20�� 100�� ���� (�ִ� ��)

loop_start:
    cmp x19, x20                       // x19�� x20 ��
    bgt end_program                    // x19 > x20�̸� ���α׷� ����

    // FizzBuzz üũ (3�� 5�� �����)
    mov x2, x19                        // x2�� ���� ���� ����
    mov x3, x19                        // x3���� ���� ���� ����

    // x2 % 15 üũ (3�� 5�� �����)
    mov x5, 15
    udiv x6, x2, x5                    // x2�� 15�� ���� ���� x6�� ����
    msub x6, x6, x5, x2                // x6 = x2 - (x6 * x5)�� ������ ���
    cbnz x6, check_fizz                // �������� 0�� �ƴϸ� Fizz üũ�� �̵�

    // FizzBuzz ���
    ldr x0, =FizzBuzz                  // FizzBuzz ���ڿ� �ּҸ� x0�� �ε�
    bl printf                          // printf�� FizzBuzz ���
    b next_number                      // ���� ���ڷ� �̵�

check_fizz:
    // x2 % 3 üũ
    mov x5, 3
    udiv x6, x2, x5                    // x2�� 3���� ���� ���� x6�� ����
    msub x6, x6, x5, x2                // x6 = x2 - (x6 * x5)�� ������ ���
    cbnz x6, check_buzz                // �������� 0�� �ƴϸ� Buzz üũ�� �̵�

    // Fizz ���
    ldr x0, =Fizz                      // Fizz ���ڿ� �ּҸ� x0�� �ε�
    bl printf                          // printf�� Fizz ���
    b next_number                      // ���� ���ڷ� �̵�

check_buzz:
    // x3 % 5 üũ
    mov x5, 5
    udiv x6, x3, x5                    // x3�� 5�� ���� ���� x6�� ����
    msub x6, x6, x5, x3                // x6 = x3 - (x6 * x5)�� ������ ���
    cbnz x6, print_number              // �������� 0�� �ƴϸ� ���� ������� �̵�

    // Buzz ���
    ldr x0, =Buzz                      // Buzz ���ڿ� �ּҸ� x0�� �ε�
    bl printf                          // printf�� Buzz ���
    b next_number                      // ���� ���ڷ� �̵�

print_number:
    // ���� ���
    mov x1, x19                        // ����� ���ڸ� x1�� ����
    ldr x0, =IntFmt                    // ���� ���ڿ� �ּҸ� x0�� �ε�
    bl printf                          // printf ȣ��� ���� ���

next_number:
    add x19, x19, 1                    // x19�� 1�� ���Ͽ� ���� ���ڷ� �̵�
    b loop_start                       // ������ �������� �̵�

end_program:
    ldr x30, [sp], 16                  // ���ÿ��� x30(���� �ּ�) ����
    mov x0, xzr                        // ���� �ڵ� 0 ����
    ret                                // ȣ���� ������ ����

