Shader "Hidden/CameraComposition"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_dotLength ("Dot Length", Range(0.0, 1.0)) = 0.5
		_dotWidth ("Dot Width", Float) = 0.01
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
			fixed _dotLength;
			fixed _dotWidth;
			fixed _activeThirdRules;
			fixed _activeCenterRule;

			fixed4 frag (v2f_img i) : COLOR
			{
				fixed4 col = tex2D(_MainTex, i.uv);

				fixed verticalHoles = step(frac(i.uv.y * 100.0), _dotLength);
				fixed horizontalHoles = step(frac(i.uv.x * 100.0), _dotLength);

				if(_activeCenterRule >= 1.0)
				{
					fixed centerLine = step(i.uv.y, 0.5+_dotWidth) - step(i.uv.y, 0.5);

					centerLine *= horizontalHoles;

					col += centerLine;
				}

				if(_activeThirdRules >= 1.0)
				{
					fixed third = 0.33;

					fixed Thirdline1 = step(i.uv.x, third+_dotWidth) - step(i.uv.x, third);
					fixed Thirdline2 = step(i.uv.x, third*2.0+_dotWidth) - step(i.uv.x, third*2.0);
					fixed Thirdline3 = step(i.uv.y, third+_dotWidth) - step(i.uv.y, third);
					fixed Thirdline4 = step(i.uv.y, third*2.0+_dotWidth) - step(i.uv.y, third*2.0);
					Thirdline1 *= verticalHoles;
					Thirdline2 *= verticalHoles;
					Thirdline3 *= horizontalHoles;
					Thirdline4 *= horizontalHoles;

					col += Thirdline1;
					col += Thirdline2;
					col += Thirdline3;
					col += Thirdline4;
				}

				return col;
			}

			
			ENDCG
		}
	}
}
