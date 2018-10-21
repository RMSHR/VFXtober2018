// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "20/Background"
{
	Properties
	{
		_squareSize("squareSize", Float) = 0.5
		_rotation("rotation", Float) = 0
		_emission("emission", Float) = 1
		_Color0("Color 0", Color) = (0,0,0,0)
		_Color1("Color 1", Color) = (1,1,1,0)
		_Color2("Color 2", Color) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _emission;
		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform float4 _Color0;
		uniform float _squareSize;
		uniform float _rotation;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 lerpResult15 = lerp( _Color1 , _Color2 , i.uv_texcoord.y);
			float temp_output_27_0_g1 = ( _squareSize * 0.5 );
			float temp_output_24_0_g1 = ( 0.5 - temp_output_27_0_g1 );
			float cos4 = cos( ( UNITY_PI * _rotation ) );
			float sin4 = sin( ( UNITY_PI * _rotation ) );
			float2 rotator4 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos4 , -sin4 , sin4 , cos4 )) + float2( 0.5,0.5 );
			float2 break21_g1 = rotator4;
			float temp_output_37_0_g1 = ( temp_output_27_0_g1 + 0.5 );
			float clampResult8 = clamp( ( ( step( temp_output_24_0_g1 , break21_g1.x ) * step( temp_output_24_0_g1 , break21_g1.y ) ) * ( step( break21_g1.y , temp_output_37_0_g1 ) * step( break21_g1.x , temp_output_37_0_g1 ) ) ) , 0.0 , 1.0 );
			float4 lerpResult9 = lerp( lerpResult15 , _Color0 , clampResult8);
			o.Emission = ( _emission * lerpResult9 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
6.4;29.6;1448;789;1185;491.5;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;7;-1205,483.5;Float;False;Property;_rotation;rotation;1;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;5;-1284,332.5;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-1062,385.5;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1229,177.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;4;-909,199.5;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-781,320.5;Float;False;Property;_squareSize;squareSize;0;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-700,-99.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;1;-516,156.5;Float;False;Shape-Square;-1;;1;87f9f7b116e90e847bcbf6040a80ede5;0;2;20;FLOAT2;0,0;False;5;FLOAT;0.87;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;14;-714,-276.5;Float;False;Property;_Color2;Color 2;5;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;13;-712,-460.5;Float;False;Property;_Color1;Color 1;4;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;8;-268,180.5;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;15;-333,-227.5;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;12;-784,37.5;Float;False;Property;_Color0;Color 0;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-14,-45.5;Float;False;Property;_emission;emission;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;9;-54,85.5;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;139,65.5;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;329,1;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;20/Background;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;5;0
WireConnection;6;1;7;0
WireConnection;4;0;2;0
WireConnection;4;2;6;0
WireConnection;1;20;4;0
WireConnection;1;5;3;0
WireConnection;8;0;1;0
WireConnection;15;0;13;0
WireConnection;15;1;14;0
WireConnection;15;2;16;2
WireConnection;9;0;15;0
WireConnection;9;1;12;0
WireConnection;9;2;8;0
WireConnection;10;0;11;0
WireConnection;10;1;9;0
WireConnection;0;2;10;0
ASEEND*/
//CHKSM=F47CE1630E8E18A6F2FD77157AA38C4ABD2A1814