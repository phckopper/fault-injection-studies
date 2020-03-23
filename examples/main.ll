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
  %4 = icmp eq i64 94566862202088, %2
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
  %14 = icmp eq i64 94566862179848, %2
  br i1 %14, label %15, label %17

15:                                               ; preds = %8
  %16 = xor i32 %13, %3
  br label %18

17:                                               ; preds = %8
  br label %18

18:                                               ; preds = %17, %15
  %19 = phi i32 [ %16, %15 ], [ %13, %17 ]
  %20 = srem i32 %19, 2
  %21 = icmp eq i64 94566862179472, %2
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
  %30 = icmp eq i64 94566862186584, %2
  br i1 %30, label %31, label %33

31:                                               ; preds = %28
  %32 = xor i32 %29, %3
  br label %34

33:                                               ; preds = %28
  br label %34

34:                                               ; preds = %33, %31
  %35 = phi i32 [ %32, %31 ], [ %29, %33 ]
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %35)
  %37 = icmp eq i64 94566862190248, %2
  br i1 %37, label %38, label %40

38:                                               ; preds = %34
  %39 = xor i32 %36, %3
  br label %41

40:                                               ; preds = %34
  br label %41

41:                                               ; preds = %40, %38
  %42 = phi i32 [ %39, %38 ], [ %36, %40 ]
  br label %154

43:                                               ; preds = %25
  %44 = load i32, i32* %10, align 4
  %45 = icmp eq i64 94566862192024, %2
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
  %54 = icmp eq i64 94566862192344, %2
  br i1 %54, label %55, label %57

55:                                               ; preds = %49
  %56 = xor i32 %53, %3
  br label %58

57:                                               ; preds = %49
  br label %58

58:                                               ; preds = %57, %55
  %59 = phi i32 [ %56, %55 ], [ %53, %57 ]
  store i32 %59, i32* %12, align 4
  %60 = load i32, i32* %10, align 4
  %61 = icmp eq i64 94566862192568, %2
  br i1 %61, label %62, label %64

62:                                               ; preds = %58
  %63 = xor i32 %60, %3
  br label %65

64:                                               ; preds = %58
  br label %65

65:                                               ; preds = %64, %62
  %66 = phi i32 [ %63, %62 ], [ %60, %64 ]
  %67 = icmp sle i32 %66, 2
  br i1 %67, label %68, label %69

68:                                               ; preds = %65
  store volatile i32 0, i32* null, align 4
  br label %69

69:                                               ; preds = %68, %65
  br label %70

70:                                               ; preds = %137, %69
  %71 = load i32, i32* %11, align 4
  %72 = icmp eq i64 94566862186840, %2
  br i1 %72, label %73, label %75

73:                                               ; preds = %70
  %74 = xor i32 %71, %3
  br label %76

75:                                               ; preds = %70
  br label %76

76:                                               ; preds = %75, %73
  %77 = phi i32 [ %74, %73 ], [ %71, %75 ]
  %78 = load i32, i32* %12, align 4
  %79 = icmp eq i64 94566862180120, %2
  br i1 %79, label %80, label %82

80:                                               ; preds = %76
  %81 = xor i32 %78, %3
  br label %83

82:                                               ; preds = %76
  br label %83

83:                                               ; preds = %82, %80
  %84 = phi i32 [ %81, %80 ], [ %78, %82 ]
  %85 = icmp slt i32 %77, %84
  br i1 %85, label %86, label %139

86:                                               ; preds = %83
  %87 = load i32, i32* %10, align 4
  %88 = icmp eq i64 94566862194040, %2
  br i1 %88, label %89, label %91

89:                                               ; preds = %86
  %90 = xor i32 %87, %3
  br label %92

91:                                               ; preds = %86
  br label %92

92:                                               ; preds = %91, %89
  %93 = phi i32 [ %90, %89 ], [ %87, %91 ]
  %94 = load i32, i32* %11, align 4
  %95 = icmp eq i64 94566862194136, %2
  br i1 %95, label %96, label %98

96:                                               ; preds = %92
  %97 = xor i32 %94, %3
  br label %99

98:                                               ; preds = %92
  br label %99

99:                                               ; preds = %98, %96
  %100 = phi i32 [ %97, %96 ], [ %94, %98 ]
  %101 = srem i32 %93, %100
  %102 = icmp eq i64 94566862186336, %2
  br i1 %102, label %103, label %105

103:                                              ; preds = %99
  %104 = xor i32 %101, %3
  br label %106

105:                                              ; preds = %99
  br label %106

106:                                              ; preds = %105, %103
  %107 = phi i32 [ %104, %103 ], [ %101, %105 ]
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %109, label %124

109:                                              ; preds = %106
  %110 = load i32, i32* %10, align 4
  %111 = icmp eq i64 94566862194232, %2
  br i1 %111, label %112, label %114

112:                                              ; preds = %109
  %113 = xor i32 %110, %3
  br label %115

114:                                              ; preds = %109
  br label %115

115:                                              ; preds = %114, %112
  %116 = phi i32 [ %113, %112 ], [ %110, %114 ]
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %116)
  %118 = icmp eq i64 94566862194520, %2
  br i1 %118, label %119, label %121

119:                                              ; preds = %115
  %120 = xor i32 %117, %3
  br label %122

121:                                              ; preds = %115
  br label %122

122:                                              ; preds = %121, %119
  %123 = phi i32 [ %120, %119 ], [ %117, %121 ]
  br label %154

124:                                              ; preds = %106
  %125 = load i32, i32* %11, align 4
  %126 = icmp eq i64 94566862194728, %2
  br i1 %126, label %127, label %129

127:                                              ; preds = %124
  %128 = xor i32 %125, %3
  br label %130

129:                                              ; preds = %124
  br label %130

130:                                              ; preds = %129, %127
  %131 = phi i32 [ %128, %127 ], [ %125, %129 ]
  %132 = add nsw i32 %131, 2
  %133 = icmp eq i64 94566862191248, %2
  br i1 %133, label %134, label %136

134:                                              ; preds = %130
  %135 = xor i32 %132, %3
  br label %137

136:                                              ; preds = %130
  br label %137

137:                                              ; preds = %136, %134
  %138 = phi i32 [ %135, %134 ], [ %132, %136 ]
  store i32 %138, i32* %11, align 4
  br label %70

139:                                              ; preds = %83
  %140 = load i32, i32* %10, align 4
  %141 = icmp eq i64 94566862195304, %2
  br i1 %141, label %142, label %144

142:                                              ; preds = %139
  %143 = xor i32 %140, %3
  br label %145

144:                                              ; preds = %139
  br label %145

145:                                              ; preds = %144, %142
  %146 = phi i32 [ %143, %142 ], [ %140, %144 ]
  %147 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 %146)
  %148 = icmp eq i64 94566862195448, %2
  br i1 %148, label %149, label %151

149:                                              ; preds = %145
  %150 = xor i32 %147, %3
  br label %152

151:                                              ; preds = %145
  br label %152

152:                                              ; preds = %151, %149
  %153 = phi i32 [ %150, %149 ], [ %147, %151 ]
  br label %154

154:                                              ; preds = %152, %122, %41
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
  store i32 3, i32* %2, align 4
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
