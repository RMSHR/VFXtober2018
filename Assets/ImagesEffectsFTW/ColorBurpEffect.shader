Shader "Hidden/ColorBurpEffect"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Burp ("Burp", Range(0,1)) = 0.5
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
			fixed _Burp;

			fixed4 frag (v2f_img i) : COLOR
			{
				fixed4 col_red = tex2D(_MainTex, i.uv + float2(0.1 * _Burp, 0.0));
				fixed4 col_green = tex2D(_MainTex, i.uv - float2(0.1 * _Burp, 0.0));
				fixed4 col = fixed4(col_red.r, col_green.g, tex2D(_MainTex, i.uv).b, 0.0);
				// just invert the colors
				return col;
			}
			ENDCG
		}
	}
}
