Shader "Hidden/MirrorEffect"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_MirrorX ("Intensity", Range(0.0, 1.0)) = 0.0
		_MirrorY ("Intensity", Range(0.0, 1.0)) = 0.0
		_MirrorXoffset ("MirrorXoffset", Range(0.0, 1.0)) = 0.5
		_MirrorYoffset ("MirrorYoffset", Range(0.0, 1.0)) = 0.5
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
			fixed _MirrorX;
			fixed _MirrorY;
			fixed _MirrorXoffset;
			fixed _MirrorYoffset;

			fixed4 frag (v2f_img i) : COLOR
			{
				fixed4 srcColor = tex2D(_MainTex, i.uv);
				fixed mirrorXUV = lerp(i.uv.x, (abs(i.uv.x * 2.0 - 1.0) * - 1.0 + 1.0) * _MirrorXoffset, _MirrorX);
				fixed mirrorYUV = lerp(i.uv.y, (abs(i.uv.y * 2.0 - 1.0) * - 1.0 + 1.0) * _MirrorYoffset, _MirrorY);

				fixed4 col = tex2D(_MainTex, fixed2(mirrorXUV, mirrorYUV));

				return col;
			}

			
			ENDCG
		}
	}
}
