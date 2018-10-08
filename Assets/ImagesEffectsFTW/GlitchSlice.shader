Shader "Hidden/GlitchSlice"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Intensity ("Intensity", Range(-0.1, 0.1)) = 0.0
		_Slices ("Slices", Float) = 0.0
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			
			#include "UnityCG.cginc"
			
			sampler2D _MainTex;
			fixed _Intensity;
			fixed _Slices;

			fixed2 RandomFloat(fixed _f, fixed _factor)
			{
				return frac(sin(_f * _factor));
			}

			fixed4 frag (v2f_img i) : COLOR
			{
				fixed u = RandomFloat(ceil(i.uv.x * _Slices) / _Slices, 515.59);
				fixed v = RandomFloat(ceil(i.uv.y * _Slices) / _Slices, 539.0);

				fixed2 glitchedUvs = fixed2(u, v);

				fixed4 col = tex2D(_MainTex, lerp(i.uv, glitchedUvs, _Intensity));

				return col;
			}

			
			ENDCG
		}
	}
}
