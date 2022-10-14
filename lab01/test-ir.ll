; ModuleID = 'test.c'

; declare global variables
; int global_variable = 0
; str_1 = "%d"
; str_2 = "%d\n"
; str_3 = "%f\n"
@global_variable = global i32 0
@str_1 = constant [3 x i8] c"%d\00"
@str_2 = constant [4 x i8] c"%d\0A\00"
@str_3 = constant [4 x i8] c"%f\0A\00"

; int fib(int a, int b)
define i32 @fib(i32 %0, i32 %1) {
  %3 = alloca i32
  %4 = alloca i32   ; allocate space for local variables first, including tempory variables in instructions
  store i32 %0, i32* %3
  store i32 %1, i32* %4   ; restore params
  %5 = load i32, i32* %3
  %6 = load i32, i32* %4
  %7 = add i32 %5, %6
  ret i32 %7  ; return a + b
}

; int main()
define i32 @main() {
  %1 = alloca i32
  %2 = alloca float
  %3 = alloca float
  %4 = alloca float
  %5 = alloca i32
  %6 = alloca i32
  %7 = alloca i32
  %8 = alloca i32
  %9 = alloca i8*
  %10 = alloca i64   ; allocate space for local variables first, including tempory variables in instructions
  store i32 0, i32* %1
  store float 1.5, float* %2
  store float 2.5, float* %3
  store i32 0, i32* %5
  store i32 1, i32* %6
  store i32 1, i32* %7    ; initialize
  %11 = load float, float* %2
  %12 = load float, float* %3
  %13 = fadd float %11, %12   
  store float %13, float* %4    ; reload and compute
  %14 = call i32 (i8*, ...) @scanf(i8* getelementptr ([3 x i8], [3 x i8]* @str_1, i64 0, i64 0), i32* %8)
  %15 = load i32, i32* %8
  %16 = zext i32 %15 to i64
  %17 = alloca i32, i64 %16
  store i64 %16, i64* %10
  %18 = getelementptr i32, i32* %17, i64 0
  store i32 1, i32* %18
  br label %start

start:
  %19 = load i32, i32* %7
  %20 = load i32, i32* %8
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %loop, label %exit

loop:
  %22 = load i32, i32* %5
  %23 = load i32, i32* %6
  %24 = call i32 @fib(i32 %22, i32 %23)
  %25 = load i32, i32* %7
  %26 = sext i32 %25 to i64
  %27 = getelementptr i32, i32* %17, i64 %26
  store i32 %24, i32* %27
  %28 = load i32, i32* %7
  %29 = sub nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr i32, i32* %17, i64 %30
  %32 = load i32, i32* %31
  store i32 %32, i32* %5
  %33 = load i32, i32* %7
  %34 = sext i32 %33 to i64
  %35 = getelementptr i32, i32* %17, i64 %34
  %36 = load i32, i32* %35
  store i32 %36, i32* %6
  %37 = load i32, i32* %7
  %38 = add i32 %37, 1
  store i32 %38, i32* %7
  br label %start

exit:                                          
  %39 = load i32, i32* %8
  %40 = sub i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr i32, i32* %18, i64 %41
  %43 = load i32, i32* %42
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr ([4 x i8], [4 x i8]* @str_2, i64 0, i64 0), i32 %43)
  %45 = load i32, i32* @global_variable
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr ([4 x i8], [4 x i8]* @str_2, i64 0, i64 0), i32 %45)
  %47 = load float, float* %4
  %48 = fpext float %47 to double
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr ([4 x i8], [4 x i8]* @str_3, i64 0, i64 0), double %48)
  store i32 0, i32* %1
  %50 = load i32, i32* %1
  ret i32 %50
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)


