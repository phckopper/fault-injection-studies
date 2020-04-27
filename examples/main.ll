; ModuleID = 'main.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.5f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @do_math() #0 {
  %counterptr = alloca i64
  %1 = call i64 @_shouldInject()
  %2 = call i64 @_getInjectionMask()
  %3 = trunc i64 %2 to i32
  %4 = load i64* %counterptr
  %5 = add i64 %4, 1
  store i64 %5, i64* %counterptr
  %6 = icmp eq i64 %4, %1
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = xor i32 %3, %3
  br label %10

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %9, %7
  %injection = phi i32 [ %8, %7 ], [ %3, %9 ]
  %11 = trunc i64 %2 to i1
  %12 = load i64* %counterptr
  %13 = add i64 %12, 1
  store i64 %13, i64* %counterptr
  %14 = icmp eq i64 %12, %1
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %10
  %16 = xor i1 %11, %11
  br label %18

; <label>:17                                      ; preds = %10
  br label %18

; <label>:18                                      ; preds = %17, %15
  %injection1 = phi i1 [ %16, %15 ], [ %11, %17 ]
  store i64 0, i64* %counterptr
  %abc = alloca [10 x double], align 16
  %19 = load i64* %counterptr
  %20 = add i64 %19, 1
  store i64 %20, i64* %counterptr
  %21 = icmp eq i64 %19, %1
  br i1 %21, label %22, label %26

; <label>:22                                      ; preds = %18
  %23 = ptrtoint [10 x double]* %abc to i64
  %24 = xor i64 %23, %2
  %25 = inttoptr i64 %24 to [10 x double]*
  br label %27

; <label>:26                                      ; preds = %18
  br label %27

; <label>:27                                      ; preds = %26, %22
  %injection2 = phi [10 x double]* [ %25, %22 ], [ %abc, %26 ]
  %inside = alloca i32, align 4
  %28 = load i64* %counterptr
  %29 = add i64 %28, 1
  store i64 %29, i64* %counterptr
  %30 = icmp eq i64 %28, %1
  br i1 %30, label %31, label %35

; <label>:31                                      ; preds = %27
  %32 = ptrtoint i32* %inside to i64
  %33 = xor i64 %32, %2
  %34 = inttoptr i64 %33 to i32*
  br label %36

; <label>:35                                      ; preds = %27
  br label %36

; <label>:36                                      ; preds = %35, %31
  %injection3 = phi i32* [ %34, %31 ], [ %inside, %35 ]
  %i = alloca i32, align 4
  %37 = load i64* %counterptr
  %38 = add i64 %37, 1
  store i64 %38, i64* %counterptr
  %39 = icmp eq i64 %37, %1
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %36
  %41 = ptrtoint i32* %i to i64
  %42 = xor i64 %41, %2
  %43 = inttoptr i64 %42 to i32*
  br label %45

; <label>:44                                      ; preds = %36
  br label %45

; <label>:45                                      ; preds = %44, %40
  %injection4 = phi i32* [ %43, %40 ], [ %i, %44 ]
  %x = alloca float, align 4
  %46 = load i64* %counterptr
  %47 = add i64 %46, 1
  store i64 %47, i64* %counterptr
  %48 = icmp eq i64 %46, %1
  br i1 %48, label %49, label %53

; <label>:49                                      ; preds = %45
  %50 = ptrtoint float* %x to i64
  %51 = xor i64 %50, %2
  %52 = inttoptr i64 %51 to float*
  br label %54

; <label>:53                                      ; preds = %45
  br label %54

; <label>:54                                      ; preds = %53, %49
  %injection5 = phi float* [ %52, %49 ], [ %x, %53 ]
  %y = alloca float, align 4
  %55 = load i64* %counterptr
  %56 = add i64 %55, 1
  store i64 %56, i64* %counterptr
  %57 = icmp eq i64 %55, %1
  br i1 %57, label %58, label %62

; <label>:58                                      ; preds = %54
  %59 = ptrtoint float* %y to i64
  %60 = xor i64 %59, %2
  %61 = inttoptr i64 %60 to float*
  br label %63

; <label>:62                                      ; preds = %54
  br label %63

; <label>:63                                      ; preds = %62, %58
  %injection6 = phi float* [ %61, %58 ], [ %y, %62 ]
  %pi = alloca double, align 8
  %64 = load i64* %counterptr
  %65 = add i64 %64, 1
  store i64 %65, i64* %counterptr
  %66 = icmp eq i64 %64, %1
  br i1 %66, label %67, label %71

