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
  %8 = phi i64 [ 0, %0 ], [ %24, %7 ]
  %9 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %8
  store i32 1, i32* %9, align 16, !tbaa !2
  %10 = or i64 %8, 1
  %11 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %10
  store i32 1, i32* %11, align 4, !tbaa !2
  %12 = or i64 %8, 2
  %13 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %12
  store i32 1, i32* %13, align 8, !tbaa !2
  %14 = or i64 %8, 3
  %15 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %14
  store i32 1, i32* %15, align 4, !tbaa !2
  %16 = or i64 %8, 4
  %17 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %16
  store i32 1, i32* %17, align 16, !tbaa !2
  %18 = or i64 %8, 5
  %19 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %18
  store i32 1, i32* %19, align 4, !tbaa !2
  %20 = or i64 %8, 6
  %21 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %20
  store i32 1, i32* %21, align 8, !tbaa !2
  %22 = or i64 %8, 7
  %23 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %22
  store i32 1, i32* %23, align 4, !tbaa !2
  %24 = add nuw nsw i64 %8, 8
  %25 = icmp eq i64 %24, 1024
  br i1 %25, label %26, label %7

26:                                               ; preds = %7, %26
  %27 = phi i64 [ %43, %26 ], [ 0, %7 ]
  %28 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %27
  store i32 2, i32* %28, align 16, !tbaa !2
  %29 = or i64 %27, 1
  %30 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %29
  store i32 2, i32* %30, align 4, !tbaa !2
  %31 = or i64 %27, 2
  %32 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %31
  store i32 2, i32* %32, align 8, !tbaa !2
  %33 = or i64 %27, 3
  %34 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %33
  store i32 2, i32* %34, align 4, !tbaa !2
  %35 = or i64 %27, 4
  %36 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %35
  store i32 2, i32* %36, align 16, !tbaa !2
  %37 = or i64 %27, 5
  %38 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %37
  store i32 2, i32* %38, align 4, !tbaa !2
  %39 = or i64 %27, 6
  %40 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %39
  store i32 2, i32* %40, align 8, !tbaa !2
  %41 = or i64 %27, 7
  %42 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %41
  store i32 2, i32* %42, align 4, !tbaa !2
  %43 = add nuw nsw i64 %27, 8
  %44 = icmp eq i64 %43, 1024
  br i1 %44, label %45, label %26

45:                                               ; preds = %26, %45
  %46 = phi i64 [ %74, %45 ], [ 0, %26 ]
  %47 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %46
  %48 = load i32, i32* %47, align 16, !tbaa !2
  %49 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %46
  %50 = load i32, i32* %49, align 16, !tbaa !2
  %51 = add nsw i32 %50, %48
  %52 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %46
  store i32 %51, i32* %52, align 16, !tbaa !2
  %53 = or i64 %46, 1
  %54 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !2
  %56 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %53
  %57 = load i32, i32* %56, align 4, !tbaa !2
  %58 = add nsw i32 %57, %55
  %59 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %53
  store i32 %58, i32* %59, align 4, !tbaa !2
  %60 = or i64 %46, 2
  %61 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %60
  %62 = load i32, i32* %61, align 8, !tbaa !2
  %63 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %60
  %64 = load i32, i32* %63, align 8, !tbaa !2
  %65 = add nsw i32 %64, %62
  %66 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %60
  store i32 %65, i32* %66, align 8, !tbaa !2
  %67 = or i64 %46, 3
  %68 = getelementptr inbounds [1024 x i32], [1024 x i32]* %1, i64 0, i64 %67
  %69 = load i32, i32* %68, align 4, !tbaa !2
  %70 = getelementptr inbounds [1024 x i32], [1024 x i32]* %2, i64 0, i64 %67
  %71 = load i32, i32* %70, align 4, !tbaa !2
  %72 = add nsw i32 %71, %69
  %73 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %67
  store i32 %72, i32* %73, align 4, !tbaa !2
  %74 = add nuw nsw i64 %46, 4
  %75 = icmp eq i64 %74, 1024
  br i1 %75, label %76, label %45

76:                                               ; preds = %45, %100
  %77 = phi i32 [ %101, %100 ], [ 512, %45 ]
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %86

79:                                               ; preds = %76
  %80 = zext i32 %77 to i64
  %81 = zext i32 %77 to i64
  %82 = and i64 %81, 1
  %83 = icmp eq i32 %77, 1
  br i1 %83, label %90, label %84

84:                                               ; preds = %79
  %85 = sub nsw i64 %81, %82
  br label %103

86:                                               ; preds = %76, %100
  %87 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %88 = load i32, i32* %87, align 16, !tbaa !2
  %89 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %88)
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %4) #4
  ret i32 0

90:                                               ; preds = %103, %79
  %91 = phi i64 [ 0, %79 ], [ %119, %103 ]
  %92 = icmp eq i64 %82, 0
  br i1 %92, label %100, label %93

93:                                               ; preds = %90
  %94 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %91
  %95 = load i32, i32* %94, align 4, !tbaa !2
  %96 = add nuw nsw i64 %91, %80
  %97 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %96
  %98 = load i32, i32* %97, align 4, !tbaa !2
  %99 = add nsw i32 %98, %95
  store i32 %99, i32* %94, align 4, !tbaa !2
  br label %100

100:                                              ; preds = %90, %93
  %101 = sdiv i32 %77, 2
  %102 = icmp sgt i32 %77, 1
  br i1 %102, label %76, label %86

103:                                              ; preds = %103, %84
  %104 = phi i64 [ 0, %84 ], [ %119, %103 ]
  %105 = phi i64 [ %85, %84 ], [ %120, %103 ]
  %106 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %104
  %107 = load i32, i32* %106, align 8, !tbaa !2
  %108 = add nuw nsw i64 %104, %80
  %109 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %108
  %110 = load i32, i32* %109, align 4, !tbaa !2
  %111 = add nsw i32 %110, %107
  store i32 %111, i32* %106, align 8, !tbaa !2
  %112 = or i64 %104, 1
  %113 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %112
  %114 = load i32, i32* %113, align 4, !tbaa !2
  %115 = add nuw nsw i64 %112, %80
  %116 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %115
  %117 = load i32, i32* %116, align 4, !tbaa !2
  %118 = add nsw i32 %117, %114
  store i32 %118, i32* %113, align 4, !tbaa !2
  %119 = add nuw nsw i64 %104, 2
  %120 = add i64 %105, -2
  %121 = icmp eq i64 %120, 0
  br i1 %121, label %90, label %103
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
