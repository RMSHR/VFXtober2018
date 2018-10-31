// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "31/Car"
{
	Properties
	{
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Tesselation("Tesselation", Float) = 10
		_PBR("PBR", Vector) = (0,0,0,0)
		_Color("Color", Color) = (0,0,0,0)
		_SliceColor("SliceColor", Color) = (1,0.6640479,0,0)
		_Emission("Emission", Float) = 1
		_SliceWidth("SliceWidth", Range( 0 , 1)) = 0.01
		_SliceEmissionOffset("SliceEmissionOffset", Float) = 2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Color;
		uniform float _Emission;
		uniform float4 _SliceColor;
		uniform float _SliceEmissionOffset;
		uniform float _SliceWidth;
		uniform float2 _PBR;
		uniform float _Tesselation;
		uniform float _Cutoff = 0.5;
		uniform float _TessPhongStrength;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 appendResult1 = (float4(_Tesselation , _Tesselation , _Tesselation , _Tesselation));
			return appendResult1;
		}

		void vertexDataFunc( inout appdata_full v )
		{
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Color.rgb;
			float2 uv_TexCoord8 = i.uv_texcoord * float2( 2,1 );
			float temp_output_10_0 = abs( ( 1.0 - uv_TexCoord8.x ) );
			float4 lerpResult18 = lerp( float4( 0,0,0,0 ) , ( _Emission * _SliceColor ) , step( temp_output_10_0 , saturate( ( _SliceEmissionOffset * _SliceWidth ) ) ));
			o.Emission = lerpResult18.rgb;
			o.Metallic = _PBR.x;
			o.Smoothness = _PBR.y;
			o.Alpha = 1;
			clip( ( 1.0 - step( temp_output_10_0 , _SliceWidth ) ) - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
6.4;29.6;1448;789;2217.858;-406.3333;1.496588;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;8;-1678.159,1021.102;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;2,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-1399.238,411.3002;Float;False;Property;_SliceEmissionOffset;SliceEmissionOffset;7;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1514.381,633.171;Float;False;Property;_SliceWidth;SliceWidth;6;0;Create;True;0;0;False;0;0.01;0.01;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;11;-1429.159,1013.102;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-1155.972,593.6647;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;10;-1187.232,1008.715;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;19;-951.4194,572.8649;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;-1341.386,73.77405;Float;False;Property;_SliceColor;SliceColor;4;0;Create;True;0;0;False;0;1,0.6640479,0,0;1,0.6640479,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;7;-1219.386,17.77399;Float;False;Property;_Emission;Emission;5;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-1016.386,101.774;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-443,678;Float;False;Property;_Tesselation;Tesselation;1;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;12;-773.9872,976.9049;Float;True;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;20;-805.3721,686.0416;Float;True;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4;-359,-74;Float;False;Property;_Color;Color;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;3;-459,86;Float;False;Property;_PBR;PBR;2;0;Create;True;0;0;False;0;0,0;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;18;-412.9609,264.7822;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;14;-202.3601,386.9822;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1;-170,574;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;31/Car;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;0;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;True;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;11;1;8;1
WireConnection;17;0;16;0
WireConnection;17;1;15;0
WireConnection;10;0;11;0
WireConnection;19;0;17;0
WireConnection;6;0;7;0
WireConnection;6;1;5;0
WireConnection;12;0;10;0
WireConnection;12;1;15;0
WireConnection;20;0;10;0
WireConnection;20;1;19;0
WireConnection;18;1;6;0
WireConnection;18;2;20;0
WireConnection;14;1;12;0
WireConnection;1;0;2;0
WireConnection;1;1;2;0
WireConnection;1;2;2;0
WireConnection;1;3;2;0
WireConnection;0;0;4;0
WireConnection;0;2;18;0
WireConnection;0;3;3;1
WireConnection;0;4;3;2
WireConnection;0;10;14;0
WireConnection;0;14;1;0
ASEEND*/
//CHKSM=59F3F844B7118AC800E1FF4A0FD3B3C77B743A99