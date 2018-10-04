// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "03/Level"
{
	Properties
	{
		_WorldScale("WorldScale", Float) = 1
		_LineHeight("LineHeight", Float) = 0.1
		_LinePosition("LinePosition", Range( 0 , 1)) = 1
		_LineColor("LineColor", Color) = (0,0.9374716,1,0)
		_Emission("Emission", Float) = 1
		_Albedo("Albedo", Color) = (0.2352941,0.2352941,0.2352941,1)
		_Metallic("Metallic", Float) = 1
		_Smoothness("Smoothness", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Albedo;
		uniform float _Emission;
		uniform float4 _LineColor;
		uniform float _LinePosition;
		uniform float _WorldScale;
		uniform float _LineHeight;
		uniform float _Metallic;
		uniform float _Smoothness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
			float2 appendResult15 = (float2(0.0 , ( _LinePosition * -1.0 )));
			float2 uv_TexCoord5 = i.uv_texcoord + appendResult15;
			float temp_output_10_0 = step( frac( ( uv_TexCoord5.y * _WorldScale ) ) , _LineHeight );
			float4 temp_output_24_0 = ( _Emission * ( _LineColor * temp_output_10_0 ) );
			o.Emission = temp_output_24_0.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Smoothness;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
153;122;1587;911;3004.23;655.8017;1.501265;True;False
Node;AmplifyShaderEditor.RangedFloatNode;16;-2408.641,-160.0139;Float;False;Property;_LinePosition;LinePosition;3;0;Create;True;0;0;False;0;1;0.172;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-2029.909,-76.31329;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;15;-1905.642,-267.0139;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1567.642,-253.0139;Float;False;Property;_WorldScale;WorldScale;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1689.642,-368.0138;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,-0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-1393.158,-336.5125;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;19;-1214.722,-384.0728;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1178.5,-215.5;Float;False;Property;_LineHeight;LineHeight;2;0;Create;True;0;0;False;0;0.1;0.004;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-749.3294,-418.6019;Float;False;Property;_LineColor;LineColor;4;0;Create;True;0;0;False;0;0,0.9374716,1,0;1,0.471346,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;10;-977.5,-339.5;Float;True;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-552.6635,-154.3792;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-480.6028,-281.9867;Float;False;Property;_Emission;Emission;5;0;Create;True;0;0;False;0;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-1117.5,548.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-1042.5,135.5;Float;False;Constant;_Bottom;Bottom;0;0;Create;True;0;0;False;0;1,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-357.4993,-152.8779;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;4;-1053.5,338.5;Float;False;Property;_Top;Top;0;0;Create;True;0;0;False;0;0,1,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;28;-217.8816,96.33203;Float;False;Property;_Smoothness;Smoothness;8;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-432.5624,-2.751508;Float;False;Property;_Metallic;Metallic;7;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;2;-736.5,439.5;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;26;-186.3551,-259.4678;Float;False;Property;_Albedo;Albedo;6;0;Create;True;0;0;False;0;0.2352941,0.2352941,0.2352941,1;0.2352941,0.2352941,0.2352941,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;23;-271.9272,193.9144;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;03/Level;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;29;0;16;0
WireConnection;15;1;29;0
WireConnection;5;1;15;0
WireConnection;6;0;5;2
WireConnection;6;1;7;0
WireConnection;19;0;6;0
WireConnection;10;0;19;0
WireConnection;10;1;11;0
WireConnection;21;0;20;0
WireConnection;21;1;10;0
WireConnection;24;0;25;0
WireConnection;24;1;21;0
WireConnection;2;0;3;0
WireConnection;2;1;4;0
WireConnection;2;2;1;2
WireConnection;23;0;24;0
WireConnection;23;1;2;0
WireConnection;23;2;10;0
WireConnection;0;0;26;0
WireConnection;0;2;24;0
WireConnection;0;3;27;0
WireConnection;0;4;28;0
ASEEND*/
//CHKSM=5B78BCC674497311207DBB3F8F000B85519D9CFE