; <label>:67                                      ; preds = %63
  %68 = ptrtoint double* %pi to i64
  %69 = xor i64 %68, %2
  %70 = inttoptr i64 %69 to double*
  br label %72

; <label>:71                                      ; preds = %63
  br label %72

; <label>:72                                      ; preds = %71, %67
  %injection7 = phi double* [ %70, %67 ], [ %pi, %71 ]
  store i32 0, i32* %injection3, align 4
  store i32 0, i32* %injection4, align 4
  br label %73

; <label>:73                                      ; preds = %265, %72
  %74 = load i32* %injection4, align 4
  %75 = load i64* %counterptr
  %76 = add i64 %75, 1
  store i64 %76, i64* %counterptr
  %77 = icmp eq i64 %75, %1
  br i1 %77, label %78, label %80

; <label>:78                                      ; preds = %73
  %79 = xor i32 %74, %3
  br label %81

; <label>:80                                      ; preds = %73
  br label %81

; <label>:81                                      ; preds = %80, %78
  %injection8 = phi i32 [ %79, %78 ], [ %74, %80 ]
  %82 = icmp ult i32 %injection8, 100000
  %83 = load i64* %counterptr
  %84 = add i64 %83, 1
  store i64 %84, i64* %counterptr
  %85 = icmp eq i64 %83, %1
  br i1 %85, label %86, label %88

; <label>:86                                      ; preds = %81
  %87 = xor i1 %82, %11
  br label %89

; <label>:88                                      ; preds = %81
  br label %89

; <label>:89                                      ; preds = %88, %86
  %injection9 = phi i1 [ %87, %86 ], [ %82, %88 ]
  br i1 %injection9, label %90, label %266

; <label>:90                                      ; preds = %89
  %91 = call i32 @rand() #3
  %92 = sitofp i32 %91 to double
  %93 = load i64* %counterptr
  %94 = add i64 %93, 1
  store i64 %94, i64* %counterptr
  %95 = icmp eq i64 %93, %1
  br i1 %95, label %96, label %100

; <label>:96                                      ; preds = %90
  %97 = bitcast double %92 to i64
  %98 = xor i64 %97, %2
  %99 = bitcast i64 %98 to double
  br label %101

; <label>:100                                     ; preds = %90
  br label %101

; <label>:101                                     ; preds = %100, %96
  %injection10 = phi double [ %99, %96 ], [ %92, %100 ]
  %102 = fdiv double %injection10, 0x41DFFFFFFFC00000
  %103 = load i64* %counterptr
  %104 = add i64 %103, 1
  store i64 %104, i64* %counterptr
  %105 = icmp eq i64 %103, %1
  br i1 %105, label %106, label %110

; <label>:106                                     ; preds = %101
  %107 = bitcast double %102 to i64
  %108 = xor i64 %107, %2
  %109 = bitcast i64 %108 to double
  br label %111

; <label>:110                                     ; preds = %101
  br label %111

; <label>:111                                     ; preds = %110, %106
  %injection11 = phi double [ %109, %106 ], [ %102, %110 ]
  %112 = fptrunc double %injection11 to float
  %113 = load i64* %counterptr
  %114 = add i64 %113, 1
  store i64 %114, i64* %counterptr
  %115 = icmp eq i64 %113, %1
  br i1 %115, label %116, label %120

; <label>:116                                     ; preds = %111
  %117 = bitcast float %112 to i32
  %118 = xor i32 %117, %3
  %119 = bitcast i32 %118 to float
  br label %121

; <label>:120                                     ; preds = %111
  br label %121

; <label>:121                                     ; preds = %120, %116
  %injection12 = phi float [ %119, %116 ], [ %112, %120 ]
  store float %injection12, float* %injection5, align 4
  %122 = call i32 @rand() #3
  %123 = sitofp i32 %122 to double
  %124 = load i64* %counterptr
  %125 = add i64 %124, 1
  store i64 %125, i64* %counterptr
  %126 = icmp eq i64 %124, %1
  br i1 %126, label %127, label %131

; <label>:127                                     ; preds = %121
  %128 = bitcast double %123 to i64
  %129 = xor i64 %128, %2
  %130 = bitcast i64 %129 to double
  br label %132

; <label>:131                                     ; preds = %121
  br label %132

; <label>:132                                     ; preds = %131, %127
  %injection13 = phi double [ %130, %127 ], [ %123, %131 ]
  %133 = fdiv double %injection13, 0x41DFFFFFFFC00000
  %134 = load i64* %counterptr
  %135 = add i64 %134, 1
  store i64 %135, i64* %counterptr
  %136 = icmp eq i64 %134, %1
  br i1 %136, label %137, label %141

