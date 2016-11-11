﻿# [Utah Teapot](https://www.wikiwand.com/en/Utah_teapot)（[ユタ･ティーポット](https://www.wikiwand.com/ja/Utah_teapot)）

We faithfully polygonize the original model by cubic Bezier surfaces (Normal, Tangent and Bi-normal vectors are computed accurately by automatic differentiation).  
３次ベジエ曲面によって、オリジナルモデルを忠実にポリゴン化する（法線/接線/従法線も自動微分により正確に算出する）。

The data posted on [The History of The Teapot - Wikiid](https://www.sjbaker.org/wiki/index.php?title=The_History_of_The_Teapot) are 9+1 Bezier surfaces omitting mirror symmetric patches and control points (The true original model has no bottom).  
[The History of The Teapot - Wikiid](https://www.sjbaker.org/wiki/index.php?title=The_History_of_The_Teapot) に掲載されているデータは、面対称なパッチと制御点を省いた 9+1 パッチのベジエ曲面である（本当のオリジナルモデルには"底"がなかった）。

Complementing the omitted Bezier surfaces will result in 32 patches (It's 28 patches as an original model), and the number of net control points avoiding duplication on shared edges is 290 points.  
省かれているベジエ曲面を補完すると 32 パッチとなり（オリジナルモデルとしては 28 パッチ）、共有エッジの重複を避けた正味の制御点は 290 点となる。

![](https://bytebucket.org/LUXOPHIA/utahteapot/raw/6be5792c5dde88e00a2b98825335c42475ac4cc5/--------/_SCREENSHOT/UtahTeapot_08%2B30.png)

![](https://bytebucket.org/LUXOPHIA/utahteapot/raw/6be5792c5dde88e00a2b98825335c42475ac4cc5/--------/_SCREENSHOT/UtahTeapot_08-30.png)

##▼ Cubic [Bézier Surface](https://www.wikiwand.com/en/B%C3%A9zier_surface)（３次[ベジエ曲面](https://www.wikiwand.com/ja/%E3%83%99%E3%82%B8%E3%82%A7%E6%9B%B2%E7%B7%9A)）× 32
```
▼ Lid（蓋）
{ (   0,   0,   0,   0 ) (   1,   2,   3,   4 ) (   5,   5,   5,   5 ) (   6,   7,   8,   9 ) }
{ (   0,   0,   0,   0 ) (  10,  11,  12,   1 ) (   5,   5,   5,   5 ) (  13,  14,  15,   6 ) }
{ (   0,   0,   0,   0 ) (   4,  16,  17,  18 ) (   5,   5,   5,   5 ) (   9,  19,  20,  21 ) }
{ (   0,   0,   0,   0 ) (  18,  22,  23,  10 ) (   5,   5,   5,   5 ) (  21,  24,  25,  13 ) }
{ (   6,   7,   8,   9 ) (  26,  27,  28,  29 ) (  30,  31,  32,  33 ) (  34,  35,  36,  37 ) }
{ (  13,  14,  15,   6 ) (  38,  39,  40,  26 ) (  41,  42,  43,  30 ) (  44,  45,  46,  34 ) }
{ (   9,  19,  20,  21 ) (  29,  47,  48,  49 ) (  33,  50,  51,  52 ) (  37,  53,  54,  55 ) }
{ (  21,  24,  25,  13 ) (  49,  56,  57,  38 ) (  52,  58,  59,  41 ) (  55,  60,  61,  44 ) }
▼ Rim（縁）
{ (  62,  63,  64,  65 ) (  66,  67,  68,  69 ) (  70,  71,  72,  73 ) (  74,  75,  76,  77 ) }
{ (  78,  79,  80,  62 ) (  81,  82,  83,  66 ) (  84,  85,  86,  70 ) (  87,  88,  89,  74 ) }
{ (  65,  90,  91,  92 ) (  69,  93,  94,  95 ) (  73,  96,  97,  98 ) (  77,  99, 100, 101 ) }
{ (  92, 102, 103,  78 ) (  95, 104, 105,  81 ) (  98, 106, 107,  84 ) ( 101, 108, 109,  87 ) }
▼ Body（胴体）
{ (  74,  75,  76,  77 ) ( 110, 111, 112, 113 ) ( 114, 115, 116, 117 ) ( 118, 119, 120, 121 ) }
{ (  87,  88,  89,  74 ) ( 122, 123, 124, 110 ) ( 125, 126, 127, 114 ) ( 128, 129, 130, 118 ) }
{ (  77,  99, 100, 101 ) ( 113, 131, 132, 133 ) ( 117, 134, 135, 136 ) ( 121, 137, 138, 139 ) }
{ ( 101, 108, 109,  87 ) ( 133, 140, 141, 122 ) ( 136, 142, 143, 125 ) ( 139, 144, 145, 128 ) }
{ ( 118, 119, 120, 121 ) ( 146, 147, 148, 149 ) ( 150, 151, 152, 153 ) ( 154, 155, 156, 157 ) }
{ ( 128, 129, 130, 118 ) ( 158, 159, 160, 146 ) ( 161, 162, 163, 150 ) ( 164, 165, 166, 154 ) }
{ ( 121, 137, 138, 139 ) ( 149, 167, 168, 169 ) ( 153, 170, 171, 172 ) ( 157, 173, 174, 175 ) }
{ ( 139, 144, 145, 128 ) ( 169, 176, 177, 158 ) ( 172, 178, 179, 161 ) ( 175, 180, 181, 164 ) }
▼ Bottom（底）
{ ( 154, 155, 156, 157 ) ( 182, 183, 184, 185 ) ( 186, 187, 188, 189 ) ( 190, 190, 190, 190 ) }
{ ( 164, 165, 166, 154 ) ( 191, 192, 193, 182 ) ( 194, 195, 196, 186 ) ( 190, 190, 190, 190 ) }
{ ( 157, 173, 174, 175 ) ( 185, 197, 198, 199 ) ( 189, 200, 201, 202 ) ( 190, 190, 190, 190 ) }
{ ( 175, 180, 181, 164 ) ( 199, 203, 204, 191 ) ( 202, 205, 206, 194 ) ( 190, 190, 190, 190 ) }
▼ Spout（注ぎ口）
{ ( 207, 208, 209, 210 ) ( 211, 212, 213, 214 ) ( 215, 216, 217, 218 ) ( 219, 220, 221, 222 ) }
{ ( 210, 223, 224, 207 ) ( 214, 225, 226, 211 ) ( 218, 227, 228, 215 ) ( 222, 229, 230, 219 ) }
{ ( 219, 220, 221, 222 ) ( 231, 232, 233, 234 ) ( 235, 236, 237, 238 ) ( 239, 240, 241, 242 ) }
{ ( 222, 229, 230, 219 ) ( 234, 243, 244, 231 ) ( 238, 245, 246, 235 ) ( 242, 247, 248, 239 ) }
▼ Handle（取っ手）
{ ( 249, 250, 251, 252 ) ( 253, 254, 255, 256 ) ( 257, 258, 259, 260 ) ( 261, 262, 263, 264 ) }
{ ( 252, 265, 266, 249 ) ( 256, 267, 268, 253 ) ( 260, 269, 270, 257 ) ( 264, 271, 272, 261 ) }
{ ( 261, 262, 263, 264 ) ( 273, 274, 275, 276 ) ( 277, 278, 279, 280 ) ( 281, 282, 283, 128 ) }
{ ( 264, 271, 272, 261 ) ( 276, 284, 285, 273 ) ( 280, 286, 287, 277 ) ( 128, 288, 289, 281 ) }
```

##▼ Control Point（制御点）× 290
```
(  0      ,  0      , +3.15    ) (  0      , -0.8    , +3.15    )
( +0.45   , -0.8    , +3.15    ) ( +0.8    , -0.45   , +3.15    )
( +0.8    ,  0      , +3.15    ) (  0      ,  0      , +2.85    )
(  0      , -0.2    , +2.7     ) ( +0.112  , -0.2    , +2.7     )
( +0.2    , -0.112  , +2.7     ) ( +0.2    ,  0      , +2.7     )
( -0.8    ,  0      , +3.15    ) ( -0.8    , -0.45   , +3.15    )
( -0.45   , -0.8    , +3.15    ) ( -0.2    ,  0      , +2.7     )
( -0.2    , -0.112  , +2.7     ) ( -0.112  , -0.2    , +2.7     )
( +0.8    , +0.45   , +3.15    ) ( +0.45   , +0.8    , +3.15    )
(  0      , +0.8    , +3.15    ) ( +0.2    , +0.112  , +2.7     )
( +0.112  , +0.2    , +2.7     ) (  0      , +0.2    , +2.7     )
( -0.45   , +0.8    , +3.15    ) ( -0.8    , +0.45   , +3.15    )
( -0.112  , +0.2    , +2.7     ) ( -0.2    , +0.112  , +2.7     )
(  0      , -0.4    , +2.55    ) ( +0.224  , -0.4    , +2.55    )
( +0.4    , -0.224  , +2.55    ) ( +0.4    ,  0      , +2.55    )
(  0      , -1.3    , +2.55    ) ( +0.728  , -1.3    , +2.55    )
( +1.3    , -0.728  , +2.55    ) ( +1.3    ,  0      , +2.55    )
(  0      , -1.3    , +2.4     ) ( +0.728  , -1.3    , +2.4     )
( +1.3    , -0.728  , +2.4     ) ( +1.3    ,  0      , +2.4     )
( -0.4    ,  0      , +2.55    ) ( -0.4    , -0.224  , +2.55    )
( -0.224  , -0.4    , +2.55    ) ( -1.3    ,  0      , +2.55    )
( -1.3    , -0.728  , +2.55    ) ( -0.728  , -1.3    , +2.55    )
( -1.3    ,  0      , +2.4     ) ( -1.3    , -0.728  , +2.4     )
( -0.728  , -1.3    , +2.4     ) ( +0.4    , +0.224  , +2.55    )
( +0.224  , +0.4    , +2.55    ) (  0      , +0.4    , +2.55    )
( +1.3    , +0.728  , +2.55    ) ( +0.728  , +1.3    , +2.55    )
(  0      , +1.3    , +2.55    ) ( +1.3    , +0.728  , +2.4     )
( +0.728  , +1.3    , +2.4     ) (  0      , +1.3    , +2.4     )
( -0.224  , +0.4    , +2.55    ) ( -0.4    , +0.224  , +2.55    )
( -0.728  , +1.3    , +2.55    ) ( -1.3    , +0.728  , +2.55    )
( -0.728  , +1.3    , +2.4     ) ( -1.3    , +0.728  , +2.4     )
(  0      , -1.4    , +2.4     ) ( +0.784  , -1.4    , +2.4     )
( +1.4    , -0.784  , +2.4     ) ( +1.4    ,  0      , +2.4     )
(  0      , -1.3375 , +2.53125 ) ( +0.749  , -1.3375 , +2.53125 )
( +1.3375 , -0.749  , +2.53125 ) ( +1.3375 ,  0      , +2.53125 )
(  0      , -1.4375 , +2.53125 ) ( +0.805  , -1.4375 , +2.53125 )
( +1.4375 , -0.805  , +2.53125 ) ( +1.4375 ,  0      , +2.53125 )
(  0      , -1.5    , +2.4     ) ( +0.84   , -1.5    , +2.4     )
( +1.5    , -0.84   , +2.4     ) ( +1.5    ,  0      , +2.4     )
( -1.4    ,  0      , +2.4     ) ( -1.4    , -0.784  , +2.4     )
( -0.784  , -1.4    , +2.4     ) ( -1.3375 ,  0      , +2.53125 )
( -1.3375 , -0.749  , +2.53125 ) ( -0.749  , -1.3375 , +2.53125 )
( -1.4375 ,  0      , +2.53125 ) ( -1.4375 , -0.805  , +2.53125 )
( -0.805  , -1.4375 , +2.53125 ) ( -1.5    ,  0      , +2.4     )
( -1.5    , -0.84   , +2.4     ) ( -0.84   , -1.5    , +2.4     )
( +1.4    , +0.784  , +2.4     ) ( +0.784  , +1.4    , +2.4     )
(  0      , +1.4    , +2.4     ) ( +1.3375 , +0.749  , +2.53125 )
( +0.749  , +1.3375 , +2.53125 ) (  0      , +1.3375 , +2.53125 )
( +1.4375 , +0.805  , +2.53125 ) ( +0.805  , +1.4375 , +2.53125 )
(  0      , +1.4375 , +2.53125 ) ( +1.5    , +0.84   , +2.4     )
( +0.84   , +1.5    , +2.4     ) (  0      , +1.5    , +2.4     )
( -0.784  , +1.4    , +2.4     ) ( -1.4    , +0.784  , +2.4     )
( -0.749  , +1.3375 , +2.53125 ) ( -1.3375 , +0.749  , +2.53125 )
( -0.805  , +1.4375 , +2.53125 ) ( -1.4375 , +0.805  , +2.53125 )
( -0.84   , +1.5    , +2.4     ) ( -1.5    , +0.84   , +2.4     )
(  0      , -1.75   , +1.875   ) ( +0.98   , -1.75   , +1.875   )
( +1.75   , -0.98   , +1.875   ) ( +1.75   ,  0      , +1.875   )
(  0      , -2      , +1.35    ) ( +1.12   , -2      , +1.35    )
( +2      , -1.12   , +1.35    ) ( +2      ,  0      , +1.35    )
(  0      , -2      , +0.9     ) ( +1.12   , -2      , +0.9     )
( +2      , -1.12   , +0.9     ) ( +2      ,  0      , +0.9     )
( -1.75   ,  0      , +1.875   ) ( -1.75   , -0.98   , +1.875   )
( -0.98   , -1.75   , +1.875   ) ( -2      ,  0      , +1.35    )
( -2      , -1.12   , +1.35    ) ( -1.12   , -2      , +1.35    )
( -2      ,  0      , +0.9     ) ( -2      , -1.12   , +0.9     )
( -1.12   , -2      , +0.9     ) ( +1.75   , +0.98   , +1.875   )
( +0.98   , +1.75   , +1.875   ) (  0      , +1.75   , +1.875   )
( +2      , +1.12   , +1.35    ) ( +1.12   , +2      , +1.35    )
(  0      , +2      , +1.35    ) ( +2      , +1.12   , +0.9     )
( +1.12   , +2      , +0.9     ) (  0      , +2      , +0.9     )
( -0.98   , +1.75   , +1.875   ) ( -1.75   , +0.98   , +1.875   )
( -1.12   , +2      , +1.35    ) ( -2      , +1.12   , +1.35    )
( -1.12   , +2      , +0.9     ) ( -2      , +1.12   , +0.9     )
(  0      , -2      , +0.45    ) ( +1.12   , -2      , +0.45    )
( +2      , -1.12   , +0.45    ) ( +2      ,  0      , +0.45    )
(  0      , -1.5    , +0.225   ) ( +0.84   , -1.5    , +0.225   )
( +1.5    , -0.84   , +0.225   ) ( +1.5    ,  0      , +0.225   )
(  0      , -1.5    , +0.15    ) ( +0.84   , -1.5    , +0.15    )
( +1.5    , -0.84   , +0.15    ) ( +1.5    ,  0      , +0.15    )
( -2      ,  0      , +0.45    ) ( -2      , -1.12   , +0.45    )
( -1.12   , -2      , +0.45    ) ( -1.5    ,  0      , +0.225   )
( -1.5    , -0.84   , +0.225   ) ( -0.84   , -1.5    , +0.225   )
( -1.5    ,  0      , +0.15    ) ( -1.5    , -0.84   , +0.15    )
( -0.84   , -1.5    , +0.15    ) ( +2      , +1.12   , +0.45    )
( +1.12   , +2      , +0.45    ) (  0      , +2      , +0.45    )
( +1.5    , +0.84   , +0.225   ) ( +0.84   , +1.5    , +0.225   )
(  0      , +1.5    , +0.225   ) ( +1.5    , +0.84   , +0.15    )
( +0.84   , +1.5    , +0.15    ) (  0      , +1.5    , +0.15    )
( -1.12   , +2      , +0.45    ) ( -2      , +1.12   , +0.45    )
( -0.84   , +1.5    , +0.225   ) ( -1.5    , +0.84   , +0.225   )
( -0.84   , +1.5    , +0.15    ) ( -1.5    , +0.84   , +0.15    )
(  0      , -1.5    , +0.075   ) ( +0.84   , -1.5    , +0.075   )
( +1.5    , -0.84   , +0.075   ) ( +1.5    ,  0      , +0.075   )
(  0      , -1.425  , +0       ) ( +0.798  , -1.425  , +0       )
( +1.425  , -0.798  , +0       ) ( +1.425  ,  0      , +0       )
(  0      ,  0      , +0       ) ( -1.5    ,  0      , +0.075   )
( -1.5    , -0.84   , +0.075   ) ( -0.84   , -1.5    , +0.075   )
( -1.425  ,  0      , +0       ) ( -1.425  , -0.798  , +0       )
( -0.798  , -1.425  , +0       ) ( +1.5    , +0.84   , +0.075   )
( +0.84   , +1.5    , +0.075   ) (  0      , +1.5    , +0.075   )
( +1.425  , +0.798  , +0       ) ( +0.798  , +1.425  , +0       )
(  0      , +1.425  , +0       ) ( -0.84   , +1.5    , +0.075   )
( -1.5    , +0.84   , +0.075   ) ( -0.798  , +1.425  , +0       )
( -1.425  , +0.798  , +0       ) ( +2.8    ,  0      , +2.4     )
( +2.8    , -0.15   , +2.4     ) ( +3.2    , -0.15   , +2.4     )
( +3.2    ,  0      , +2.4     ) ( +2.9    ,  0      , +2.475   )
( +2.9    , -0.15   , +2.475   ) ( +3.45   , -0.15   , +2.5125  )
( +3.45   ,  0      , +2.5125  ) ( +2.8    ,  0      , +2.475   )
( +2.8    , -0.25   , +2.475   ) ( +3.525  , -0.25   , +2.49375 )
( +3.525  ,  0      , +2.49375 ) ( +2.7    ,  0      , +2.4     )
( +2.7    , -0.25   , +2.4     ) ( +3.3    , -0.25   , +2.4     )
( +3.3    ,  0      , +2.4     ) ( +3.2    , +0.15   , +2.4     )
( +2.8    , +0.15   , +2.4     ) ( +3.45   , +0.15   , +2.5125  )
( +2.9    , +0.15   , +2.475   ) ( +3.525  , +0.25   , +2.49375 )
( +2.8    , +0.25   , +2.475   ) ( +3.3    , +0.25   , +2.4     )
( +2.7    , +0.25   , +2.4     ) ( +2.3    ,  0      , +2.1     )
( +2.3    , -0.25   , +2.1     ) ( +2.4    , -0.25   , +2.025   )
( +2.4    ,  0      , +2.025   ) ( +2.6    ,  0      , +1.425   )
( +2.6    , -0.66   , +1.425   ) ( +3.1    , -0.66   , +0.825   )
( +3.1    ,  0      , +0.825   ) ( +1.7    ,  0      , +1.425   )
( +1.7    , -0.66   , +1.425   ) ( +1.7    , -0.66   , +0.6     )
( +1.7    ,  0      , +0.6     ) ( +2.4    , +0.25   , +2.025   )
( +2.3    , +0.25   , +2.1     ) ( +3.1    , +0.66   , +0.825   )
( +2.6    , +0.66   , +1.425   ) ( +1.7    , +0.66   , +0.6     )
( +1.7    , +0.66   , +1.425   ) ( -1.5    ,  0      , +2.25    )
( -1.5    , -0.3    , +2.25    ) ( -1.6    , -0.3    , +2.025   )
( -1.6    ,  0      , +2.025   ) ( -2.5    ,  0      , +2.25    )
( -2.5    , -0.3    , +2.25    ) ( -2.3    , -0.3    , +2.025   )
( -2.3    ,  0      , +2.025   ) ( -3      ,  0      , +2.25    )
( -3      , -0.3    , +2.25    ) ( -2.7    , -0.3    , +2.025   )
( -2.7    ,  0      , +2.025   ) ( -3      ,  0      , +1.8     )
( -3      , -0.3    , +1.8     ) ( -2.7    , -0.3    , +1.8     )
( -2.7    ,  0      , +1.8     ) ( -1.6    , +0.3    , +2.025   )
( -1.5    , +0.3    , +2.25    ) ( -2.3    , +0.3    , +2.025   )
( -2.5    , +0.3    , +2.25    ) ( -2.7    , +0.3    , +2.025   )
( -3      , +0.3    , +2.25    ) ( -2.7    , +0.3    , +1.8     )
( -3      , +0.3    , +1.8     ) ( -3      ,  0      , +1.35    )
( -3      , -0.3    , +1.35    ) ( -2.7    , -0.3    , +1.575   )
( -2.7    ,  0      , +1.575   ) ( -2.65   ,  0      , +0.9375  )
( -2.65   , -0.3    , +0.9375  ) ( -2.5    , -0.3    , +1.125   )
( -2.5    ,  0      , +1.125   ) ( -1.9    ,  0      , +0.6     )
( -1.9    , -0.3    , +0.6     ) ( -2      , -0.3    , +0.9     )
( -2.7    , +0.3    , +1.575   ) ( -3      , +0.3    , +1.35    )
( -2.5    , +0.3    , +1.125   ) ( -2.65   , +0.3    , +0.9375  )
( -2      , +0.3    , +0.9     ) ( -1.9    , +0.3    , +0.6     )
```

![](https://bytebucket.org/LUXOPHIA/utahteapot/raw/514fe958022d8eb0febad2967ef5ca4c10f286a3/--------/_SCREENSHOT/UtahTeapot_32-Spout.png)

![](https://bytebucket.org/LUXOPHIA/utahteapot/raw/514fe958022d8eb0febad2967ef5ca4c10f286a3/--------/_SCREENSHOT/UtahTeapot_32-Lid.png)

### REFERENCE（参考文献）

* [The Utah Teapot - CHM Revolution  
![The Utah Teapot - CHM Revolution](http://s7.computerhistory.org/is/image/CHM/x398.84p-03-02?$re-medium$)](http://www.computerhistory.org/revolution/computer-graphics-music-and-art/15/206/557)

* [Martin Newell’s drawing of the Utah Teapot - CHM Revolution  
![Martin Newell’s drawing of the Utah Teapot - CHM Revolution](http://s7.computerhistory.org/is/image/CHM/102695462-03-01?$re-medium$)](http://www.computerhistory.org/revolution/computer-graphics-music-and-art/15/206/556)

* [Wire-frame model of the Utah Teapot - CHM Revolution  
![Wire-frame model of the Utah Teapot - CHM Revolution](http://s7.computerhistory.org/is/image/CHM/102672453-03-01?$re-medium$)](http://www.computerhistory.org/revolution/computer-graphics-music-and-art/15/206/554)