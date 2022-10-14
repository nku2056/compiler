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

76:                                               ; preds = %45, %76
  %77 = phi i64 [ %91, %76 ], [ 0, %45 ]
  %78 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %77
  %79 = load i32, i32* %78, align 8, !tbaa !2
  %80 = add nuw nsw i64 %77, 512
  %81 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %80
  %82 = load i32, i32* %81, align 8, !tbaa !2
  %83 = add nsw i32 %82, %79
  store i32 %83, i32* %78, align 8, !tbaa !2
  %84 = or i64 %77, 1
  %85 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %84
  %86 = load i32, i32* %85, align 4, !tbaa !2
  %87 = add nuw nsw i64 %77, 513
  %88 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %87
  %89 = load i32, i32* %88, align 4, !tbaa !2
  %90 = add nsw i32 %89, %86
  store i32 %90, i32* %85, align 4, !tbaa !2
  %91 = add nuw nsw i64 %77, 2
  %92 = icmp eq i64 %91, 512
  br i1 %92, label %93, label %76

93:                                               ; preds = %76, %93
  %94 = phi i64 [ %108, %93 ], [ 0, %76 ]
  %95 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %94
  %96 = load i32, i32* %95, align 8, !tbaa !2
  %97 = add nuw nsw i64 %94, 256
  %98 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %97
  %99 = load i32, i32* %98, align 8, !tbaa !2
  %100 = add nsw i32 %99, %96
  store i32 %100, i32* %95, align 8, !tbaa !2
  %101 = or i64 %94, 1
  %102 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %101
  %103 = load i32, i32* %102, align 4, !tbaa !2
  %104 = add nuw nsw i64 %94, 257
  %105 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %104
  %106 = load i32, i32* %105, align 4, !tbaa !2
  %107 = add nsw i32 %106, %103
  store i32 %107, i32* %102, align 4, !tbaa !2
  %108 = add nuw nsw i64 %94, 2
  %109 = icmp eq i64 %108, 256
  br i1 %109, label %110, label %93

110:                                              ; preds = %93, %110
  %111 = phi i64 [ %125, %110 ], [ 0, %93 ]
  %112 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %111
  %113 = load i32, i32* %112, align 8, !tbaa !2
  %114 = add nuw nsw i64 %111, 128
  %115 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %114
  %116 = load i32, i32* %115, align 8, !tbaa !2
  %117 = add nsw i32 %116, %113
  store i32 %117, i32* %112, align 8, !tbaa !2
  %118 = or i64 %111, 1
  %119 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %118
  %120 = load i32, i32* %119, align 4, !tbaa !2
  %121 = add nuw nsw i64 %111, 129
  %122 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %121
  %123 = load i32, i32* %122, align 4, !tbaa !2
  %124 = add nsw i32 %123, %120
  store i32 %124, i32* %119, align 4, !tbaa !2
  %125 = add nuw nsw i64 %111, 2
  %126 = icmp eq i64 %125, 128
  br i1 %126, label %127, label %110

127:                                              ; preds = %110, %127
  %128 = phi i64 [ %142, %127 ], [ 0, %110 ]
  %129 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %128
  %130 = load i32, i32* %129, align 8, !tbaa !2
  %131 = add nuw nsw i64 %128, 64
  %132 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %131
  %133 = load i32, i32* %132, align 8, !tbaa !2
  %134 = add nsw i32 %133, %130
  store i32 %134, i32* %129, align 8, !tbaa !2
  %135 = or i64 %128, 1
  %136 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %135
  %137 = load i32, i32* %136, align 4, !tbaa !2
  %138 = add nuw nsw i64 %128, 65
  %139 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 %138
  %140 = load i32, i32* %139, align 4, !tbaa !2
  %141 = add nsw i32 %140, %137
  store i32 %141, i32* %136, align 4, !tbaa !2
  %142 = add nuw nsw i64 %128, 2
  %143 = icmp eq i64 %142, 64
  br i1 %143, label %144, label %127

