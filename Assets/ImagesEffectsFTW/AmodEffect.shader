/*
	AMOD effect
	thanks to Flopine

*/

Shader "Hidden/AmodEffect"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Period ("Period", Float) = 5.0
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
			
			const float pi2 = 6.283185307179586476924;

			sampler2D _MainTex;
			fixed _Repeat;

			fixed4 frag (v2f_img i) : COLOR
			{
				// polar uvs
				fixed2 uv = (i.uv - fixed2(0.5, 0.5)) * 2.0;
				fixed polar = atan2(uv.y, uv.x)/* * 0.125 + 0.5*/;
				
				// period
				fixed tempPeriod = pi2 / _Repeat;

				// amod
				fixed amodFactor = fmod((polar + 4.0), tempPeriod) - (polar / 8.0);
				fixed radius = length(uv);
				fixed2 amodUV = fixed2(cos(amodFactor), sin(amodFactor)) * radius;

				//fixed4 col = lerp(fixed4(1.0, 0.0,0.0,0.0), fixed4(0.0, 1.0,0.0,0.0), amodFactor);
				fixed4 col = tex2D(_MainTex, amodUV);

				return col;
			}

			
			ENDCG
		}
	}
}
