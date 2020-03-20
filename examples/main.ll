; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"%d NOT PRIME\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%d PRIME\0A\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @print_if_prime(i32) #0 {
  %2 = call i64 @_shouldInject()
  %3 = call i32 @_getInjectionMask()
  %4 = icmp eq i64 94369403854248, %2
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = xor i32 %3, %3
  br label %8

7:                                                ; preds = %1
  br label %8

8:                                                ; preds = %7, %5
  %9 = phi i32 [ %6, %5 ], [ %3, %7 ]
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %10, align 4
  store i32 3, i32* %11, align 4
  %13 = load i32, i32* %10, align 4
  %14 = icmp eq i64 94369403829688, %2
  br i1 %14, label %15, label %17

15:                                               ; preds = %8
  %16 = xor i32 %13, %3
  br label %18

17:                                               ; preds = %8
  br label %18

18:                                               ; preds = %17, %15
  %19 = phi i32 [ %16, %15 ], [ %13, %17 ]
  %20 = srem i32 %19, 2
  %21 = icmp eq i64 94369403829312, %2
  br i1 %21, label %22, label %24

22:                                               ; preds = %18
  %23 = xor i32 %20, %3
  br label %25

24:                                               ; preds = %18
  br label %25

25:                                               ; preds = %24, %22
  %26 = phi i32 [ %23, %22 ], [ %20, %24 ]
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %43

28:                                               ; preds = %25
  %29 = load i32, i32* %10, align 4
  %30 = icmp eq i64 94369403836424, %2
  br i1 %30, label %31, label %33

31:                                               ; preds = %28
  %32 = xor i32 %29, %3
  br label %34

33:                                               ; preds = %28
  br label %34

34:                                               ; preds = %33, %31
  %35 = phi i32 [ %32, %31 ], [ %29, %33 ]
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %35)
  %37 = icmp eq i64 94369403840088, %2
  br i1 %37, label %38, label %40

38:                                               ; preds = %34
  %39 = xor i32 %36, %3
  br label %41

40:                                               ; preds = %34
  br label %41

41:                                               ; preds = %40, %38
  %42 = phi i32 [ %39, %38 ], [ %36, %40 ]
  br label %144

43:                                               ; preds = %25
  %44 = load i32, i32* %10, align 4
  %45 = icmp eq i64 94369403841864, %2
  br i1 %45, label %46, label %48

46:                                               ; preds = %43
  %47 = xor i32 %44, %3
  br label %49

48:                                               ; preds = %43
  br label %49

49:                                               ; preds = %48, %46
  %50 = phi i32 [ %47, %46 ], [ %44, %48 ]
  %51 = sitofp i32 %50 to double
  %52 = call double @sqrt(double %51) #3
  %53 = fptosi double %52 to i32
  %54 = icmp eq i64 94369403842184, %2
  br i1 %54, label %55, label %57

55:                                               ; preds = %49
  %56 = xor i32 %53, %3
  br label %58

57:                                               ; preds = %49
  br label %58

58:                                               ; preds = %57, %55
  %59 = phi i32 [ %56, %55 ], [ %53, %57 ]
  store i32 %59, i32* %12, align 4
  br label %60

60:                                               ; preds = %127, %58
  %61 = load i32, i32* %11, align 4
  %62 = icmp eq i64 94369403842504, %2
  br i1 %62, label %63, label %65

63:                                               ; preds = %60
  %64 = xor i32 %61, %3
  br label %66

65:                                               ; preds = %60
  br label %66

66:                                               ; preds = %65, %63
  %67 = phi i32 [ %64, %63 ], [ %61, %65 ]
  %68 = load i32, i32* %12, align 4
  %69 = icmp eq i64 94369403842600, %2
  br i1 %69, label %70, label %72

70:                                               ; preds = %66
  %71 = xor i32 %68, %3
  br label %73

72:                                               ; preds = %66
  br label %73

73:                                               ; preds = %72, %70
  %74 = phi i32 [ %71, %70 ], [ %68, %72 ]
  %75 = icmp slt i32 %67, %74
  br i1 %75, label %76, label %129