; <label>:137                                     ; preds = %132
  %138 = bitcast double %133 to i64
  %139 = xor i64 %138, %2
  %140 = bitcast i64 %139 to double
  br label %142

; <label>:141                                     ; preds = %132
  br label %142

; <label>:142                                     ; preds = %141, %137
  %injection14 = phi double [ %140, %137 ], [ %133, %141 ]
  %143 = fptrunc double %injection14 to float
  %144 = load i64* %counterptr
  %145 = add i64 %144, 1
  store i64 %145, i64* %counterptr
  %146 = icmp eq i64 %144, %1
  br i1 %146, label %147, label %151

; <label>:147                                     ; preds = %142
  %148 = bitcast float %143 to i32
  %149 = xor i32 %148, %3
  %150 = bitcast i32 %149 to float
  br label %152

; <label>:151                                     ; preds = %142
  br label %152

; <label>:152                                     ; preds = %151, %147
  %injection15 = phi float [ %150, %147 ], [ %143, %151 ]
  store float %injection15, float* %injection6, align 4
  %153 = load float* %injection5, align 4
  %154 = load i64* %counterptr
  %155 = add i64 %154, 1
  store i64 %155, i64* %counterptr
  %156 = icmp eq i64 %154, %1
  br i1 %156, label %157, label %161

; <label>:157                                     ; preds = %152
  %158 = bitcast float %153 to i32
  %159 = xor i32 %158, %3
  %160 = bitcast i32 %159 to float
  br label %162

; <label>:161                                     ; preds = %152
  br label %162

; <label>:162                                     ; preds = %161, %157
  %injection16 = phi float [ %160, %157 ], [ %153, %161 ]
  %163 = load float* %injection5, align 4
  %164 = load i64* %counterptr
  %165 = add i64 %164, 1
  store i64 %165, i64* %counterptr
  %166 = icmp eq i64 %164, %1
  br i1 %166, label %167, label %171

; <label>:167                                     ; preds = %162
  %168 = bitcast float %163 to i32
  %169 = xor i32 %168, %3
  %170 = bitcast i32 %169 to float
  br label %172

; <label>:171                                     ; preds = %162
  br label %172

; <label>:172                                     ; preds = %171, %167
  %injection17 = phi float [ %170, %167 ], [ %163, %171 ]
  %173 = fmul float %injection16, %injection17
  %174 = load i64* %counterptr
  %175 = add i64 %174, 1
  store i64 %175, i64* %counterptr
  %176 = icmp eq i64 %174, %1
  br i1 %176, label %177, label %181

; <label>:177                                     ; preds = %172
  %178 = bitcast float %173 to i32
  %179 = xor i32 %178, %3
  %180 = bitcast i32 %179 to float
  br label %182

; <label>:181                                     ; preds = %172
  br label %182

; <label>:182                                     ; preds = %181, %177
  %injection18 = phi float [ %180, %177 ], [ %173, %181 ]
  %183 = load float* %injection6, align 4
  %184 = load i64* %counterptr
  %185 = add i64 %184, 1
  store i64 %185, i64* %counterptr
  %186 = icmp eq i64 %184, %1
  br i1 %186, label %187, label %191

; <label>:187                                     ; preds = %182
  %188 = bitcast float %183 to i32
  %189 = xor i32 %188, %3
  %190 = bitcast i32 %189 to float
  br label %192

; <label>:191                                     ; preds = %182
  br label %192

; <label>:192                                     ; preds = %191, %187
  %injection19 = phi float [ %190, %187 ], [ %183, %191 ]
  %193 = load float* %injection6, align 4
  %194 = load i64* %counterptr
  %195 = add i64 %194, 1
  store i64 %195, i64* %counterptr
  %196 = icmp eq i64 %194, %1
  br i1 %196, label %197, label %201

; <label>:197                                     ; preds = %192
  %198 = bitcast float %193 to i32
  %199 = xor i32 %198, %3
  %200 = bitcast i32 %199 to float
  br label %202

; <label>:201                                     ; preds = %192
  br label %202

; <label>:202                                     ; preds = %201, %197
  %injection20 = phi float [ %200, %197 ], [ %193, %201 ]
  %203 = fmul float %injection19, %injection20
  %204 = load i64* %counterptr
  %205 = add i64 %204, 1
  store i64 %205, i64* %counterptr
  %206 = icmp eq i64 %204, %1
  br i1 %206, label %207, label %211

; <label>:207                                     ; preds = %202
  %208 = bitcast float %203 to i32
  %209 = xor i32 %208, %3
  %210 = bitcast i32 %209 to float
  br label %212

; <label>:211                                     ; preds = %202
  br label %212

