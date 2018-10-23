Shader "Hidden/CompositionGrayscale"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
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
			fixed rgb, r, g, b;
			fixed activeIso;
			fixed isoNbr;

			fixed4 frag (v2f_img i) : COLOR
			{
				fixed4 col = tex2D(_MainTex, i.uv);

				if(rgb >= 1.0) col = dot(col, fixed4(0.22, 0.707, 0.071, 0.0));
				if(r >= 1.0) col = fixed4(col.r, col.r, col.r, 0.0);
				if(g >= 1.0) col = fixed4(col.g, col.g, col.g, 0.0);
				if(b >= 1.0) col = fixed4(col.b, col.b, col.b, 0.0);

				if(activeIso >= 1.0)
				{
					col = floor(col*isoNbr)/isoNbr;
					
				}

				return col;
			}

			
			ENDCG
		}
	}
}
