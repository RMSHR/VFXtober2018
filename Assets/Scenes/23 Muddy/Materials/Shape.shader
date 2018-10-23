// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "23/Shape"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Thickness("Thickness", Float) = 0.1
		_Size("Size", Float) = 0.9
		_Emission("Emission", Float) = 1
		_LineColor("LineColor", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _LineColor;
		uniform float _Emission;
		uniform float _Thickness;
		uniform float _Size;
		uniform float _Cutoff = 0.5;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Emission = _LineColor.rgb;
			o.Alpha = 1;
			float temp_output_4_0_g1 = _Size;
			float temp_output_27_0_g3 = ( ( _Thickness + temp_output_4_0_g1 ) * 0.5 );
			float temp_output_24_0_g3 = ( 0.5 - temp_output_27_0_g3 );
			float2 temp_output_3_0_g1 = i.uv_texcoord;
			float2 break21_g3 = temp_output_3_0_g1;
			float temp_output_37_0_g3 = ( temp_output_27_0_g3 + 0.5 );
			float temp_output_27_0_g2 = ( temp_output_4_0_g1 * 0.5 );
			float temp_output_24_0_g2 = ( 0.5 - temp_output_27_0_g2 );
			float2 break21_g2 = temp_output_3_0_g1;
			float temp_output_37_0_g2 = ( temp_output_27_0_g2 + 0.5 );
			clip( ( _Emission * ( ( ( step( temp_output_24_0_g3 , break21_g3.x ) * step( temp_output_24_0_g3 , break21_g3.y ) ) * ( step( break21_g3.y , temp_output_37_0_g3 ) * step( break21_g3.x , temp_output_37_0_g3 ) ) ) - ( ( step( temp_output_24_0_g2 , break21_g2.x ) * step( temp_output_24_0_g2 , break21_g2.y ) ) * ( step( break21_g2.y , temp_output_37_0_g2 ) * step( break21_g2.x , temp_output_37_0_g2 ) ) ) ) ) - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
81.6;38.4;1448;702;1022;211.5;1;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-938,127.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4;-1052,-39.5;Float;False;Property;_Size;Size;2;0;Create;True;0;0;False;0;0.9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-1050,-154.5;Float;False;Property;_Thickness;Thickness;1;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1;-651,8.5;Float;False;Shape-SquareOutline;-1;;1;c9ed8dac7db51694c9c29b27f33c9c0b;0;3;5;FLOAT;0.1;False;4;FLOAT;0.9;False;3;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-502,-249.5;Float;False;Property;_Emission;Emission;3;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;7;-266,-180.5;Float;False;Property;_LineColor;LineColor;4;0;Create;True;0;0;False;0;1,1,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-306,59.5;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;23/Shape;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;0;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1;5;3;0
WireConnection;1;4;4;0
WireConnection;1;3;2;0
WireConnection;5;0;6;0
WireConnection;5;1;1;0
WireConnection;0;2;7;0
WireConnection;0;10;5;0
ASEEND*/
//CHKSM=7D199C7FFB1B2DA7C0BB132ABDD366CD67702B30