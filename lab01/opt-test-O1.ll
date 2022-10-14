; ModuleID = 'opt-test.c'
source_filename = "opt-test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @add(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = add nsw i32 %1, %0
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  %1 = alloca [1024 x i32], align 16
  %2 = alloca [1024 x i32], align 16
  %3 = alloca [1024 x i32], align 16
  %4 = bitcast [1024 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %4) #4
  %5 = bitcast [1024 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %5) #4
  %6 = bitcast [1024 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %6) #4
  br label %7

7:                                                ; preds = %7, %0
  %8 = phi i64 [ 0, %0 ], [ %10, %7 ]
  %9 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %8
  store i32 1, i32* %9, align 4, !tbaa !2
  %10 = add nuw nsw i64 %8, 1
  %11 = icmp eq i64 %10, 1024
  br i1 %11, label %12, label %7

12:                                               ; preds = %7, %12
  %13 = phi i64 [ %15, %12 ], [ 0, %7 ]
  %14 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %13
  store i32 2, i32* %14, align 4, !tbaa !2
  %15 = add nuw nsw i64 %13, 1
  %16 = icmp eq i64 %15, 1024
  br i1 %16, label %17, label %12

17:                                               ; preds = %12, %17
  %18 = phi i64 [ %25, %17 ], [ 0, %12 ]
  %19 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %18
  %20 = load i32, i32* %19, align 4, !tbaa !2
  %21 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %18
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = call i32 @add(i32 %20, i32 %22)
  %24 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %18
  store i32 %23, i32* %24, align 4, !tbaa !2
  %25 = add nuw nsw i64 %18, 1
  %26 = icmp eq i64 %25, 1024
  br i1 %26, label %27, label %17

27:                                               ; preds = %17, %37
  %28 = phi i32 [ %38, %37 ], [ 512, %17 ]
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %37

30:                                               ; preds = %27
  %31 = sext i32 %28 to i64
  %32 = zext i32 %28 to i64
  br label %40

33:                                               ; preds = %37
  %34 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %35 = load i32, i32* %34, align 16, !tbaa !2
  %36 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %35)
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %4) #4
  ret i32 0

37:                                               ; preds = %40, %27
  %38 = sdiv i32 %28, 2
  %39 = icmp sgt i32 %28, 1
  br i1 %39, label %27, label %33

40:                                               ; preds = %40, %30
  %41 = phi i64 [ 0, %30 ], [ %48, %40 ]
  %42 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %44 = add nsw i64 %41, %31
  %45 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %44
  %46 = load i32, i32* %45, align 4, !tbaa !2
  %47 = call i32 @add(i32 %43, i32 %46)
  store i32 %47, i32* %42, align 4, !tbaa !2
  %48 = add nuw nsw i64 %41, 1
  %49 = icmp eq i64 %48, %32
  br i1 %49, label %37, label %40
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
