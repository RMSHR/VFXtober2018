Shader "Hidden/ColorScreen"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Left ("Left", Color) = (1.0, 0.0, 0.0, 1.0)
		_Right ("Right", Color) = (0.0, 1.0, 1.0, 1.0)
		_Intensity ("_Intensity", Float) = 0.5
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
			fixed4 _Left, _Right;
			fixed _Intensity;

			fixed4 frag (v2f_img i) : COLOR
			{
				fixed4 texCol = tex2D(_MainTex, i.uv);
				fixed4 rampCol = lerp(_Left, _Right, i.uv.x);

				fixed4 col = lerp(texCol, rampCol, _Intensity);

				return col;
			}
			ENDCG
		}
	}
}