76:                                               ; preds = %73
  %77 = load i32, i32* %10, align 4
  %78 = icmp eq i64 94369403842696, %2
  br i1 %78, label %79, label %81

79:                                               ; preds = %76
  %80 = xor i32 %77, %3
  br label %82

81:                                               ; preds = %76
  br label %82

82:                                               ; preds = %81, %79
  %83 = phi i32 [ %80, %79 ], [ %77, %81 ]
  %84 = load i32, i32* %11, align 4
  %85 = icmp eq i64 94369403843032, %2
  br i1 %85, label %86, label %88

86:                                               ; preds = %82
  %87 = xor i32 %84, %3
  br label %89

88:                                               ; preds = %82
  br label %89

89:                                               ; preds = %88, %86
  %90 = phi i32 [ %87, %86 ], [ %84, %88 ]
  %91 = srem i32 %83, %90
  %92 = icmp eq i64 94369403836944, %2
  br i1 %92, label %93, label %95

93:                                               ; preds = %89
  %94 = xor i32 %91, %3
  br label %96

95:                                               ; preds = %89
  br label %96

96:                                               ; preds = %95, %93
  %97 = phi i32 [ %94, %93 ], [ %91, %95 ]
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %114

99:                                               ; preds = %96
  %100 = load i32, i32* %10, align 4
  %101 = icmp eq i64 94369403843128, %2
  br i1 %101, label %102, label %104

102:                                              ; preds = %99
  %103 = xor i32 %100, %3
  br label %105

104:                                              ; preds = %99
  br label %105

105:                                              ; preds = %104, %102
  %106 = phi i32 [ %103, %102 ], [ %100, %104 ]
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %106)
  %108 = icmp eq i64 94369403843272, %2
  br i1 %108, label %109, label %111

109:                                              ; preds = %105
  %110 = xor i32 %107, %3
  br label %112

111:                                              ; preds = %105
  br label %112

112:                                              ; preds = %111, %109
  %113 = phi i32 [ %110, %109 ], [ %107, %111 ]
  br label %144

114:                                              ; preds = %96
  %115 = load i32, i32* %11, align 4
  %116 = icmp eq i64 94369403843480, %2
  br i1 %116, label %117, label %119

117:                                              ; preds = %114
  %118 = xor i32 %115, %3
  br label %120

119:                                              ; preds = %114
  br label %120

120:                                              ; preds = %119, %117
  %121 = phi i32 [ %118, %117 ], [ %115, %119 ]
  %122 = add nsw i32 %121, 2
  %123 = icmp eq i64 94369403841088, %2
  br i1 %123, label %124, label %126

124:                                              ; preds = %120
  %125 = xor i32 %122, %3
  br label %127

126:                                              ; preds = %120
  br label %127

127:                                              ; preds = %126, %124
  %128 = phi i32 [ %125, %124 ], [ %122, %126 ]
  store i32 %128, i32* %11, align 4
  br label %60

129:                                              ; preds = %73
  %130 = load i32, i32* %10, align 4
  %131 = icmp eq i64 94369403844056, %2
  br i1 %131, label %132, label %134

132:                                              ; preds = %129
  %133 = xor i32 %130, %3
  br label %135

134:                                              ; preds = %129
  br label %135

135:                                              ; preds = %134, %132
  %136 = phi i32 [ %133, %132 ], [ %130, %134 ]
  %137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 %136)
  %138 = icmp eq i64 94369403844200, %2
  br i1 %138, label %139, label %141

139:                                              ; preds = %135
  %140 = xor i32 %137, %3
  br label %142

141:                                              ; preds = %135
  br label %142

142:                                              ; preds = %141, %139
  %143 = phi i32 [ %140, %139 ], [ %137, %141 ]
  br label %144

144:                                              ; preds = %142, %112, %41
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  br label %3

3:                                                ; preds = %8, %0
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %4, 99
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = load i32, i32* %2, align 4
  call void @print_if_prime(i32 %7)
  br label %8

8:                                                ; preds = %6
  %9 = load i32, i32* %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %2, align 4
  br label %3

11:                                               ; preds = %3
  ret i32 0
}

declare i64 @_shouldInject()

declare i32 @_getInjectionMask()

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 9.0.1 "}
