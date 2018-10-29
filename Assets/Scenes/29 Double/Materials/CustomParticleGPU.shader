Shader "Instanced/ParticleMeshesCustomStreams"
{
    Properties
    {
        _MainTex("Albedo", 2D) = "white" {}
		_SinScale("Sin Scale", Float) = 1.0
		_SinIntensity("Sin Intensity", Float) = 0.1
    }
    SubShader
    {
        Tags{ "RenderType" = "Opaque" }
        LOD 100
        Pass
        {
            CGPROGRAM
#pragma exclude_renderers gles
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #pragma instancing_options procedural:vertInstancingSetup
            #define UNITY_PARTICLE_INSTANCE_DATA MyParticleInstanceData
            #define UNITY_PARTICLE_INSTANCE_DATA_NO_ANIM_FRAME
            
			struct MyParticleInstanceData
            {
                float3x4 transform;
                uint color;
                float speed;
				float3 velocity;
            };

            #include "UnityCG.cginc"
            #include "UnityStandardParticleInstancing.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                fixed4 color : COLOR;
                float2 texcoord : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                fixed4 color : COLOR;
                float2 texcoord : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
			fixed _SinScale = 1.0;
			fixed _SinIntensity = 0.1;

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                o.color = v.color;
                o.texcoord = v.texcoord;
                vertInstancingColor(o.color);
                vertInstancingUVs(o.texcoord, v.texcoord); // c'etait l'inverse

#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
                UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
                //o.color.r = frac(data.position.y);
#endif
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				float3 vertexModif = v.vertex;
				vertexModif += sin(worldPos.y * _SinScale) * _SinIntensity;
                o.vertex = UnityObjectToClipPos(vertexModif);

				o.vertex.x += sin(worldPos.y * _SinScale) * _SinIntensity;

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                half4 albedo = tex2D(_MainTex, i.texcoord);
                return i.color * albedo;
            }

            ENDCG
        }
    }
}