; <label>:212                                     ; preds = %211, %207
  %injection21 = phi float [ %210, %207 ], [ %203, %211 ]
  %213 = fadd float %injection18, %injection21
  %214 = load i64* %counterptr
  %215 = add i64 %214, 1
  store i64 %215, i64* %counterptr
  %216 = icmp eq i64 %214, %1
  br i1 %216, label %217, label %221

; <label>:217                                     ; preds = %212
  %218 = bitcast float %213 to i32
  %219 = xor i32 %218, %3
  %220 = bitcast i32 %219 to float
  br label %222

; <label>:221                                     ; preds = %212
  br label %222

; <label>:222                                     ; preds = %221, %217
  %injection22 = phi float [ %220, %217 ], [ %213, %221 ]
  %223 = fcmp ole float %injection22, 1.000000e+00
  %224 = load i64* %counterptr
  %225 = add i64 %224, 1
  store i64 %225, i64* %counterptr
  %226 = icmp eq i64 %224, %1
  br i1 %226, label %227, label %229

; <label>:227                                     ; preds = %222
  %228 = xor i1 %223, %11
  br label %230

; <label>:229                                     ; preds = %222
  br label %230

; <label>:230                                     ; preds = %229, %227
  %injection23 = phi i1 [ %228, %227 ], [ %223, %229 ]
  br i1 %injection23, label %231, label %248

; <label>:231                                     ; preds = %230
  %232 = load i32* %injection3, align 4
  %233 = load i64* %counterptr
  %234 = add i64 %233, 1
  store i64 %234, i64* %counterptr
  %235 = icmp eq i64 %233, %1
  br i1 %235, label %236, label %238

; <label>:236                                     ; preds = %231
  %237 = xor i32 %232, %3
  br label %239

; <label>:238                                     ; preds = %231
  br label %239

; <label>:239                                     ; preds = %238, %236
  %injection24 = phi i32 [ %237, %236 ], [ %232, %238 ]
  %240 = add i32 %injection24, 1
  %241 = load i64* %counterptr
  %242 = add i64 %241, 1
  store i64 %242, i64* %counterptr
  %243 = icmp eq i64 %241, %1
  br i1 %243, label %244, label %246

; <label>:244                                     ; preds = %239
  %245 = xor i32 %240, %3
  br label %247

; <label>:246                                     ; preds = %239
  br label %247

; <label>:247                                     ; preds = %246, %244
  %injection25 = phi i32 [ %245, %244 ], [ %240, %246 ]
  store i32 %injection25, i32* %injection3, align 4
  br label %248

; <label>:248                                     ; preds = %247, %230
  br label %249

; <label>:249                                     ; preds = %248
  %250 = load i32* %injection4, align 4
  %251 = load i64* %counterptr
  %252 = add i64 %251, 1
  store i64 %252, i64* %counterptr
  %253 = icmp eq i64 %251, %1
  br i1 %253, label %254, label %256

; <label>:254                                     ; preds = %249
  %255 = xor i32 %250, %3
  br label %257

; <label>:256                                     ; preds = %249
  br label %257

; <label>:257                                     ; preds = %256, %254
  %injection26 = phi i32 [ %255, %254 ], [ %250, %256 ]
  %258 = add i32 %injection26, 1
  %259 = load i64* %counterptr
  %260 = add i64 %259, 1
  store i64 %260, i64* %counterptr
  %261 = icmp eq i64 %259, %1
  br i1 %261, label %262, label %264

; <label>:262                                     ; preds = %257
  %263 = xor i32 %258, %3
  br label %265

; <label>:264                                     ; preds = %257
  br label %265

; <label>:265                                     ; preds = %264, %262
  %injection27 = phi i32 [ %263, %262 ], [ %258, %264 ]
  store i32 %injection27, i32* %injection4, align 4
  br label %73

; <label>:266                                     ; preds = %89
  %267 = load i32* %injection3, align 4
  %268 = load i64* %counterptr
  %269 = add i64 %268, 1
  store i64 %269, i64* %counterptr
  %270 = icmp eq i64 %268, %1
  br i1 %270, label %271, label %273

; <label>:271                                     ; preds = %266
  %272 = xor i32 %267, %3
  br label %274

; <label>:273                                     ; preds = %266
  br label %274

; <label>:274                                     ; preds = %273, %271
  %injection28 = phi i32 [ %272, %271 ], [ %267, %273 ]
  %275 = uitofp i32 %injection28 to double
  %276 = load i64* %counterptr
  %277 = add i64 %276, 1
  store i64 %277, i64* %counterptr
  %278 = icmp eq i64 %276, %1
  br i1 %278, label %279, label %283