144:                                              ; preds = %127
  %145 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %146 = load i32, i32* %145, align 16, !tbaa !2
  %147 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 32
  %148 = load i32, i32* %147, align 16, !tbaa !2
  %149 = add nsw i32 %148, %146
  store i32 %149, i32* %145, align 16, !tbaa !2
  %150 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 1
  %151 = load i32, i32* %150, align 4, !tbaa !2
  %152 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 33
  %153 = load i32, i32* %152, align 4, !tbaa !2
  %154 = add nsw i32 %153, %151
  store i32 %154, i32* %150, align 4, !tbaa !2
  %155 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 2
  %156 = load i32, i32* %155, align 8, !tbaa !2
  %157 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 34
  %158 = load i32, i32* %157, align 8, !tbaa !2
  %159 = add nsw i32 %158, %156
  store i32 %159, i32* %155, align 8, !tbaa !2
  %160 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 3
  %161 = load i32, i32* %160, align 4, !tbaa !2
  %162 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 35
  %163 = load i32, i32* %162, align 4, !tbaa !2
  %164 = add nsw i32 %163, %161
  store i32 %164, i32* %160, align 4, !tbaa !2
  %165 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 4
  %166 = load i32, i32* %165, align 16, !tbaa !2
  %167 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 36
  %168 = load i32, i32* %167, align 16, !tbaa !2
  %169 = add nsw i32 %168, %166
  store i32 %169, i32* %165, align 16, !tbaa !2
  %170 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 5
  %171 = load i32, i32* %170, align 4, !tbaa !2
  %172 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 37
  %173 = load i32, i32* %172, align 4, !tbaa !2
  %174 = add nsw i32 %173, %171
  store i32 %174, i32* %170, align 4, !tbaa !2
  %175 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 6
  %176 = load i32, i32* %175, align 8, !tbaa !2
  %177 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 38
  %178 = load i32, i32* %177, align 8, !tbaa !2
  %179 = add nsw i32 %178, %176
  store i32 %179, i32* %175, align 8, !tbaa !2
  %180 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 7
  %181 = load i32, i32* %180, align 4, !tbaa !2
  %182 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 39
  %183 = load i32, i32* %182, align 4, !tbaa !2
  %184 = add nsw i32 %183, %181
  store i32 %184, i32* %180, align 4, !tbaa !2
  %185 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 8
  %186 = load i32, i32* %185, align 16, !tbaa !2
  %187 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 40
  %188 = load i32, i32* %187, align 16, !tbaa !2
  %189 = add nsw i32 %188, %186
  store i32 %189, i32* %185, align 16, !tbaa !2
  %190 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 9
  %191 = load i32, i32* %190, align 4, !tbaa !2
  %192 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 41
  %193 = load i32, i32* %192, align 4, !tbaa !2
  %194 = add nsw i32 %193, %191
  store i32 %194, i32* %190, align 4, !tbaa !2
  %195 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 10
  %196 = load i32, i32* %195, align 8, !tbaa !2
  %197 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 42
  %198 = load i32, i32* %197, align 8, !tbaa !2
  %199 = add nsw i32 %198, %196
  store i32 %199, i32* %195, align 8, !tbaa !2
  %200 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 11
  %201 = load i32, i32* %200, align 4, !tbaa !2
  %202 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 43
  %203 = load i32, i32* %202, align 4, !tbaa !2
  %204 = add nsw i32 %203, %201
  store i32 %204, i32* %200, align 4, !tbaa !2
  %205 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 12
  %206 = load i32, i32* %205, align 16, !tbaa !2
  %207 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 44
  %208 = load i32, i32* %207, align 16, !tbaa !2
  %209 = add nsw i32 %208, %206
  store i32 %209, i32* %205, align 16, !tbaa !2
  %210 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 13
  %211 = load i32, i32* %210, align 4, !tbaa !2
  %212 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 45
  %213 = load i32, i32* %212, align 4, !tbaa !2
  %214 = add nsw i32 %213, %211
  store i32 %214, i32* %210, align 4, !tbaa !2
  %215 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 14
  %216 = load i32, i32* %215, align 8, !tbaa !2
  %217 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 46
  %218 = load i32, i32* %217, align 8, !tbaa !2
  %219 = add nsw i32 %218, %216
  store i32 %219, i32* %215, align 8, !tbaa !2
  %220 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 15
  %221 = load i32, i32* %220, align 4, !tbaa !2
  %222 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 47
  %223 = load i32, i32* %222, align 4, !tbaa !2
  %224 = add nsw i32 %223, %221
  store i32 %224, i32* %220, align 4, !tbaa !2
  %225 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 16
  %226 = load i32, i32* %225, align 16, !tbaa !2
  %227 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 48
  %228 = load i32, i32* %227, align 16, !tbaa !2
  %229 = add nsw i32 %228, %226
  store i32 %229, i32* %225, align 16, !tbaa !2
  %230 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 17
  %231 = load i32, i32* %230, align 4, !tbaa !2
  %232 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 49
  %233 = load i32, i32* %232, align 4, !tbaa !2
  %234 = add nsw i32 %233, %231
  store i32 %234, i32* %230, align 4, !tbaa !2
  %235 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 18
  %236 = load i32, i32* %235, align 8, !tbaa !2
  %237 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 50
  %238 = load i32, i32* %237, align 8, !tbaa !2
  %239 = add nsw i32 %238, %236
  store i32 %239, i32* %235, align 8, !tbaa !2
  %240 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 19
  %241 = load i32, i32* %240, align 4, !tbaa !2
  %242 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 51
  %243 = load i32, i32* %242, align 4, !tbaa !2
  %244 = add nsw i32 %243, %241
  store i32 %244, i32* %240, align 4, !tbaa !2
  %245 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 20
  %246 = load i32, i32* %245, align 16, !tbaa !2
  %247 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 52
  %248 = load i32, i32* %247, align 16, !tbaa !2
  %249 = add nsw i32 %248, %246
  store i32 %249, i32* %245, align 16, !tbaa !2
  %250 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 21
  %251 = load i32, i32* %250, align 4, !tbaa !2
  %252 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 53
  %253 = load i32, i32* %252, align 4, !tbaa !2
  %254 = add nsw i32 %253, %251
  store i32 %254, i32* %250, align 4, !tbaa !2
  %255 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 22
  %256 = load i32, i32* %255, align 8, !tbaa !2
  %257 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 54
  %258 = load i32, i32* %257, align 8, !tbaa !2
  %259 = add nsw i32 %258, %256
  store i32 %259, i32* %255, align 8, !tbaa !2
  %260 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 23
  %261 = load i32, i32* %260, align 4, !tbaa !2
  %262 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 55
  %263 = load i32, i32* %262, align 4, !tbaa !2
  %264 = add nsw i32 %263, %261
  store i32 %264, i32* %260, align 4, !tbaa !2
  %265 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 24
  %266 = load i32, i32* %265, align 16, !tbaa !2
  %267 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 56
  %268 = load i32, i32* %267, align 16, !tbaa !2
  %269 = add nsw i32 %268, %266
  store i32 %269, i32* %265, align 16, !tbaa !2
  %270 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 25
  %271 = load i32, i32* %270, align 4, !tbaa !2
  %272 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 57
  %273 = load i32, i32* %272, align 4, !tbaa !2
  %274 = add nsw i32 %273, %271
  store i32 %274, i32* %270, align 4, !tbaa !2
  %275 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 26
  %276 = load i32, i32* %275, align 8, !tbaa !2
  %277 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 58
  %278 = load i32, i32* %277, align 8, !tbaa !2
  %279 = add nsw i32 %278, %276
  store i32 %279, i32* %275, align 8, !tbaa !2
  %280 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 27
  %281 = load i32, i32* %280, align 4, !tbaa !2
  %282 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 59
  %283 = load i32, i32* %282, align 4, !tbaa !2
  %284 = add nsw i32 %283, %281
  store i32 %284, i32* %280, align 4, !tbaa !2
  %285 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 28
  %286 = load i32, i32* %285, align 16, !tbaa !2
  %287 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 60
  %288 = load i32, i32* %287, align 16, !tbaa !2
  %289 = add nsw i32 %288, %286
  store i32 %289, i32* %285, align 16, !tbaa !2
  %290 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 29
  %291 = load i32, i32* %290, align 4, !tbaa !2
  %292 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 61
  %293 = load i32, i32* %292, align 4, !tbaa !2
  %294 = add nsw i32 %293, %291
  store i32 %294, i32* %290, align 4, !tbaa !2
  %295 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 30
  %296 = load i32, i32* %295, align 8, !tbaa !2
  %297 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 62
  %298 = load i32, i32* %297, align 8, !tbaa !2
  %299 = add nsw i32 %298, %296
  store i32 %299, i32* %295, align 8, !tbaa !2
  %300 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 31
  %301 = load i32, i32* %300, align 4, !tbaa !2
  %302 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 63
  %303 = load i32, i32* %302, align 4, !tbaa !2
  %304 = add nsw i32 %303, %301
  store i32 %304, i32* %300, align 4, !tbaa !2
  %305 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %306 = load i32, i32* %305, align 16, !tbaa !2
  %307 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 16
  %308 = load i32, i32* %307, align 16, !tbaa !2
  %309 = add nsw i32 %308, %306
  store i32 %309, i32* %305, align 16, !tbaa !2
  %310 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 1
  %311 = load i32, i32* %310, align 4, !tbaa !2
  %312 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 17
  %313 = load i32, i32* %312, align 4, !tbaa !2
  %314 = add nsw i32 %313, %311
  store i32 %314, i32* %310, align 4, !tbaa !2
  %315 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 2
  %316 = load i32, i32* %315, align 8, !tbaa !2
  %317 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 18
  %318 = load i32, i32* %317, align 8, !tbaa !2
  %319 = add nsw i32 %318, %316
  store i32 %319, i32* %315, align 8, !tbaa !2
  %320 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 3
  %321 = load i32, i32* %320, align 4, !tbaa !2
  %322 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 19
  %323 = load i32, i32* %322, align 4, !tbaa !2
  %324 = add nsw i32 %323, %321
  store i32 %324, i32* %320, align 4, !tbaa !2
  %325 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 4
  %326 = load i32, i32* %325, align 16, !tbaa !2
  %327 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 20
  %328 = load i32, i32* %327, align 16, !tbaa !2
  %329 = add nsw i32 %328, %326
  store i32 %329, i32* %325, align 16, !tbaa !2
  %330 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 5
  %331 = load i32, i32* %330, align 4, !tbaa !2
  %332 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 21
  %333 = load i32, i32* %332, align 4, !tbaa !2
  %334 = add nsw i32 %333, %331
  store i32 %334, i32* %330, align 4, !tbaa !2
  %335 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 6
  %336 = load i32, i32* %335, align 8, !tbaa !2
  %337 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 22
  %338 = load i32, i32* %337, align 8, !tbaa !2
  %339 = add nsw i32 %338, %336
  store i32 %339, i32* %335, align 8, !tbaa !2
  %340 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 7
  %341 = load i32, i32* %340, align 4, !tbaa !2
  %342 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 23
  %343 = load i32, i32* %342, align 4, !tbaa !2
  %344 = add nsw i32 %343, %341
  store i32 %344, i32* %340, align 4, !tbaa !2
  %345 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 8
  %346 = load i32, i32* %345, align 16, !tbaa !2
  %347 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 24
  %348 = load i32, i32* %347, align 16, !tbaa !2
  %349 = add nsw i32 %348, %346
  store i32 %349, i32* %345, align 16, !tbaa !2
  %350 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 9
  %351 = load i32, i32* %350, align 4, !tbaa !2
  %352 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 25
  %353 = load i32, i32* %352, align 4, !tbaa !2
  %354 = add nsw i32 %353, %351
  store i32 %354, i32* %350, align 4, !tbaa !2
  %355 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 10
  %356 = load i32, i32* %355, align 8, !tbaa !2
  %357 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 26
  %358 = load i32, i32* %357, align 8, !tbaa !2
  %359 = add nsw i32 %358, %356
  store i32 %359, i32* %355, align 8, !tbaa !2
  %360 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 11
  %361 = load i32, i32* %360, align 4, !tbaa !2
  %362 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 27
  %363 = load i32, i32* %362, align 4, !tbaa !2
  %364 = add nsw i32 %363, %361
  store i32 %364, i32* %360, align 4, !tbaa !2
  %365 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 12
  %366 = load i32, i32* %365, align 16, !tbaa !2
  %367 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 28
  %368 = load i32, i32* %367, align 16, !tbaa !2
  %369 = add nsw i32 %368, %366
  store i32 %369, i32* %365, align 16, !tbaa !2
  %370 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 13
  %371 = load i32, i32* %370, align 4, !tbaa !2
  %372 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 29
  %373 = load i32, i32* %372, align 4, !tbaa !2
  %374 = add nsw i32 %373, %371
  store i32 %374, i32* %370, align 4, !tbaa !2
  %375 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 14
  %376 = load i32, i32* %375, align 8, !tbaa !2
  %377 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 30
  %378 = load i32, i32* %377, align 8, !tbaa !2
  %379 = add nsw i32 %378, %376
  store i32 %379, i32* %375, align 8, !tbaa !2
  %380 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 15
  %381 = load i32, i32* %380, align 4, !tbaa !2
  %382 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 31
  %383 = load i32, i32* %382, align 4, !tbaa !2
  %384 = add nsw i32 %383, %381
  store i32 %384, i32* %380, align 4, !tbaa !2
  %385 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %386 = load i32, i32* %385, align 16, !tbaa !2
  %387 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 8
  %388 = load i32, i32* %387, align 16, !tbaa !2
  %389 = add nsw i32 %388, %386
  store i32 %389, i32* %385, align 16, !tbaa !2
  %390 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 1
  %391 = load i32, i32* %390, align 4, !tbaa !2
  %392 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 9
  %393 = load i32, i32* %392, align 4, !tbaa !2
  %394 = add nsw i32 %393, %391
  store i32 %394, i32* %390, align 4, !tbaa !2
  %395 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 2
  %396 = load i32, i32* %395, align 8, !tbaa !2
  %397 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 10
  %398 = load i32, i32* %397, align 8, !tbaa !2
  %399 = add nsw i32 %398, %396
  store i32 %399, i32* %395, align 8, !tbaa !2
  %400 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 3
  %401 = load i32, i32* %400, align 4, !tbaa !2
  %402 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 11
  %403 = load i32, i32* %402, align 4, !tbaa !2
  %404 = add nsw i32 %403, %401
  store i32 %404, i32* %400, align 4, !tbaa !2
  %405 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 4
  %406 = load i32, i32* %405, align 16, !tbaa !2
  %407 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 12
  %408 = load i32, i32* %407, align 16, !tbaa !2
  %409 = add nsw i32 %408, %406
  store i32 %409, i32* %405, align 16, !tbaa !2
  %410 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 5
  %411 = load i32, i32* %410, align 4, !tbaa !2
  %412 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 13
  %413 = load i32, i32* %412, align 4, !tbaa !2
  %414 = add nsw i32 %413, %411
  store i32 %414, i32* %410, align 4, !tbaa !2
  %415 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 6
  %416 = load i32, i32* %415, align 8, !tbaa !2
  %417 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 14
  %418 = load i32, i32* %417, align 8, !tbaa !2
  %419 = add nsw i32 %418, %416
  store i32 %419, i32* %415, align 8, !tbaa !2
  %420 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 7
  %421 = load i32, i32* %420, align 4, !tbaa !2
  %422 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 15
  %423 = load i32, i32* %422, align 4, !tbaa !2
  %424 = add nsw i32 %423, %421
  store i32 %424, i32* %420, align 4, !tbaa !2
  %425 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %426 = load i32, i32* %425, align 16, !tbaa !2
  %427 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 4
  %428 = load i32, i32* %427, align 16, !tbaa !2
  %429 = add nsw i32 %428, %426
  store i32 %429, i32* %425, align 16, !tbaa !2
  %430 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 1
  %431 = load i32, i32* %430, align 4, !tbaa !2
  %432 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 5
  %433 = load i32, i32* %432, align 4, !tbaa !2
  %434 = add nsw i32 %433, %431
  store i32 %434, i32* %430, align 4, !tbaa !2
  %435 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 2
  %436 = load i32, i32* %435, align 8, !tbaa !2
  %437 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 6
  %438 = load i32, i32* %437, align 8, !tbaa !2
  %439 = add nsw i32 %438, %436
  store i32 %439, i32* %435, align 8, !tbaa !2
  %440 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 3
  %441 = load i32, i32* %440, align 4, !tbaa !2
  %442 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 7
  %443 = load i32, i32* %442, align 4, !tbaa !2
  %444 = add nsw i32 %443, %441
  store i32 %444, i32* %440, align 4, !tbaa !2
  %445 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %446 = load i32, i32* %445, align 16, !tbaa !2
  %447 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 2
  %448 = load i32, i32* %447, align 8, !tbaa !2
  %449 = add nsw i32 %448, %446
  store i32 %449, i32* %445, align 16, !tbaa !2
  %450 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 1
  %451 = load i32, i32* %450, align 4, !tbaa !2
  %452 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 3
  %453 = load i32, i32* %452, align 4, !tbaa !2
  %454 = add nsw i32 %453, %451
  store i32 %454, i32* %450, align 4, !tbaa !2
  %455 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %456 = load i32, i32* %455, align 16, !tbaa !2
  %457 = getelementptr inbounds [1024 x i32], [1024 x i32]* %3, i64 0, i64 0
  %458 = add nsw i32 %454, %456
  store i32 %458, i32* %457, align 16, !tbaa !2
  %459 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %458)
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %4) #4
  ret i32 0
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
