; ModuleID = 'test-ir-opt.bc'
source_filename = "test-ir.ll"

@global_variable = global i32 0
@str_1 = constant [3 x i8] c"%d\00"
@str_2 = constant [4 x i8] c"%d\0A\00"
@str_3 = constant [4 x i8] c"%f\0A\00"

define i32 @fib(i32 %0, i32 %1) {
  %3 = alloca i32
  %4 = alloca i32
  store i32 %0, i32* %3
  store i32 %1, i32* %4
  %5 = load i32, i32* %3
  %6 = load i32, i32* %4
  %7 = add i32 %5, %6
  ret i32 %7
}

define i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  %4 = alloca float
  %5 = alloca float
  %6 = alloca float
  %7 = alloca i32
  %8 = alloca i32
  %9 = alloca i32
  %10 = alloca i32
  %11 = alloca i8*
  %12 = alloca i64
  store i32 0, i32* %3
  store float 1.500000e+00, float* %4
  store float 2.500000e+00, float* %5
  store i32 0, i32* %7
  store i32 1, i32* %8
  store i32 1, i32* %9
  %13 = load float, float* %4
  %14 = load float, float* %5
  %15 = fadd float %13, %14
  store float %15, float* %6
  %16 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str_1, i64 0, i64 0), i32* %10)
  %17 = load i32, i32* %10
  %18 = zext i32 %17 to i64
  %19 = alloca i32, i64 %18
  store i64 %18, i64* %12
  %20 = getelementptr i32, i32* %19, i64 0
  store i32 1, i32* %20
  br label %start

start:                                            ; preds = %loop, %0
  %21 = load i32, i32* %9
  %22 = load i32, i32* %10
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %loop, label %exit

loop:                                             ; preds = %start
  %24 = load i32, i32* %7
  %25 = load i32, i32* %8
  %26 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %26)
  %27 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %27)
  store i32 %24, i32* %1
  store i32 %25, i32* %2
  %28 = load i32, i32* %1
  %29 = load i32, i32* %2
  %30 = add i32 %28, %29
  %31 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31)
  %32 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32)
  %33 = load i32, i32* %9
  %34 = sext i32 %33 to i64
  %35 = getelementptr i32, i32* %19, i64 %34
  store i32 %30, i32* %35
  %36 = load i32, i32* %9
  %37 = sub nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr i32, i32* %19, i64 %38
  %40 = load i32, i32* %39
  store i32 %40, i32* %7
  %41 = load i32, i32* %9
  %42 = sext i32 %41 to i64
  %43 = getelementptr i32, i32* %19, i64 %42
  %44 = load i32, i32* %43
  store i32 %44, i32* %8
  %45 = load i32, i32* %9
  %46 = add i32 %45, 1
  store i32 %46, i32* %9
  br label %start

exit:                                             ; preds = %start
  %47 = load i32, i32* %10
  %48 = sub i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr i32, i32* %20, i64 %49
  %51 = load i32, i32* %50
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str_2, i64 0, i64 0), i32 %51)
  %53 = load i32, i32* @global_variable
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str_2, i64 0, i64 0), i32 %53)
  %55 = load float, float* %6
  %56 = fpext float %55 to double
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str_3, i64 0, i64 0), double %56)
  store i32 0, i32* %3
  %58 = load i32, i32* %3
  ret i32 %58
}

declare i32 @scanf(i8*, ...)

declare i32 @printf(i8*, ...)

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #0

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #0

attributes #0 = { argmemonly nounwind willreturn }
