// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "23/Grid"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_RightColor("RightColor", Color) = (0,1,1,0)
		_LeftColor("LeftColor", Color) = (1,0,0,0)
		_Emission("Emission", Float) = 2
		_squareThickness("squareThickness", Float) = 0.1
		_squareSize("squareSize", Float) = 0.9
		_Tiling("Tiling", Vector) = (4,4,0,0)
		_circleRadius("circleRadius", Float) = 0.9
		_circleThickness("circleThickness", Float) = 0.1
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
			float4 screenPos;
			float2 uv_texcoord;
		};

		uniform float _Emission;
		uniform float4 _LeftColor;
		uniform float4 _RightColor;
		uniform float _squareThickness;
		uniform float _squareSize;
		uniform float2 _Tiling;
		uniform float _circleThickness;
		uniform float _circleRadius;
		uniform float _Cutoff = 0.5;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float4 lerpResult5 = lerp( _LeftColor , _RightColor , ase_screenPosNorm.x);
			o.Emission = ( _Emission * lerpResult5 ).rgb;
			o.Alpha = 1;
			float temp_output_4_0_g1 = _squareSize;
			float temp_output_27_0_g3 = ( ( _squareThickness + temp_output_4_0_g1 ) * 0.5 );
			float temp_output_24_0_g3 = ( 0.5 - temp_output_27_0_g3 );
			float2 uv_TexCoord9 = i.uv_texcoord * _Tiling;
			float2 temp_output_3_0_g1 = frac( uv_TexCoord9 );
			float2 break21_g3 = temp_output_3_0_g1;
			float temp_output_37_0_g3 = ( temp_output_27_0_g3 + 0.5 );
			float temp_output_27_0_g2 = ( temp_output_4_0_g1 * 0.5 );
			float temp_output_24_0_g2 = ( 0.5 - temp_output_27_0_g2 );
			float2 break21_g2 = temp_output_3_0_g1;
			float temp_output_37_0_g2 = ( temp_output_27_0_g2 + 0.5 );
			float2 temp_output_10_0_g4 = i.uv_texcoord;
			float2 temp_output_13_0_g4 = float2( 0.5,0.5 );
			float temp_output_6_0_g4 = _circleRadius;
			clip( ( ( ( ( step( temp_output_24_0_g3 , break21_g3.x ) * step( temp_output_24_0_g3 , break21_g3.y ) ) * ( step( break21_g3.y , temp_output_37_0_g3 ) * step( break21_g3.x , temp_output_37_0_g3 ) ) ) - ( ( step( temp_output_24_0_g2 , break21_g2.x ) * step( temp_output_24_0_g2 , break21_g2.y ) ) * ( step( break21_g2.y , temp_output_37_0_g2 ) * step( break21_g2.x , temp_output_37_0_g2 ) ) ) ) + ( step( distance( temp_output_10_0_g4 , temp_output_13_0_g4 ) , ( ( _circleThickness + temp_output_6_0_g4 ) * 0.5 ) ) - step( distance( temp_output_10_0_g4 , temp_output_13_0_g4 ) , ( temp_output_6_0_g4 * 0.5 ) ) ) ) - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
-7.2;188.8;1448;702;1511.327;-192.8846;1.3;True;True
Node;AmplifyShaderEditor.Vector2Node;12;-1307.227,636.1847;Float;False;Property;_Tiling;Tiling;6;0;Create;True;0;0;False;0;4,4;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1051.544,569.2609;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-951.0269,435.9846;Float;False;Property;_squareSize;squareSize;5;0;Create;True;0;0;False;0;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-978.3268,339.7846;Float;False;Property;_squareThickness;squareThickness;4;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-694.9269,883.1846;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-593.5269,1043.085;Float;False;Property;_circleRadius;circleRadius;7;0;Create;True;0;0;False;0;0.9;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-588.3271,1134.085;Float;False;Property;_circleThickness;circleThickness;8;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;13;-722.2267,654.3846;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;2;-582.75,-273.25;Float;False;Property;_LeftColor;LeftColor;2;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-783.75,-116.25;Float;False;Property;_RightColor;RightColor;1;0;Create;True;0;0;False;0;0,1,1,0;0,1,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;4;-887.75,78.75;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;14;-262.0269,818.1846;Float;False;Shape-CircleOutlined;-1;;4;70537716381e1ae45b39693927da8a86;0;4;13;FLOAT2;0.5,0.5;False;10;FLOAT2;0,0;False;6;FLOAT;0.5;False;7;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5;-373.75,2.75;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;8;-463.4818,453.0942;Float;True;Shape-SquareOutline;-1;;1;c9ed8dac7db51694c9c29b27f33c9c0b;0;3;5;FLOAT;0;False;4;FLOAT;0;False;3;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-87,-73;Float;False;Property;_Emission;Emission;3;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;167,25;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;18;36.97278,521.7845;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;345,-12;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;23/Grid;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;0;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;9;0;12;0
WireConnection;13;0;9;0
WireConnection;14;10;15;0
WireConnection;14;6;16;0
WireConnection;14;7;17;0
WireConnection;5;0;2;0
WireConnection;5;1;3;0
WireConnection;5;2;4;1
WireConnection;8;5;10;0
WireConnection;8;4;11;0
WireConnection;8;3;13;0
WireConnection;6;0;7;0
WireConnection;6;1;5;0
WireConnection;18;0;8;0
WireConnection;18;1;14;0
WireConnection;0;2;6;0
WireConnection;0;10;18;0
ASEEND*/
//CHKSM=A8BD8D3F7AE7FA4BA2F45525872F9F65E80712A0