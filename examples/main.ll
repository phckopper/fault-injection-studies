; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.5f\0A\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @do_math() #0 {
  %1 = call i64 @_shouldInject()
  %2 = call i64 @_getInjectionMask()
  %3 = trunc i64 %2 to i32
  %4 = alloca [10 x double], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %10

10:                                               ; preds = %85, %0
  %11 = load i32, i32* %6, align 4
  %12 = icmp ult i32 %11, 100000
  br i1 %12, label %13, label %87

13:                                               ; preds = %10
  %14 = call i32 @rand() #3
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 0x41DFFFFFFFC00000
  %17 = icmp eq i64 94233741765728, %1
  br i1 %17, label %18, label %22

18:                                               ; preds = %13
  %19 = bitcast double %16 to i64
  %20 = xor i64 %19, %2
  %21 = bitcast i64 %20 to double
  br label %23

22:                                               ; preds = %13
  br label %23

23:                                               ; preds = %22, %18
  %24 = phi double [ %21, %18 ], [ %16, %22 ]
  store double %24, double* %7, align 8
  %25 = call i32 @rand() #3
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 0x41DFFFFFFFC00000
  %28 = icmp eq i64 94233742045632, %1
  br i1 %28, label %29, label %33

29:                                               ; preds = %23
  %30 = bitcast double %27 to i64
  %31 = xor i64 %30, %2
  %32 = bitcast i64 %31 to double
  br label %34

33:                                               ; preds = %23
  br label %34

34:                                               ; preds = %33, %29
  %35 = phi double [ %32, %29 ], [ %27, %33 ]
  store double %35, double* %8, align 8
  %36 = load double, double* %7, align 8
  %37 = load double, double* %7, align 8
  %38 = fmul double %36, %37
  %39 = icmp eq i64 94233742045872, %1
  br i1 %39, label %40, label %44

40:                                               ; preds = %34
  %41 = bitcast double %38 to i64
  %42 = xor i64 %41, %2
  %43 = bitcast i64 %42 to double
  br label %45

44:                                               ; preds = %34
  br label %45

45:                                               ; preds = %44, %40
  %46 = phi double [ %43, %40 ], [ %38, %44 ]
  %47 = load double, double* %8, align 8
  %48 = load double, double* %8, align 8
  %49 = fmul double %47, %48
  %50 = icmp eq i64 94233742044880, %1
  br i1 %50, label %51, label %55

51:                                               ; preds = %45
  %52 = bitcast double %49 to i64
  %53 = xor i64 %52, %2
  %54 = bitcast i64 %53 to double
  br label %56

55:                                               ; preds = %45
  br label %56

56:                                               ; preds = %55, %51
  %57 = phi double [ %54, %51 ], [ %49, %55 ]
  %58 = fadd double %46, %57
  %59 = icmp eq i64 94233742044992, %1
  br i1 %59, label %60, label %64

60:                                               ; preds = %56
  %61 = bitcast double %58 to i64
  %62 = xor i64 %61, %2
  %63 = bitcast i64 %62 to double
  br label %65

64:                                               ; preds = %56
  br label %65

65:                                               ; preds = %64, %60
  %66 = phi double [ %63, %60 ], [ %58, %64 ]
  %67 = fcmp ole double %66, 1.000000e+00
  br i1 %67, label %68, label %77

68:                                               ; preds = %65
  %69 = load i32, i32* %5, align 4
  %70 = add i32 %69, 1
  %71 = icmp eq i64 94233742049648, %1
  br i1 %71, label %72, label %74

72:                                               ; preds = %68
  %73 = xor i32 %70, %3
  br label %75

74:                                               ; preds = %68
  br label %75

75:                                               ; preds = %74, %72
  %76 = phi i32 [ %73, %72 ], [ %70, %74 ]
  store i32 %76, i32* %5, align 4
  br label %77

77:                                               ; preds = %75, %65
  br label %78

78:                                               ; preds = %77
  %79 = load i32, i32* %6, align 4
  %80 = add i32 %79, 1
  %81 = icmp eq i64 94233742050176, %1
  br i1 %81, label %82, label %84

82:                                               ; preds = %78
  %83 = xor i32 %80, %3
  br label %85

84:                                               ; preds = %78
  br label %85

85:                                               ; preds = %84, %82
  %86 = phi i32 [ %83, %82 ], [ %80, %84 ]
  store i32 %86, i32* %6, align 4
  br label %10

87:                                               ; preds = %10
  %88 = load i32, i32* %5, align 4
  %89 = uitofp i32 %88 to double
  %90 = fdiv double %89, 1.000000e+05
  %91 = icmp eq i64 94233742050800, %1
  br i1 %91, label %92, label %96

92:                                               ; preds = %87
  %93 = bitcast double %90 to i64
  %94 = xor i64 %93, %2
  %95 = bitcast i64 %94 to double
  br label %97

96:                                               ; preds = %87
  br label %97

97:                                               ; preds = %96, %92
  %98 = phi double [ %95, %92 ], [ %90, %96 ]
  %99 = fmul double %98, 4.000000e+00
  %100 = icmp eq i64 94233742050912, %1
  br i1 %100, label %101, label %105

101:                                              ; preds = %97
  %102 = bitcast double %99 to i64
  %103 = xor i64 %102, %2
  %104 = bitcast i64 %103 to double
  br label %106

105:                                              ; preds = %97
  br label %106

106:                                              ; preds = %105, %101
  %107 = phi double [ %104, %101 ], [ %99, %105 ]
  store double %107, double* %9, align 8
  %108 = load double, double* %9, align 8
  %109 = getelementptr inbounds [10 x double], [10 x double]* %4, i64 0, i64 5
  store double %108, double* %109, align 8
  %110 = getelementptr inbounds [10 x double], [10 x double]* %4, i64 0, i64 5
  %111 = load double, double* %110, align 8
  %112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), double %111)
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @srand(i32 992403954) #3
  call void @do_math()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32) #1

declare i64 @_shouldInject()

declare i64 @_getInjectionMask()

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 9.0.1 "}
