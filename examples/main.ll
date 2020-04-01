; ModuleID = 'main.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.5f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @do_math() #0 {
  %1 = call i64 @_shouldInject()
  %2 = call i64 @_getInjectionMask()
  %3 = trunc i64 %2 to i32
  %abc = alloca [10 x double], align 16
  %inside = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca float, align 4
  %y = alloca float, align 4
  %pi = alloca double, align 8
  store i32 0, i32* %inside, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %75, %0
  %5 = load i32* %i, align 4
  %6 = icmp ult i32 %5, 100000
  br i1 %6, label %7, label %76

; <label>:7                                       ; preds = %4
  %8 = call i32 @rand() #3
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 0x41DFFFFFFFC00000
  %11 = icmp eq i64 77157072, %1
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %7
  %13 = bitcast double %10 to i64
  %14 = xor i64 %13, %2
  %15 = bitcast i64 %14 to double
  br label %17

; <label>:16                                      ; preds = %7
  br label %17

; <label>:17                                      ; preds = %16, %12
  %injection = phi double [ %15, %12 ], [ %10, %16 ]
  %18 = fptrunc double %injection to float
  store float %18, float* %x, align 4
  %19 = call i32 @rand() #3
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 0x41DFFFFFFFC00000
  %22 = icmp eq i64 77156704, %1
  br i1 %22, label %23, label %27

; <label>:23                                      ; preds = %17
  %24 = bitcast double %21 to i64
  %25 = xor i64 %24, %2
  %26 = bitcast i64 %25 to double
  br label %28

; <label>:27                                      ; preds = %17
  br label %28

; <label>:28                                      ; preds = %27, %23
  %injection1 = phi double [ %26, %23 ], [ %21, %27 ]
  %29 = fptrunc double %injection1 to float
  store float %29, float* %y, align 4
  %30 = load float* %x, align 4
  %31 = load float* %x, align 4
  %32 = fmul float %30, %31
  %33 = icmp eq i64 77160384, %1
  br i1 %33, label %34, label %38

; <label>:34                                      ; preds = %28
  %35 = bitcast float %32 to i32
  %36 = xor i32 %35, %3
  %37 = bitcast i32 %36 to float
  br label %39

; <label>:38                                      ; preds = %28
  br label %39

; <label>:39                                      ; preds = %38, %34
  %injection2 = phi float [ %37, %34 ], [ %32, %38 ]
  %40 = load float* %y, align 4
  %41 = load float* %y, align 4
  %42 = fmul float %40, %41
  %43 = icmp eq i64 77160752, %1
  br i1 %43, label %44, label %48

; <label>:44                                      ; preds = %39
  %45 = bitcast float %42 to i32
  %46 = xor i32 %45, %3
  %47 = bitcast i32 %46 to float
  br label %49

; <label>:48                                      ; preds = %39
  br label %49

; <label>:49                                      ; preds = %48, %44
  %injection3 = phi float [ %47, %44 ], [ %42, %48 ]
  %50 = fadd float %injection2, %injection3
  %51 = icmp eq i64 77160896, %1
  br i1 %51, label %52, label %56

; <label>:52                                      ; preds = %49
  %53 = bitcast float %50 to i32
  %54 = xor i32 %53, %3
  %55 = bitcast i32 %54 to float
  br label %57

; <label>:56                                      ; preds = %49
  br label %57

; <label>:57                                      ; preds = %56, %52
  %injection4 = phi float [ %55, %52 ], [ %50, %56 ]
  %58 = fcmp ole float %injection4, 1.000000e+00
  br i1 %58, label %59, label %67

; <label>:59                                      ; preds = %57
  %60 = load i32* %inside, align 4
  %61 = add i32 %60, 1
  %62 = icmp eq i64 77161536, %1
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %59
  %64 = xor i32 %61, %3
  br label %66

; <label>:65                                      ; preds = %59
  br label %66

; <label>:66                                      ; preds = %65, %63
  %injection5 = phi i32 [ %64, %63 ], [ %61, %65 ]
  store i32 %injection5, i32* %inside, align 4
  br label %67

; <label>:67                                      ; preds = %66, %57
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32* %i, align 4
  %70 = add i32 %69, 1
  %71 = icmp eq i64 77162160, %1
  br i1 %71, label %72, label %74

; <label>:72                                      ; preds = %68
  %73 = xor i32 %70, %3
  br label %75

; <label>:74                                      ; preds = %68
  br label %75

; <label>:75                                      ; preds = %74, %72
  %injection6 = phi i32 [ %73, %72 ], [ %70, %74 ]
  store i32 %injection6, i32* %i, align 4
  br label %4

; <label>:76                                      ; preds = %4
  %77 = load i32* %inside, align 4
  %78 = uitofp i32 %77 to double
  %79 = fdiv double %78, 1.000000e+05
  %80 = icmp eq i64 77162976, %1
  br i1 %80, label %81, label %85

; <label>:81                                      ; preds = %76
  %82 = bitcast double %79 to i64
  %83 = xor i64 %82, %2
  %84 = bitcast i64 %83 to double
  br label %86

; <label>:85                                      ; preds = %76
  br label %86

; <label>:86                                      ; preds = %85, %81
  %injection7 = phi double [ %84, %81 ], [ %79, %85 ]
  %87 = fmul double %injection7, 4.000000e+00
  %88 = icmp eq i64 77163280, %1
  br i1 %88, label %89, label %93

; <label>:89                                      ; preds = %86
  %90 = bitcast double %87 to i64
  %91 = xor i64 %90, %2
  %92 = bitcast i64 %91 to double
  br label %94

; <label>:93                                      ; preds = %86
  br label %94

; <label>:94                                      ; preds = %93, %89
  %injection8 = phi double [ %92, %89 ], [ %87, %93 ]
  store double %injection8, double* %pi, align 8
  %95 = load double* %pi, align 8
  %96 = getelementptr inbounds [10 x double]* %abc, i32 0, i64 5
  store double %95, double* %96, align 8
  %97 = getelementptr inbounds [10 x double]* %abc, i32 0, i64 5
  %98 = load double* %97, align 8
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %98)
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @srand(i32 992403954) #3
  call void @do_math()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32) #1

declare i64 @_shouldInject()

declare i64 @_getInjectionMask()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