; <label>:279                                     ; preds = %274
  %280 = bitcast double %275 to i64
  %281 = xor i64 %280, %2
  %282 = bitcast i64 %281 to double
  br label %284

; <label>:283                                     ; preds = %274
  br label %284

; <label>:284                                     ; preds = %283, %279
  %injection29 = phi double [ %282, %279 ], [ %275, %283 ]
  %285 = fdiv double %injection29, 1.000000e+05
  %286 = load i64* %counterptr
  %287 = add i64 %286, 1
  store i64 %287, i64* %counterptr
  %288 = icmp eq i64 %286, %1
  br i1 %288, label %289, label %293

; <label>:289                                     ; preds = %284
  %290 = bitcast double %285 to i64
  %291 = xor i64 %290, %2
  %292 = bitcast i64 %291 to double
  br label %294

; <label>:293                                     ; preds = %284
  br label %294

; <label>:294                                     ; preds = %293, %289
  %injection30 = phi double [ %292, %289 ], [ %285, %293 ]
  %295 = fmul double %injection30, 4.000000e+00
  %296 = load i64* %counterptr
  %297 = add i64 %296, 1
  store i64 %297, i64* %counterptr
  %298 = icmp eq i64 %296, %1
  br i1 %298, label %299, label %303

; <label>:299                                     ; preds = %294
  %300 = bitcast double %295 to i64
  %301 = xor i64 %300, %2
  %302 = bitcast i64 %301 to double
  br label %304

; <label>:303                                     ; preds = %294
  br label %304

; <label>:304                                     ; preds = %303, %299
  %injection31 = phi double [ %302, %299 ], [ %295, %303 ]
  store double %injection31, double* %injection7, align 8
  %305 = load double* %injection7, align 8
  %306 = load i64* %counterptr
  %307 = add i64 %306, 1
  store i64 %307, i64* %counterptr
  %308 = icmp eq i64 %306, %1
  br i1 %308, label %309, label %313

; <label>:309                                     ; preds = %304
  %310 = bitcast double %305 to i64
  %311 = xor i64 %310, %2
  %312 = bitcast i64 %311 to double
  br label %314

; <label>:313                                     ; preds = %304
  br label %314

; <label>:314                                     ; preds = %313, %309
  %injection32 = phi double [ %312, %309 ], [ %305, %313 ]
  %315 = getelementptr inbounds [10 x double]* %injection2, i32 0, i64 5
  %316 = load i64* %counterptr
  %317 = add i64 %316, 1
  store i64 %317, i64* %counterptr
  %318 = icmp eq i64 %316, %1
  br i1 %318, label %319, label %323

; <label>:319                                     ; preds = %314
  %320 = ptrtoint double* %315 to i64
  %321 = xor i64 %320, %2
  %322 = inttoptr i64 %321 to double*
  br label %324

; <label>:323                                     ; preds = %314
  br label %324

; <label>:324                                     ; preds = %323, %319
  %injection33 = phi double* [ %322, %319 ], [ %315, %323 ]
  store double %injection32, double* %injection33, align 8
  %325 = getelementptr inbounds [10 x double]* %injection2, i32 0, i64 5
  %326 = load i64* %counterptr
  %327 = add i64 %326, 1
  store i64 %327, i64* %counterptr
  %328 = icmp eq i64 %326, %1
  br i1 %328, label %329, label %333

; <label>:329                                     ; preds = %324
  %330 = ptrtoint double* %325 to i64
  %331 = xor i64 %330, %2
  %332 = inttoptr i64 %331 to double*
  br label %334

; <label>:333                                     ; preds = %324
  br label %334

; <label>:334                                     ; preds = %333, %329
  %injection34 = phi double* [ %332, %329 ], [ %325, %333 ]
  %335 = load double* %injection34, align 8
  %336 = load i64* %counterptr
  %337 = add i64 %336, 1
  store i64 %337, i64* %counterptr
  %338 = icmp eq i64 %336, %1
  br i1 %338, label %339, label %343

; <label>:339                                     ; preds = %334
  %340 = bitcast double %335 to i64
  %341 = xor i64 %340, %2
  %342 = bitcast i64 %341 to double
  br label %344

; <label>:343                                     ; preds = %334
  br label %344

; <label>:344                                     ; preds = %343, %339
  %injection35 = phi double [ %342, %339 ], [ %335, %343 ]
  %345 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %injection35)
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

!0 = metadata !{metadata !"Ubuntu clang version 3.5.2-3ubuntu1 (tags/RELEASE_352/final) (based on LLVM 3.5.2)"}
