; ModuleID = 'encoder.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@current_frame = common global [240 x [416 x i8]] zeroinitializer, align 16
@reference_frame = common global [240 x [416 x i8]] zeroinitializer, align 16
@motion_vectors = common global [60 x [104 x [2 x i32]]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @motion_main() #0 {
  %1 = call i64 @_shouldInject()
  %2 = call i64 @_getInjectionMask()
  %3 = trunc i64 %2 to i32
  %4 = icmp eq i64 55454312, %1
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = xor i32 %3, %3
  br label %8

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %7, %5
  %injection = phi i32 [ %6, %5 ], [ %3, %7 ]
  %9 = trunc i64 %2 to i1
  %10 = icmp eq i64 55454424, %1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8
  %12 = xor i1 %9, %9
  br label %14

; <label>:13                                      ; preds = %8
  br label %14

; <label>:14                                      ; preds = %13, %11
  %injection1 = phi i1 [ %12, %11 ], [ %9, %13 ]
  %sad = alloca i32, align 4
  %15 = icmp eq i64 55110008, %1
  br i1 %15, label %16, label %20

; <label>:16                                      ; preds = %14
  %17 = ptrtoint i32* %sad to i64
  %18 = xor i64 %17, %2
  %19 = inttoptr i64 %18 to i32*
  br label %21

; <label>:20                                      ; preds = %14
  br label %21

; <label>:21                                      ; preds = %20, %16
  %injection2 = phi i32* [ %19, %16 ], [ %sad, %20 ]
  %i = alloca i32, align 4
  %22 = icmp eq i64 55118872, %1
  br i1 %22, label %23, label %27

; <label>:23                                      ; preds = %21
  %24 = ptrtoint i32* %i to i64
  %25 = xor i64 %24, %2
  %26 = inttoptr i64 %25 to i32*
  br label %28

; <label>:27                                      ; preds = %21
  br label %28

; <label>:28                                      ; preds = %27, %23
  %injection3 = phi i32* [ %26, %23 ], [ %i, %27 ]
  %j = alloca i32, align 4
  %29 = icmp eq i64 55118984, %1
  br i1 %29, label %30, label %34

; <label>:30                                      ; preds = %28
  %31 = ptrtoint i32* %j to i64
  %32 = xor i64 %31, %2
  %33 = inttoptr i64 %32 to i32*
  br label %35

; <label>:34                                      ; preds = %28
  br label %35

; <label>:35                                      ; preds = %34, %30
  %injection4 = phi i32* [ %33, %30 ], [ %j, %34 ]
  %k = alloca i32, align 4
  %36 = icmp eq i64 55279432, %1
  br i1 %36, label %37, label %41

; <label>:37                                      ; preds = %35
  %38 = ptrtoint i32* %k to i64
  %39 = xor i64 %38, %2
  %40 = inttoptr i64 %39 to i32*
  br label %42

; <label>:41                                      ; preds = %35
  br label %42

; <label>:42                                      ; preds = %41, %37
  %injection5 = phi i32* [ %40, %37 ], [ %k, %41 ]
  %m = alloca i32, align 4
  %43 = icmp eq i64 55279544, %1
  br i1 %43, label %44, label %48

; <label>:44                                      ; preds = %42
  %45 = ptrtoint i32* %m to i64
  %46 = xor i64 %45, %2
  %47 = inttoptr i64 %46 to i32*
  br label %49

; <label>:48                                      ; preds = %42
  br label %49

; <label>:49                                      ; preds = %48, %44
  %injection6 = phi i32* [ %47, %44 ], [ %m, %48 ]
  %p = alloca i32, align 4
  %50 = icmp eq i64 55279656, %1
  br i1 %50, label %51, label %55

; <label>:51                                      ; preds = %49
  %52 = ptrtoint i32* %p to i64
  %53 = xor i64 %52, %2
  %54 = inttoptr i64 %53 to i32*
  br label %56

; <label>:55                                      ; preds = %49
  br label %56

; <label>:56                                      ; preds = %55, %51
  %injection7 = phi i32* [ %54, %51 ], [ %p, %55 ]
  %q = alloca i32, align 4
  %57 = icmp eq i64 55279768, %1
  br i1 %57, label %58, label %62

; <label>:58                                      ; preds = %56
  %59 = ptrtoint i32* %q to i64
  %60 = xor i64 %59, %2
  %61 = inttoptr i64 %60 to i32*
  br label %63

; <label>:62                                      ; preds = %56
  br label %63

; <label>:63                                      ; preds = %62, %58
  %injection8 = phi i32* [ %61, %58 ], [ %q, %62 ]
  %temp_sad = alloca i32, align 4
  %64 = icmp eq i64 55279880, %1
  br i1 %64, label %65, label %69

; <label>:65                                      ; preds = %63
  %66 = ptrtoint i32* %temp_sad to i64
  %67 = xor i64 %66, %2
  %68 = inttoptr i64 %67 to i32*
  br label %70

; <label>:69                                      ; preds = %63
  br label %70

; <label>:70                                      ; preds = %69, %65
  %injection9 = phi i32* [ %68, %65 ], [ %temp_sad, %69 ]
  %motion_vec_x = alloca i32, align 4
  %71 = icmp eq i64 55279992, %1
  br i1 %71, label %72, label %76

; <label>:72                                      ; preds = %70
  %73 = ptrtoint i32* %motion_vec_x to i64
  %74 = xor i64 %73, %2
  %75 = inttoptr i64 %74 to i32*
  br label %77

; <label>:76                                      ; preds = %70
  br label %77

; <label>:77                                      ; preds = %76, %72
  %injection10 = phi i32* [ %75, %72 ], [ %motion_vec_x, %76 ]
  %motion_vec_y = alloca i32, align 4
  %78 = icmp eq i64 55280376, %1
  br i1 %78, label %79, label %83

; <label>:79                                      ; preds = %77
  %80 = ptrtoint i32* %motion_vec_y to i64
  %81 = xor i64 %80, %2
  %82 = inttoptr i64 %81 to i32*
  br label %84

; <label>:83                                      ; preds = %77
  br label %84

; <label>:84                                      ; preds = %83, %79
  %injection11 = phi i32* [ %82, %79 ], [ %motion_vec_y, %83 ]
  %diff = alloca i32, align 4
  %85 = icmp eq i64 55280680, %1
  br i1 %85, label %86, label %90

; <label>:86                                      ; preds = %84
  %87 = ptrtoint i32* %diff to i64
  %88 = xor i64 %87, %2
  %89 = inttoptr i64 %88 to i32*
  br label %91

; <label>:90                                      ; preds = %84
  br label %91

; <label>:91                                      ; preds = %90, %86
  %injection12 = phi i32* [ %89, %86 ], [ %diff, %90 ]
  store i32 2147483647, i32* %injection2, align 4
  store i32 0, i32* %injection10, align 4
  store i32 0, i32* %injection11, align 4
  store i32 0, i32* %injection12, align 4
  store i32 0, i32* %injection3, align 4
  br label %92

; <label>:92                                      ; preds = %801, %91
  %93 = load i32* %injection3, align 4
  %94 = icmp eq i64 55281576, %1
  br i1 %94, label %95, label %97

; <label>:95                                      ; preds = %92
  %96 = xor i32 %93, %3
  br label %98

; <label>:97                                      ; preds = %92
  br label %98

; <label>:98                                      ; preds = %97, %95
  %injection13 = phi i32 [ %96, %95 ], [ %93, %97 ]
  %99 = icmp slt i32 %injection13, 240
  %100 = icmp eq i64 55281792, %1
  br i1 %100, label %101, label %103

; <label>:101                                     ; preds = %98
  %102 = xor i1 %99, %9
  br label %104

; <label>:103                                     ; preds = %98
  br label %104

; <label>:104                                     ; preds = %103, %101
  %injection14 = phi i1 [ %102, %101 ], [ %99, %103 ]
  br i1 %injection14, label %105, label %802

; <label>:105                                     ; preds = %104
  store i32 0, i32* %injection4, align 4
  br label %106

; <label>:106                                     ; preds = %787, %105
  %107 = load i32* %injection4, align 4
  %108 = icmp eq i64 55282712, %1
  br i1 %108, label %109, label %111

; <label>:109                                     ; preds = %106
  %110 = xor i32 %107, %3
  br label %112

; <label>:111                                     ; preds = %106
  br label %112

; <label>:112                                     ; preds = %111, %109
  %injection15 = phi i32 [ %110, %109 ], [ %107, %111 ]
  %113 = icmp slt i32 %injection15, 416
  %114 = icmp eq i64 55282928, %1
  br i1 %114, label %115, label %117

; <label>:115                                     ; preds = %112
  %116 = xor i1 %113, %9
  br label %118

; <label>:117                                     ; preds = %112
  br label %118

; <label>:118                                     ; preds = %117, %115
  %injection16 = phi i1 [ %116, %115 ], [ %113, %117 ]
  br i1 %injection16, label %119, label %788

; <label>:119                                     ; preds = %118
  store i32 2147483647, i32* %injection2, align 4
  store i32 0, i32* %injection5, align 4
  br label %120

; <label>:120                                     ; preds = %641, %119
  %121 = load i32* %injection5, align 4
  %122 = icmp eq i64 55283992, %1
  br i1 %122, label %123, label %125

; <label>:123                                     ; preds = %120
  %124 = xor i32 %121, %3
  br label %126

; <label>:125                                     ; preds = %120
  br label %126

; <label>:126                                     ; preds = %125, %123
  %injection17 = phi i32 [ %124, %123 ], [ %121, %125 ]
  %127 = icmp slt i32 %injection17, 93
  %128 = icmp eq i64 55284608, %1
  br i1 %128, label %129, label %131

; <label>:129                                     ; preds = %126
  %130 = xor i1 %127, %9
  br label %132

; <label>:131                                     ; preds = %126
  br label %132

; <label>:132                                     ; preds = %131, %129
  %injection18 = phi i1 [ %130, %129 ], [ %127, %131 ]
  br i1 %injection18, label %133, label %642

; <label>:133                                     ; preds = %132
  store i32 0, i32* %injection6, align 4
  br label %134

; <label>:134                                     ; preds = %627, %133
  %135 = load i32* %injection6, align 4
  %136 = icmp eq i64 55285528, %1
  br i1 %136, label %137, label %139

; <label>:137                                     ; preds = %134
  %138 = xor i32 %135, %3
  br label %140

; <label>:139                                     ; preds = %134
  br label %140

; <label>:140                                     ; preds = %139, %137
  %injection19 = phi i32 [ %138, %137 ], [ %135, %139 ]
  %141 = icmp slt i32 %injection19, 93
  %142 = icmp eq i64 55285664, %1
  br i1 %142, label %143, label %145

; <label>:143                                     ; preds = %140
  %144 = xor i1 %141, %9
  br label %146

; <label>:145                                     ; preds = %140
  br label %146

; <label>:146                                     ; preds = %145, %143
  %injection20 = phi i1 [ %144, %143 ], [ %141, %145 ]
  br i1 %injection20, label %147, label %628

; <label>:147                                     ; preds = %146
  %148 = load i32* %injection3, align 4
  %149 = icmp eq i64 55285784, %1
  br i1 %149, label %150, label %152

; <label>:150                                     ; preds = %147
  %151 = xor i32 %148, %3
  br label %153

; <label>:152                                     ; preds = %147
  br label %153

; <label>:153                                     ; preds = %152, %150
  %injection21 = phi i32 [ %151, %150 ], [ %148, %152 ]
  %154 = sub nsw i32 %injection21, 32
  %155 = icmp eq i64 55286368, %1
  br i1 %155, label %156, label %158

; <label>:156                                     ; preds = %153
  %157 = xor i32 %154, %3
  br label %159

; <label>:158                                     ; preds = %153
  br label %159

; <label>:159                                     ; preds = %158, %156
  %injection22 = phi i32 [ %157, %156 ], [ %154, %158 ]
  %160 = load i32* %injection5, align 4
  %161 = icmp eq i64 55286488, %1
  br i1 %161, label %162, label %164

; <label>:162                                     ; preds = %159
  %163 = xor i32 %160, %3
  br label %165

; <label>:164                                     ; preds = %159
  br label %165

; <label>:165                                     ; preds = %164, %162
  %injection23 = phi i32 [ %163, %162 ], [ %160, %164 ]
  %166 = add nsw i32 %injection22, %injection23
  %167 = icmp eq i64 55286624, %1
  br i1 %167, label %168, label %170

; <label>:168                                     ; preds = %165
  %169 = xor i32 %166, %3
  br label %171

; <label>:170                                     ; preds = %165
  br label %171

; <label>:171                                     ; preds = %170, %168
  %injection24 = phi i32 [ %169, %168 ], [ %166, %170 ]
  %172 = icmp sge i32 %injection24, 0
  %173 = icmp eq i64 55286768, %1
  br i1 %173, label %174, label %176

; <label>:174                                     ; preds = %171
  %175 = xor i1 %172, %9
  br label %177

; <label>:176                                     ; preds = %171
  br label %177

; <label>:177                                     ; preds = %176, %174
  %injection25 = phi i1 [ %175, %174 ], [ %172, %176 ]
  br i1 %injection25, label %178, label %614

; <label>:178                                     ; preds = %177
  %179 = load i32* %injection3, align 4
  %180 = icmp eq i64 55286888, %1
  br i1 %180, label %181, label %183

; <label>:181                                     ; preds = %178
  %182 = xor i32 %179, %3
  br label %184

; <label>:183                                     ; preds = %178
  br label %184

; <label>:184                                     ; preds = %183, %181
  %injection26 = phi i32 [ %182, %181 ], [ %179, %183 ]
  %185 = sub nsw i32 %injection26, 32
  %186 = icmp eq i64 55287184, %1
  br i1 %186, label %187, label %189

; <label>:187                                     ; preds = %184
  %188 = xor i32 %185, %3
  br label %190

; <label>:189                                     ; preds = %184
  br label %190

; <label>:190                                     ; preds = %189, %187
  %injection27 = phi i32 [ %188, %187 ], [ %185, %189 ]
  %191 = load i32* %injection5, align 4
  %192 = icmp eq i64 55287304, %1
  br i1 %192, label %193, label %195

; <label>:193                                     ; preds = %190
  %194 = xor i32 %191, %3
  br label %196

; <label>:195                                     ; preds = %190
  br label %196

; <label>:196                                     ; preds = %195, %193
  %injection28 = phi i32 [ %194, %193 ], [ %191, %195 ]
  %197 = add nsw i32 %injection27, %injection28
  %198 = icmp eq i64 55287440, %1
  br i1 %198, label %199, label %201

; <label>:199                                     ; preds = %196
  %200 = xor i32 %197, %3
  br label %202

; <label>:201                                     ; preds = %196
  br label %202

; <label>:202                                     ; preds = %201, %199
  %injection29 = phi i32 [ %200, %199 ], [ %197, %201 ]
  %203 = icmp slt i32 %injection29, 236
  %204 = icmp eq i64 55287664, %1
  br i1 %204, label %205, label %207

; <label>:205                                     ; preds = %202
  %206 = xor i1 %203, %9
  br label %208

; <label>:207                                     ; preds = %202
  br label %208

; <label>:208                                     ; preds = %207, %205
  %injection30 = phi i1 [ %206, %205 ], [ %203, %207 ]
  br i1 %injection30, label %209, label %614

; <label>:209                                     ; preds = %208
  %210 = load i32* %injection4, align 4
  %211 = icmp eq i64 55287784, %1
  br i1 %211, label %212, label %214

; <label>:212                                     ; preds = %209
  %213 = xor i32 %210, %3
  br label %215

; <label>:214                                     ; preds = %209
  br label %215

; <label>:215                                     ; preds = %214, %212
  %injection31 = phi i32 [ %213, %212 ], [ %210, %214 ]
  %216 = sub nsw i32 %injection31, 32
  %217 = icmp eq i64 55288368, %1
  br i1 %217, label %218, label %220

; <label>:218                                     ; preds = %215
  %219 = xor i32 %216, %3
  br label %221

; <label>:220                                     ; preds = %215
  br label %221

; <label>:221                                     ; preds = %220, %218
  %injection32 = phi i32 [ %219, %218 ], [ %216, %220 ]
  %222 = load i32* %injection6, align 4
  %223 = icmp eq i64 55288488, %1
  br i1 %223, label %224, label %226

; <label>:224                                     ; preds = %221
  %225 = xor i32 %222, %3
  br label %227

; <label>:226                                     ; preds = %221
  br label %227

; <label>:227                                     ; preds = %226, %224
  %injection33 = phi i32 [ %225, %224 ], [ %222, %226 ]
  %228 = add nsw i32 %injection32, %injection33
  %229 = icmp eq i64 55288624, %1
  br i1 %229, label %230, label %232

; <label>:230                                     ; preds = %227
  %231 = xor i32 %228, %3
  br label %233

; <label>:232                                     ; preds = %227
  br label %233

; <label>:233                                     ; preds = %232, %230
  %injection34 = phi i32 [ %231, %230 ], [ %228, %232 ]
  %234 = icmp sge i32 %injection34, 0
  %235 = icmp eq i64 55288768, %1
  br i1 %235, label %236, label %238

; <label>:236                                     ; preds = %233
  %237 = xor i1 %234, %9
  br label %239

; <label>:238                                     ; preds = %233
  br label %239

; <label>:239                                     ; preds = %238, %236
  %injection35 = phi i1 [ %237, %236 ], [ %234, %238 ]
  br i1 %injection35, label %240, label %613

; <label>:240                                     ; preds = %239
  %241 = load i32* %injection4, align 4
  %242 = icmp eq i64 55288888, %1
  br i1 %242, label %243, label %245

; <label>:243                                     ; preds = %240
  %244 = xor i32 %241, %3
  br label %246

; <label>:245                                     ; preds = %240
  br label %246

; <label>:246                                     ; preds = %245, %243
  %injection36 = phi i32 [ %244, %243 ], [ %241, %245 ]
  %247 = sub nsw i32 %injection36, 32
  %248 = icmp eq i64 55289184, %1
  br i1 %248, label %249, label %251

; <label>:249                                     ; preds = %246
  %250 = xor i32 %247, %3
  br label %252

; <label>:251                                     ; preds = %246
  br label %252

; <label>:252                                     ; preds = %251, %249
  %injection37 = phi i32 [ %250, %249 ], [ %247, %251 ]
  %253 = load i32* %injection6, align 4
  %254 = icmp eq i64 55289304, %1
  br i1 %254, label %255, label %257

; <label>:255                                     ; preds = %252
  %256 = xor i32 %253, %3
  br label %258

; <label>:257                                     ; preds = %252
  br label %258

; <label>:258                                     ; preds = %257, %255
  %injection38 = phi i32 [ %256, %255 ], [ %253, %257 ]
  %259 = add nsw i32 %injection37, %injection38
  %260 = icmp eq i64 55289440, %1
  br i1 %260, label %261, label %263

; <label>:261                                     ; preds = %258
  %262 = xor i32 %259, %3
  br label %264

; <label>:263                                     ; preds = %258
  br label %264

; <label>:264                                     ; preds = %263, %261
  %injection39 = phi i32 [ %262, %261 ], [ %259, %263 ]
  %265 = icmp slt i32 %injection39, 412
  %266 = icmp eq i64 55289664, %1
  br i1 %266, label %267, label %269

; <label>:267                                     ; preds = %264
  %268 = xor i1 %265, %9
  br label %270

; <label>:269                                     ; preds = %264
  br label %270

; <label>:270                                     ; preds = %269, %267
  %injection40 = phi i1 [ %268, %267 ], [ %265, %269 ]
  br i1 %injection40, label %271, label %613

; <label>:271                                     ; preds = %270
  store i32 0, i32* %injection9, align 4
  store i32 0, i32* %injection7, align 4
  br label %272

; <label>:272                                     ; preds = %561, %271
  %273 = load i32* %injection7, align 4
  %274 = icmp eq i64 55291000, %1
  br i1 %274, label %275, label %277

; <label>:275                                     ; preds = %272
  %276 = xor i32 %273, %3
  br label %278

; <label>:277                                     ; preds = %272
  br label %278

; <label>:278                                     ; preds = %277, %275
  %injection41 = phi i32 [ %276, %275 ], [ %273, %277 ]
  %279 = icmp slt i32 %injection41, 4
  %280 = icmp eq i64 55291136, %1
  br i1 %280, label %281, label %283

; <label>:281                                     ; preds = %278
  %282 = xor i1 %279, %9
  br label %284

; <label>:283                                     ; preds = %278
  br label %284

; <label>:284                                     ; preds = %283, %281
  %injection42 = phi i1 [ %282, %281 ], [ %279, %283 ]
  br i1 %injection42, label %285, label %562

; <label>:285                                     ; preds = %284
  store i32 0, i32* %injection8, align 4
  br label %286

; <label>:286                                     ; preds = %547, %285
  %287 = load i32* %injection8, align 4
  %288 = icmp eq i64 55292056, %1
  br i1 %288, label %289, label %291

; <label>:289                                     ; preds = %286
  %290 = xor i32 %287, %3
  br label %292

; <label>:291                                     ; preds = %286
  br label %292

; <label>:292                                     ; preds = %291, %289
  %injection43 = phi i32 [ %290, %289 ], [ %287, %291 ]
  %293 = icmp slt i32 %injection43, 4
  %294 = icmp eq i64 55292192, %1
  br i1 %294, label %295, label %297

; <label>:295                                     ; preds = %292
  %296 = xor i1 %293, %9
  br label %298

; <label>:297                                     ; preds = %292
  br label %298

; <label>:298                                     ; preds = %297, %295
  %injection44 = phi i1 [ %296, %295 ], [ %293, %297 ]
  br i1 %injection44, label %299, label %548

; <label>:299                                     ; preds = %298
  %300 = load i32* %injection4, align 4
  %301 = icmp eq i64 55292312, %1
  br i1 %301, label %302, label %304

; <label>:302                                     ; preds = %299
  %303 = xor i32 %300, %3
  br label %305

; <label>:304                                     ; preds = %299
  br label %305

; <label>:305                                     ; preds = %304, %302
  %injection45 = phi i32 [ %303, %302 ], [ %300, %304 ]
  %306 = load i32* %injection8, align 4
  %307 = icmp eq i64 55292584, %1
  br i1 %307, label %308, label %310

; <label>:308                                     ; preds = %305
  %309 = xor i32 %306, %3
  br label %311

; <label>:310                                     ; preds = %305
  br label %311

; <label>:311                                     ; preds = %310, %308
  %injection46 = phi i32 [ %309, %308 ], [ %306, %310 ]
  %312 = add nsw i32 %injection45, %injection46
  %313 = icmp eq i64 55292720, %1
  br i1 %313, label %314, label %316

; <label>:314                                     ; preds = %311
  %315 = xor i32 %312, %3
  br label %317

; <label>:316                                     ; preds = %311
  br label %317

; <label>:317                                     ; preds = %316, %314
  %injection47 = phi i32 [ %315, %314 ], [ %312, %316 ]
  %318 = sext i32 %injection47 to i64
  %319 = icmp eq i64 55292840, %1
  br i1 %319, label %320, label %322

; <label>:320                                     ; preds = %317
  %321 = xor i64 %318, %2
  br label %323

; <label>:322                                     ; preds = %317
  br label %323

; <label>:323                                     ; preds = %322, %320
  %injection48 = phi i64 [ %321, %320 ], [ %318, %322 ]
  %324 = load i32* %injection3, align 4
  %325 = icmp eq i64 55292952, %1
  br i1 %325, label %326, label %328

; <label>:326                                     ; preds = %323
  %327 = xor i32 %324, %3
  br label %329

; <label>:328                                     ; preds = %323
  br label %329

; <label>:329                                     ; preds = %328, %326
  %injection49 = phi i32 [ %327, %326 ], [ %324, %328 ]
  %330 = load i32* %injection7, align 4
  %331 = icmp eq i64 55293064, %1
  br i1 %331, label %332, label %334

; <label>:332                                     ; preds = %329
  %333 = xor i32 %330, %3
  br label %335

; <label>:334                                     ; preds = %329
  br label %335

; <label>:335                                     ; preds = %334, %332
  %injection50 = phi i32 [ %333, %332 ], [ %330, %334 ]
  %336 = add nsw i32 %injection49, %injection50
  %337 = icmp eq i64 55293200, %1
  br i1 %337, label %338, label %340

; <label>:338                                     ; preds = %335
  %339 = xor i32 %336, %3
  br label %341

; <label>:340                                     ; preds = %335
  br label %341

; <label>:341                                     ; preds = %340, %338
  %injection51 = phi i32 [ %339, %338 ], [ %336, %340 ]
  %342 = sext i32 %injection51 to i64
  %343 = icmp eq i64 55293320, %1
  br i1 %343, label %344, label %346

; <label>:344                                     ; preds = %341
  %345 = xor i64 %342, %2
  br label %347

; <label>:346                                     ; preds = %341
  br label %347

; <label>:347                                     ; preds = %346, %344
  %injection52 = phi i64 [ %345, %344 ], [ %342, %346 ]
  %348 = getelementptr inbounds [240 x [416 x i8]]* @current_frame, i32 0, i64 %injection52
  %349 = icmp eq i64 55295304, %1
  br i1 %349, label %350, label %354

; <label>:350                                     ; preds = %347
  %351 = ptrtoint [416 x i8]* %348 to i64
  %352 = xor i64 %351, %2
  %353 = inttoptr i64 %352 to [416 x i8]*
  br label %355

; <label>:354                                     ; preds = %347
  br label %355

; <label>:355                                     ; preds = %354, %350
  %injection53 = phi [416 x i8]* [ %353, %350 ], [ %348, %354 ]
  %356 = getelementptr inbounds [416 x i8]* %injection53, i32 0, i64 %injection48
  %357 = icmp eq i64 55295464, %1
  br i1 %357, label %358, label %362

; <label>:358                                     ; preds = %355
  %359 = ptrtoint i8* %356 to i64
  %360 = xor i64 %359, %2
  %361 = inttoptr i64 %360 to i8*
  br label %363

; <label>:362                                     ; preds = %355
  br label %363

; <label>:363                                     ; preds = %362, %358
  %injection54 = phi i8* [ %361, %358 ], [ %356, %362 ]
  %364 = load i8* %injection54, align 1
  %365 = zext i8 %364 to i32
  %366 = icmp eq i64 55295688, %1
  br i1 %366, label %367, label %369

; <label>:367                                     ; preds = %363
  %368 = xor i32 %365, %3
  br label %370

; <label>:369                                     ; preds = %363
  br label %370

; <label>:370                                     ; preds = %369, %367
  %injection55 = phi i32 [ %368, %367 ], [ %365, %369 ]
  %371 = load i32* %injection4, align 4
  %372 = icmp eq i64 55295800, %1
  br i1 %372, label %373, label %375

; <label>:373                                     ; preds = %370
  %374 = xor i32 %371, %3
  br label %376

; <label>:375                                     ; preds = %370
  br label %376

; <label>:376                                     ; preds = %375, %373
  %injection56 = phi i32 [ %374, %373 ], [ %371, %375 ]
  %377 = sub nsw i32 %injection56, 32
  %378 = icmp eq i64 55295936, %1
  br i1 %378, label %379, label %381

; <label>:379                                     ; preds = %376
  %380 = xor i32 %377, %3
  br label %382

; <label>:381                                     ; preds = %376
  br label %382

; <label>:382                                     ; preds = %381, %379
  %injection57 = phi i32 [ %380, %379 ], [ %377, %381 ]
  %383 = load i32* %injection6, align 4
  %384 = icmp eq i64 55296056, %1
  br i1 %384, label %385, label %387

; <label>:385                                     ; preds = %382
  %386 = xor i32 %383, %3
  br label %388

; <label>:387                                     ; preds = %382
  br label %388

; <label>:388                                     ; preds = %387, %385
  %injection58 = phi i32 [ %386, %385 ], [ %383, %387 ]
  %389 = add nsw i32 %injection57, %injection58
  %390 = icmp eq i64 55296192, %1
  br i1 %390, label %391, label %393

; <label>:391                                     ; preds = %388
  %392 = xor i32 %389, %3
  br label %394

; <label>:393                                     ; preds = %388
  br label %394

; <label>:394                                     ; preds = %393, %391
  %injection59 = phi i32 [ %392, %391 ], [ %389, %393 ]
  %395 = load i32* %injection8, align 4
  %396 = icmp eq i64 55296312, %1
  br i1 %396, label %397, label %399

; <label>:397                                     ; preds = %394
  %398 = xor i32 %395, %3
  br label %400

; <label>:399                                     ; preds = %394
  br label %400

; <label>:400                                     ; preds = %399, %397
  %injection60 = phi i32 [ %398, %397 ], [ %395, %399 ]
  %401 = add nsw i32 %injection59, %injection60
  %402 = icmp eq i64 55296448, %1
  br i1 %402, label %403, label %405

; <label>:403                                     ; preds = %400
  %404 = xor i32 %401, %3
  br label %406

; <label>:405                                     ; preds = %400
  br label %406

; <label>:406                                     ; preds = %405, %403
  %injection61 = phi i32 [ %404, %403 ], [ %401, %405 ]
  %407 = sext i32 %injection61 to i64
  %408 = icmp eq i64 55296568, %1
  br i1 %408, label %409, label %411

; <label>:409                                     ; preds = %406
  %410 = xor i64 %407, %2
  br label %412

; <label>:411                                     ; preds = %406
  br label %412

; <label>:412                                     ; preds = %411, %409
  %injection62 = phi i64 [ %410, %409 ], [ %407, %411 ]
  %413 = load i32* %injection3, align 4
  %414 = icmp eq i64 55296680, %1
  br i1 %414, label %415, label %417

; <label>:415                                     ; preds = %412
  %416 = xor i32 %413, %3
  br label %418

; <label>:417                                     ; preds = %412
  br label %418

; <label>:418                                     ; preds = %417, %415
  %injection63 = phi i32 [ %416, %415 ], [ %413, %417 ]
  %419 = sub nsw i32 %injection63, 32
  %420 = icmp eq i64 55296816, %1
  br i1 %420, label %421, label %423

; <label>:421                                     ; preds = %418
  %422 = xor i32 %419, %3
  br label %424

; <label>:423                                     ; preds = %418
  br label %424

; <label>:424                                     ; preds = %423, %421
  %injection64 = phi i32 [ %422, %421 ], [ %419, %423 ]
  %425 = load i32* %injection5, align 4
  %426 = icmp eq i64 55296936, %1
  br i1 %426, label %427, label %429

; <label>:427                                     ; preds = %424
  %428 = xor i32 %425, %3
  br label %430

; <label>:429                                     ; preds = %424
  br label %430

; <label>:430                                     ; preds = %429, %427
  %injection65 = phi i32 [ %428, %427 ], [ %425, %429 ]
  %431 = add nsw i32 %injection64, %injection65
  %432 = icmp eq i64 55297072, %1
  br i1 %432, label %433, label %435

; <label>:433                                     ; preds = %430
  %434 = xor i32 %431, %3
  br label %436

; <label>:435                                     ; preds = %430
  br label %436

; <label>:436                                     ; preds = %435, %433
  %injection66 = phi i32 [ %434, %433 ], [ %431, %435 ]
  %437 = load i32* %injection7, align 4
  %438 = icmp eq i64 55297192, %1
  br i1 %438, label %439, label %441

; <label>:439                                     ; preds = %436
  %440 = xor i32 %437, %3
  br label %442

; <label>:441                                     ; preds = %436
  br label %442

; <label>:442                                     ; preds = %441, %439
  %injection67 = phi i32 [ %440, %439 ], [ %437, %441 ]
  %443 = add nsw i32 %injection66, %injection67
  %444 = icmp eq i64 55297328, %1
  br i1 %444, label %445, label %447

; <label>:445                                     ; preds = %442
  %446 = xor i32 %443, %3
  br label %448

; <label>:447                                     ; preds = %442
  br label %448

; <label>:448                                     ; preds = %447, %445
  %injection68 = phi i32 [ %446, %445 ], [ %443, %447 ]
  %449 = sext i32 %injection68 to i64
  %450 = icmp eq i64 55297448, %1
  br i1 %450, label %451, label %453

; <label>:451                                     ; preds = %448
  %452 = xor i64 %449, %2
  br label %454

; <label>:453                                     ; preds = %448
  br label %454

; <label>:454                                     ; preds = %453, %451
  %injection69 = phi i64 [ %452, %451 ], [ %449, %453 ]
  %455 = getelementptr inbounds [240 x [416 x i8]]* @reference_frame, i32 0, i64 %injection69
  %456 = icmp eq i64 55297928, %1
  br i1 %456, label %457, label %461

; <label>:457                                     ; preds = %454
  %458 = ptrtoint [416 x i8]* %455 to i64
  %459 = xor i64 %458, %2
  %460 = inttoptr i64 %459 to [416 x i8]*
  br label %462

; <label>:461                                     ; preds = %454
  br label %462

; <label>:462                                     ; preds = %461, %457
  %injection70 = phi [416 x i8]* [ %460, %457 ], [ %455, %461 ]
  %463 = getelementptr inbounds [416 x i8]* %injection70, i32 0, i64 %injection62
  %464 = icmp eq i64 55298088, %1
  br i1 %464, label %465, label %469

; <label>:465                                     ; preds = %462
  %466 = ptrtoint i8* %463 to i64
  %467 = xor i64 %466, %2
  %468 = inttoptr i64 %467 to i8*
  br label %470

; <label>:469                                     ; preds = %462
  br label %470

; <label>:470                                     ; preds = %469, %465
  %injection71 = phi i8* [ %468, %465 ], [ %463, %469 ]
  %471 = load i8* %injection71, align 1
  %472 = zext i8 %471 to i32
  %473 = icmp eq i64 55298312, %1
  br i1 %473, label %474, label %476

; <label>:474                                     ; preds = %470
  %475 = xor i32 %472, %3
  br label %477

; <label>:476                                     ; preds = %470
  br label %477

; <label>:477                                     ; preds = %476, %474
  %injection72 = phi i32 [ %475, %474 ], [ %472, %476 ]
  %478 = sub nsw i32 %injection55, %injection72
  %479 = icmp eq i64 55298448, %1
  br i1 %479, label %480, label %482

; <label>:480                                     ; preds = %477
  %481 = xor i32 %478, %3
  br label %483

; <label>:482                                     ; preds = %477
  br label %483

; <label>:483                                     ; preds = %482, %480
  %injection73 = phi i32 [ %481, %480 ], [ %478, %482 ]
  store i32 %injection73, i32* %injection12, align 4
  %484 = load i32* %injection12, align 4
  %485 = icmp eq i64 55299000, %1
  br i1 %485, label %486, label %488

; <label>:486                                     ; preds = %483
  %487 = xor i32 %484, %3
  br label %489

; <label>:488                                     ; preds = %483
  br label %489

; <label>:489                                     ; preds = %488, %486
  %injection74 = phi i32 [ %487, %486 ], [ %484, %488 ]
  %490 = icmp slt i32 %injection74, 0
  %491 = icmp eq i64 55299136, %1
  br i1 %491, label %492, label %494

; <label>:492                                     ; preds = %489
  %493 = xor i1 %490, %9
  br label %495

; <label>:494                                     ; preds = %489
  br label %495

; <label>:495                                     ; preds = %494, %492
  %injection75 = phi i1 [ %493, %492 ], [ %490, %494 ]
  br i1 %injection75, label %496, label %515

; <label>:496                                     ; preds = %495
  %497 = load i32* %injection12, align 4
  %498 = icmp eq i64 55299256, %1
  br i1 %498, label %499, label %501

; <label>:499                                     ; preds = %496
  %500 = xor i32 %497, %3
  br label %502

; <label>:501                                     ; preds = %496
  br label %502

; <label>:502                                     ; preds = %501, %499
  %injection76 = phi i32 [ %500, %499 ], [ %497, %501 ]
  %503 = load i32* %injection9, align 4
  %504 = icmp eq i64 55299528, %1
  br i1 %504, label %505, label %507

; <label>:505                                     ; preds = %502
  %506 = xor i32 %503, %3
  br label %508

; <label>:507                                     ; preds = %502
  br label %508

; <label>:508                                     ; preds = %507, %505
  %injection77 = phi i32 [ %506, %505 ], [ %503, %507 ]
  %509 = sub nsw i32 %injection77, %injection76
  %510 = icmp eq i64 55299664, %1
  br i1 %510, label %511, label %513

; <label>:511                                     ; preds = %508
  %512 = xor i32 %509, %3
  br label %514

; <label>:513                                     ; preds = %508
  br label %514

; <label>:514                                     ; preds = %513, %511
  %injection78 = phi i32 [ %512, %511 ], [ %509, %513 ]
  store i32 %injection78, i32* %injection9, align 4
  br label %534

; <label>:515                                     ; preds = %495
  %516 = load i32* %injection12, align 4
  %517 = icmp eq i64 55300040, %1
  br i1 %517, label %518, label %520

; <label>:518                                     ; preds = %515
  %519 = xor i32 %516, %3
  br label %521

; <label>:520                                     ; preds = %515
  br label %521

; <label>:521                                     ; preds = %520, %518
  %injection79 = phi i32 [ %519, %518 ], [ %516, %520 ]
  %522 = load i32* %injection9, align 4
  %523 = icmp eq i64 55300152, %1
  br i1 %523, label %524, label %526

; <label>:524                                     ; preds = %521
  %525 = xor i32 %522, %3
  br label %527

; <label>:526                                     ; preds = %521
  br label %527

; <label>:527                                     ; preds = %526, %524
  %injection80 = phi i32 [ %525, %524 ], [ %522, %526 ]
  %528 = add nsw i32 %injection80, %injection79
  %529 = icmp eq i64 55300288, %1
  br i1 %529, label %530, label %532

; <label>:530                                     ; preds = %527
  %531 = xor i32 %528, %3
  br label %533

; <label>:532                                     ; preds = %527
  br label %533

; <label>:533                                     ; preds = %532, %530
  %injection81 = phi i32 [ %531, %530 ], [ %528, %532 ]
  store i32 %injection81, i32* %injection9, align 4
  br label %534

; <label>:534                                     ; preds = %533, %514
  br label %535

; <label>:535                                     ; preds = %534
  %536 = load i32* %injection8, align 4
  %537 = icmp eq i64 55300776, %1
  br i1 %537, label %538, label %540

; <label>:538                                     ; preds = %535
  %539 = xor i32 %536, %3
  br label %541

; <label>:540                                     ; preds = %535
  br label %541

; <label>:541                                     ; preds = %540, %538
  %injection82 = phi i32 [ %539, %538 ], [ %536, %540 ]
  %542 = add nsw i32 %injection82, 1
  %543 = icmp eq i64 55300912, %1
  br i1 %543, label %544, label %546

; <label>:544                                     ; preds = %541
  %545 = xor i32 %542, %3
  br label %547

; <label>:546                                     ; preds = %541
  br label %547

; <label>:547                                     ; preds = %546, %544
  %injection83 = phi i32 [ %545, %544 ], [ %542, %546 ]
  store i32 %injection83, i32* %injection8, align 4
  br label %286

; <label>:548                                     ; preds = %298
  br label %549

; <label>:549                                     ; preds = %548
  %550 = load i32* %injection7, align 4
  %551 = icmp eq i64 55301400, %1
  br i1 %551, label %552, label %554

; <label>:552                                     ; preds = %549
  %553 = xor i32 %550, %3
  br label %555

; <label>:554                                     ; preds = %549
  br label %555

; <label>:555                                     ; preds = %554, %552
  %injection84 = phi i32 [ %553, %552 ], [ %550, %554 ]
  %556 = add nsw i32 %injection84, 1
  %557 = icmp eq i64 55301536, %1
  br i1 %557, label %558, label %560

; <label>:558                                     ; preds = %555
  %559 = xor i32 %556, %3
  br label %561

; <label>:560                                     ; preds = %555
  br label %561

; <label>:561                                     ; preds = %560, %558
  %injection85 = phi i32 [ %559, %558 ], [ %556, %560 ]
  store i32 %injection85, i32* %injection7, align 4
  br label %272

; <label>:562                                     ; preds = %284
  %563 = load i32* %injection9, align 4
  %564 = icmp eq i64 55302104, %1
  br i1 %564, label %565, label %567

; <label>:565                                     ; preds = %562
  %566 = xor i32 %563, %3
  br label %568

; <label>:567                                     ; preds = %562
  br label %568

; <label>:568                                     ; preds = %567, %565
  %injection86 = phi i32 [ %566, %565 ], [ %563, %567 ]
  %569 = load i32* %injection2, align 4
  %570 = icmp eq i64 55302216, %1
  br i1 %570, label %571, label %573

; <label>:571                                     ; preds = %568
  %572 = xor i32 %569, %3
  br label %574

; <label>:573                                     ; preds = %568
  br label %574

; <label>:574                                     ; preds = %573, %571
  %injection87 = phi i32 [ %572, %571 ], [ %569, %573 ]
  %575 = icmp slt i32 %injection86, %injection87
  %576 = icmp eq i64 55302352, %1
  br i1 %576, label %577, label %579

; <label>:577                                     ; preds = %574
  %578 = xor i1 %575, %9
  br label %580

; <label>:579                                     ; preds = %574
  br label %580

; <label>:580                                     ; preds = %579, %577
  %injection88 = phi i1 [ %578, %577 ], [ %575, %579 ]
  br i1 %injection88, label %581, label %612

; <label>:581                                     ; preds = %580
  %582 = load i32* %injection9, align 4
  %583 = icmp eq i64 55302472, %1
  br i1 %583, label %584, label %586

; <label>:584                                     ; preds = %581
  %585 = xor i32 %582, %3
  br label %587

; <label>:586                                     ; preds = %581
  br label %587

; <label>:587                                     ; preds = %586, %584
  %injection89 = phi i32 [ %585, %584 ], [ %582, %586 ]
  store i32 %injection89, i32* %injection2, align 4
  %588 = load i32* %injection5, align 4
  %589 = icmp eq i64 55302888, %1
  br i1 %589, label %590, label %592

; <label>:590                                     ; preds = %587
  %591 = xor i32 %588, %3
  br label %593

; <label>:592                                     ; preds = %587
  br label %593

; <label>:593                                     ; preds = %592, %590
  %injection90 = phi i32 [ %591, %590 ], [ %588, %592 ]
  %594 = sub nsw i32 %injection90, 32
  %595 = icmp eq i64 55303024, %1
  br i1 %595, label %596, label %598

; <label>:596                                     ; preds = %593
  %597 = xor i32 %594, %3
  br label %599

; <label>:598                                     ; preds = %593
  br label %599

; <label>:599                                     ; preds = %598, %596
  %injection91 = phi i32 [ %597, %596 ], [ %594, %598 ]
  store i32 %injection91, i32* %injection10, align 4
  %600 = load i32* %injection6, align 4
  %601 = icmp eq i64 55303288, %1
  br i1 %601, label %602, label %604

; <label>:602                                     ; preds = %599
  %603 = xor i32 %600, %3
  br label %605

; <label>:604                                     ; preds = %599
  br label %605

; <label>:605                                     ; preds = %604, %602
  %injection92 = phi i32 [ %603, %602 ], [ %600, %604 ]
  %606 = sub nsw i32 %injection92, 32
  %607 = icmp eq i64 55303424, %1
  br i1 %607, label %608, label %610

; <label>:608                                     ; preds = %605
  %609 = xor i32 %606, %3
  br label %611

; <label>:610                                     ; preds = %605
  br label %611

; <label>:611                                     ; preds = %610, %608
  %injection93 = phi i32 [ %609, %608 ], [ %606, %610 ]
  store i32 %injection93, i32* %injection11, align 4
  br label %612

; <label>:612                                     ; preds = %611, %580
  br label %613

; <label>:613                                     ; preds = %612, %270, %239
  br label %614

; <label>:614                                     ; preds = %613, %208, %177
  br label %615

; <label>:615                                     ; preds = %614
  %616 = load i32* %injection6, align 4
  %617 = icmp eq i64 55304136, %1
  br i1 %617, label %618, label %620

; <label>:618                                     ; preds = %615
  %619 = xor i32 %616, %3
  br label %621

; <label>:620                                     ; preds = %615
  br label %621

; <label>:621                                     ; preds = %620, %618
  %injection94 = phi i32 [ %619, %618 ], [ %616, %620 ]
  %622 = add nsw i32 %injection94, 1
  %623 = icmp eq i64 55304272, %1
  br i1 %623, label %624, label %626

; <label>:624                                     ; preds = %621
  %625 = xor i32 %622, %3
  br label %627

; <label>:626                                     ; preds = %621
  br label %627

; <label>:627                                     ; preds = %626, %624
  %injection95 = phi i32 [ %625, %624 ], [ %622, %626 ]
  store i32 %injection95, i32* %injection6, align 4
  br label %134

; <label>:628                                     ; preds = %146
  br label %629

; <label>:629                                     ; preds = %628
  %630 = load i32* %injection5, align 4
  %631 = icmp eq i64 55304760, %1
  br i1 %631, label %632, label %634

; <label>:632                                     ; preds = %629
  %633 = xor i32 %630, %3
  br label %635

; <label>:634                                     ; preds = %629
  br label %635

; <label>:635                                     ; preds = %634, %632
  %injection96 = phi i32 [ %633, %632 ], [ %630, %634 ]
  %636 = add nsw i32 %injection96, 1
  %637 = icmp eq i64 55304896, %1
  br i1 %637, label %638, label %640

; <label>:638                                     ; preds = %635
  %639 = xor i32 %636, %3
  br label %641

; <label>:640                                     ; preds = %635
  br label %641

; <label>:641                                     ; preds = %640, %638
  %injection97 = phi i32 [ %639, %638 ], [ %636, %640 ]
  store i32 %injection97, i32* %injection5, align 4
  br label %120

; <label>:642                                     ; preds = %132
  %643 = load i32* %injection10, align 4
  %644 = icmp eq i64 55305272, %1
  br i1 %644, label %645, label %647

; <label>:645                                     ; preds = %642
  %646 = xor i32 %643, %3
  br label %648

; <label>:647                                     ; preds = %642
  br label %648

; <label>:648                                     ; preds = %647, %645
  %injection98 = phi i32 [ %646, %645 ], [ %643, %647 ]
  %649 = load i32* %injection4, align 4
  %650 = icmp eq i64 55305464, %1
  br i1 %650, label %651, label %653

; <label>:651                                     ; preds = %648
  %652 = xor i32 %649, %3
  br label %654

; <label>:653                                     ; preds = %648
  br label %654

; <label>:654                                     ; preds = %653, %651
  %injection99 = phi i32 [ %652, %651 ], [ %649, %653 ]
  %655 = sdiv i32 %injection99, 4
  %656 = icmp eq i64 55305600, %1
  br i1 %656, label %657, label %659

; <label>:657                                     ; preds = %654
  %658 = xor i32 %655, %3
  br label %660

; <label>:659                                     ; preds = %654
  br label %660

; <label>:660                                     ; preds = %659, %657
  %injection100 = phi i32 [ %658, %657 ], [ %655, %659 ]
  %661 = sext i32 %injection100 to i64
  %662 = icmp eq i64 55305720, %1
  br i1 %662, label %663, label %665

; <label>:663                                     ; preds = %660
  %664 = xor i64 %661, %2
  br label %666

; <label>:665                                     ; preds = %660
  br label %666

; <label>:666                                     ; preds = %665, %663
  %injection101 = phi i64 [ %664, %663 ], [ %661, %665 ]
  %667 = load i32* %injection3, align 4
  %668 = icmp eq i64 55305832, %1
  br i1 %668, label %669, label %671

; <label>:669                                     ; preds = %666
  %670 = xor i32 %667, %3
  br label %672

; <label>:671                                     ; preds = %666
  br label %672

; <label>:672                                     ; preds = %671, %669
  %injection102 = phi i32 [ %670, %669 ], [ %667, %671 ]
  %673 = sdiv i32 %injection102, 4
  %674 = icmp eq i64 55305968, %1
  br i1 %674, label %675, label %677

; <label>:675                                     ; preds = %672
  %676 = xor i32 %673, %3
  br label %678

; <label>:677                                     ; preds = %672
  br label %678

; <label>:678                                     ; preds = %677, %675
  %injection103 = phi i32 [ %676, %675 ], [ %673, %677 ]
  %679 = sext i32 %injection103 to i64
  %680 = icmp eq i64 55306088, %1
  br i1 %680, label %681, label %683

; <label>:681                                     ; preds = %678
  %682 = xor i64 %679, %2
  br label %684

; <label>:683                                     ; preds = %678
  br label %684

; <label>:684                                     ; preds = %683, %681
  %injection104 = phi i64 [ %682, %681 ], [ %679, %683 ]
  %685 = getelementptr inbounds [60 x [104 x [2 x i32]]]* @motion_vectors, i32 0, i64 %injection104
  %686 = icmp eq i64 55306456, %1
  br i1 %686, label %687, label %691

; <label>:687                                     ; preds = %684
  %688 = ptrtoint [104 x [2 x i32]]* %685 to i64
  %689 = xor i64 %688, %2
  %690 = inttoptr i64 %689 to [104 x [2 x i32]]*
  br label %692

; <label>:691                                     ; preds = %684
  br label %692

; <label>:692                                     ; preds = %691, %687
  %injection105 = phi [104 x [2 x i32]]* [ %690, %687 ], [ %685, %691 ]
  %693 = getelementptr inbounds [104 x [2 x i32]]* %injection105, i32 0, i64 %injection101
  %694 = icmp eq i64 55306616, %1
  br i1 %694, label %695, label %699

; <label>:695                                     ; preds = %692
  %696 = ptrtoint [2 x i32]* %693 to i64
  %697 = xor i64 %696, %2
  %698 = inttoptr i64 %697 to [2 x i32]*
  br label %700

; <label>:699                                     ; preds = %692
  br label %700

; <label>:700                                     ; preds = %699, %695
  %injection106 = phi [2 x i32]* [ %698, %695 ], [ %693, %699 ]
  %701 = getelementptr inbounds [2 x i32]* %injection106, i32 0, i64 0
  %702 = icmp eq i64 55306776, %1
  br i1 %702, label %703, label %707

; <label>:703                                     ; preds = %700
  %704 = ptrtoint i32* %701 to i64
  %705 = xor i64 %704, %2
  %706 = inttoptr i64 %705 to i32*
  br label %708

; <label>:707                                     ; preds = %700
  br label %708

; <label>:708                                     ; preds = %707, %703
  %injection107 = phi i32* [ %706, %703 ], [ %701, %707 ]
  store i32 %injection98, i32* %injection107, align 4
  %709 = load i32* %injection11, align 4
  %710 = icmp eq i64 55307032, %1
  br i1 %710, label %711, label %713

; <label>:711                                     ; preds = %708
  %712 = xor i32 %709, %3
  br label %714

; <label>:713                                     ; preds = %708
  br label %714

; <label>:714                                     ; preds = %713, %711
  %injection108 = phi i32 [ %712, %711 ], [ %709, %713 ]
  %715 = load i32* %injection4, align 4
  %716 = icmp eq i64 55307224, %1
  br i1 %716, label %717, label %719

; <label>:717                                     ; preds = %714
  %718 = xor i32 %715, %3
  br label %720

; <label>:719                                     ; preds = %714
  br label %720

; <label>:720                                     ; preds = %719, %717
  %injection109 = phi i32 [ %718, %717 ], [ %715, %719 ]
  %721 = sdiv i32 %injection109, 4
  %722 = icmp eq i64 55307360, %1
  br i1 %722, label %723, label %725

; <label>:723                                     ; preds = %720
  %724 = xor i32 %721, %3
  br label %726

; <label>:725                                     ; preds = %720
  br label %726

; <label>:726                                     ; preds = %725, %723
  %injection110 = phi i32 [ %724, %723 ], [ %721, %725 ]
  %727 = sext i32 %injection110 to i64
  %728 = icmp eq i64 55307480, %1
  br i1 %728, label %729, label %731

; <label>:729                                     ; preds = %726
  %730 = xor i64 %727, %2
  br label %732

; <label>:731                                     ; preds = %726
  br label %732

; <label>:732                                     ; preds = %731, %729
  %injection111 = phi i64 [ %730, %729 ], [ %727, %731 ]
  %733 = load i32* %injection3, align 4
  %734 = icmp eq i64 55307592, %1
  br i1 %734, label %735, label %737

; <label>:735                                     ; preds = %732
  %736 = xor i32 %733, %3
  br label %738

; <label>:737                                     ; preds = %732
  br label %738

; <label>:738                                     ; preds = %737, %735
  %injection112 = phi i32 [ %736, %735 ], [ %733, %737 ]
  %739 = sdiv i32 %injection112, 4
  %740 = icmp eq i64 55307728, %1
  br i1 %740, label %741, label %743

; <label>:741                                     ; preds = %738
  %742 = xor i32 %739, %3
  br label %744

; <label>:743                                     ; preds = %738
  br label %744

; <label>:744                                     ; preds = %743, %741
  %injection113 = phi i32 [ %742, %741 ], [ %739, %743 ]
  %745 = sext i32 %injection113 to i64
  %746 = icmp eq i64 55307848, %1
  br i1 %746, label %747, label %749

; <label>:747                                     ; preds = %744
  %748 = xor i64 %745, %2
  br label %750

; <label>:749                                     ; preds = %744
  br label %750

; <label>:750                                     ; preds = %749, %747
  %injection114 = phi i64 [ %748, %747 ], [ %745, %749 ]
  %751 = getelementptr inbounds [60 x [104 x [2 x i32]]]* @motion_vectors, i32 0, i64 %injection114
  %752 = icmp eq i64 55308008, %1
  br i1 %752, label %753, label %757

; <label>:753                                     ; preds = %750
  %754 = ptrtoint [104 x [2 x i32]]* %751 to i64
  %755 = xor i64 %754, %2
  %756 = inttoptr i64 %755 to [104 x [2 x i32]]*
  br label %758

; <label>:757                                     ; preds = %750
  br label %758

; <label>:758                                     ; preds = %757, %753
  %injection115 = phi [104 x [2 x i32]]* [ %756, %753 ], [ %751, %757 ]
  %759 = getelementptr inbounds [104 x [2 x i32]]* %injection115, i32 0, i64 %injection111
  %760 = icmp eq i64 55308168, %1
  br i1 %760, label %761, label %765

; <label>:761                                     ; preds = %758
  %762 = ptrtoint [2 x i32]* %759 to i64
  %763 = xor i64 %762, %2
  %764 = inttoptr i64 %763 to [2 x i32]*
  br label %766

; <label>:765                                     ; preds = %758
  br label %766

; <label>:766                                     ; preds = %765, %761
  %injection116 = phi [2 x i32]* [ %764, %761 ], [ %759, %765 ]
  %767 = getelementptr inbounds [2 x i32]* %injection116, i32 0, i64 1
  %768 = icmp eq i64 55308328, %1
  br i1 %768, label %769, label %773

; <label>:769                                     ; preds = %766
  %770 = ptrtoint i32* %767 to i64
  %771 = xor i64 %770, %2
  %772 = inttoptr i64 %771 to i32*
  br label %774

; <label>:773                                     ; preds = %766
  br label %774

; <label>:774                                     ; preds = %773, %769
  %injection117 = phi i32* [ %772, %769 ], [ %767, %773 ]
  store i32 %injection108, i32* %injection117, align 4
  br label %775

; <label>:775                                     ; preds = %774
  %776 = load i32* %injection4, align 4
  %777 = icmp eq i64 55308696, %1
  br i1 %777, label %778, label %780

; <label>:778                                     ; preds = %775
  %779 = xor i32 %776, %3
  br label %781

; <label>:780                                     ; preds = %775
  br label %781

; <label>:781                                     ; preds = %780, %778
  %injection118 = phi i32 [ %779, %778 ], [ %776, %780 ]
  %782 = add nsw i32 %injection118, 4
  %783 = icmp eq i64 55308832, %1
  br i1 %783, label %784, label %786

; <label>:784                                     ; preds = %781
  %785 = xor i32 %782, %3
  br label %787

; <label>:786                                     ; preds = %781
  br label %787

; <label>:787                                     ; preds = %786, %784
  %injection119 = phi i32 [ %785, %784 ], [ %782, %786 ]
  store i32 %injection119, i32* %injection4, align 4
  br label %106

; <label>:788                                     ; preds = %118
  br label %789

; <label>:789                                     ; preds = %788
  %790 = load i32* %injection3, align 4
  %791 = icmp eq i64 55309320, %1
  br i1 %791, label %792, label %794

; <label>:792                                     ; preds = %789
  %793 = xor i32 %790, %3
  br label %795

; <label>:794                                     ; preds = %789
  br label %795

; <label>:795                                     ; preds = %794, %792
  %injection120 = phi i32 [ %793, %792 ], [ %790, %794 ]
  %796 = add nsw i32 %injection120, 4
  %797 = icmp eq i64 55309456, %1
  br i1 %797, label %798, label %800

; <label>:798                                     ; preds = %795
  %799 = xor i32 %796, %3
  br label %801

; <label>:800                                     ; preds = %795
  br label %801

; <label>:801                                     ; preds = %800, %798
  %injection121 = phi i32 [ %799, %798 ], [ %796, %800 ]
  store i32 %injection121, i32* %injection3, align 4
  br label %92

; <label>:802                                     ; preds = %104
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i8*** %3, align 8
  %5 = getelementptr inbounds i8** %4, i64 1
  %6 = load i8** %5, align 8
  %7 = load i8*** %3, align 8
  %8 = getelementptr inbounds i8** %7, i64 2
  %9 = load i8** %8, align 8
  call void @populateInput(i32 416, i32 240, i8* getelementptr inbounds ([240 x [416 x i8]]* @reference_frame, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([240 x [416 x i8]]* @current_frame, i32 0, i32 0, i32 0), i8* %6, i8* %9)
  call void @motion_main()
  %10 = load i8*** %3, align 8
  %11 = getelementptr inbounds i8** %10, i64 3
  %12 = load i8** %11, align 8
  call void @populateOutput(i32 416, i32 240, i32 4, [2 x i32]* getelementptr inbounds ([60 x [104 x [2 x i32]]]* @motion_vectors, i32 0, i32 0, i32 0), i8* %12)
  ret i32 0
}

declare void @populateInput(i32, i32, i8*, i8*, i8*, i8*) #1

declare void @populateOutput(i32, i32, i32, [2 x i32]*, i8*) #1

declare i64 @_shouldInject()

declare i64 @_getInjectionMask()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.2-3ubuntu1 (tags/RELEASE_352/final) (based on LLVM 3.5.2)"}
