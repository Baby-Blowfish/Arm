.global main
.text
.align 2

main:	mov x0, xzr
		ldr x1, =ram       // ram�� �ּҸ� x1 �������Ϳ� �ε�
		strb w0, [x1]      // w0�� ���� 1����Ʈ ���� x1�� ����Ű�� �޸� �ּҿ� ����
		strh w0, [x1]      // w0�� ���� 2����Ʈ ���� x1�� ����Ű�� �޸� �ּҿ� ����
		str w0, [x1]       // w0�� ���� 4����Ʈ ���� x1�� ����Ű�� �޸� �ּҿ� ����
		str x0, [x1]       // x0�� 8����Ʈ ���� x1�� ����Ű�� �޸� �ּҿ� ����
		ret

.data
ram: .quad 0xFFFFFFFFFFFFFFFF  // 64��Ʈ �޸� �����͸� ram�� �Ҵ�
.end

