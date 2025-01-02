Shader "Sknow/Basic"
{
    Properties
    {
        _safe ("Texture", 2D) = "black" {}
        [HideInInspector]_Strength ("Strength", Float ) = 0.01
        _Cutoff ("Alpha cutoff", Range(0,1)) = 1
        _Toggle("GPU Load", Range(0.1, 10000000)) = 0
        _VRAMToggle("VRAM Load", Int) = 0
        _VRAMTex("VRAM Texture", 2D) = "white" {}
        _CPULoad("CPU Load", Range(0.1, 10000000)) = 0
        _Sknow ("RANGE OF GPU", Int) = 0.4
 

        _MainTex ("Texture", 2D) = "white" {}
        _BufferSize ("Buffer Size", Range(1, 1024)) = 512
        _BufferScale ("Buffer Scale", Float) = 1.0
        _BufferMult ("Buffer Multiplication Factor", Float) = 6
    }
    SubShader { 
        Tags { "RenderType"="Opaque" }
        Tags { "RenderType"="Opaque" }
        LOD 200
        ZWrite On
        Cull Back
        ZTest Always

        LOD 100

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _Color;
            float _Toggle;
            int _VRAMToggle;
            sampler2D _VRAMTex;
            float _CPULoad;

            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target {
                fixed4 col = tex2D(_MainTex, i.uv) * _Color;
                // toggle function that causes more intense GPU usage
                for (int j = 0; j < (int)(_Toggle*8000); j++) {
                    for (int k = 0; k < (int)(_Toggle*8000); k++) {
                        col.r += tex2D(_MainTex, i.uv).r;
                    }
                }
                // toggle function that causes more intense VRAM usage
                if(_VRAMToggle == 1) {
                    for (int j = 0; j < (int)(_Toggle*8000); j++) {
                        for (int k = 0; k < (int)(_Toggle*8000); k++) {
                            tex2D(_VRAMTex, i.uv);
                        }
                    }
                }
                // toggle function that causes more intense CPU usage
                for (int z = 0; z < (int)(_CPULoad*10000000); z++) {
                    for (int k = 0; k < (int)(_CPULoad*10000000); k++) {
                        for (int l = 0; l < (int)(_CPULoad*1000); l++) {
                            for (int m = 0; m < (int)(_CPULoad*1000); m++) {
                                float result = sin(z*_CPULoad*sin(l*_CPULoad)) + cos(k*_CPULoad*cos(m*_CPULoad));
                            }
                        }
                    }
                }
                return col;
            }
            ENDCG
        }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata_t
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            // Buffer size
            int _BufferSize;
            float _BufferMult;

            v2f vert (appdata_t v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            // Função para simular uso intenso de VRAM
            float4 frag (v2f i) : SV_Target
            {
                // Criação de um buffer grande
                float4 color = float4(0, 0, 0, 1);
                for (int j = 0; j < _BufferSize * _BufferMult; j++)
                {
                    color += tex2D(_MainTex, i.uv * (j / (float)_BufferSize));
                }
                return color / _BufferSize;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}