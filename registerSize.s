.global main
.text
.align 2

main:	mov x0, xzr
		ldr x1, =ram       // ram의 주소를 x1 레지스터에 로드
		strb w0, [x1]      // w0의 하위 1바이트 값을 x1이 가리키는 메모리 주소에 저장
		strh w0, [x1]      // w0의 하위 2바이트 값을 x1이 가리키는 메모리 주소에 저장
		str w0, [x1]       // w0의 하위 4바이트 값을 x1이 가리키는 메모리 주소에 저장
		str x0, [x1]       // x0의 8바이트 값을 x1이 가리키는 메모리 주소에 저장
		ret

.data
ram: .quad 0xFFFFFFFFFFFFFFFF  // 64비트 메모리 데이터를 ram에 할당
.end

