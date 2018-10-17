// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "17/Swollen"
{
	Properties
	{
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		_LineNumber("LineNumber", Float) = 10
		_LineHeight("LineHeight", Float) = 0.1
		_EmissionLineHeight("EmissionLineHeight", Float) = 0.1
		_EmissionColor("EmissionColor", Color) = (0,0.8806818,1,0)
		_Emission("Emission", Float) = 1
		_Smoothness("Smoothness", Float) = 0
		_Mettalic("Mettalic", Float) = 0
		_EmmisionLineOffset("EmmisionLineOffset", Float) = 0
		_Tesselation("Tesselation", Float) = 10
		_vertexParaboleForce("vertexParaboleForce", Float) = 1
		_vertexOffsetScale("vertexOffsetScale", Float) = 0.1
		_vertexSineNumber("vertexSineNumber", Float) = 10
		_vertexSineOffset("vertexSineOffset", Float) = 0
		_vertexEndForce("vertexEndForce", Float) = 1
		_EmissionLineNumber("EmissionLineNumber", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _vertexEndForce;
		uniform float _vertexOffsetScale;
		uniform float _vertexSineOffset;
		uniform float _vertexSineNumber;
		uniform float _vertexParaboleForce;
		uniform float _LineNumber;
		uniform float _LineHeight;
		uniform float _EmmisionLineOffset;
		uniform float _EmissionLineNumber;
		uniform float _EmissionLineHeight;
		uniform float4 _EmissionColor;
		uniform float _Emission;
		uniform float _Mettalic;
		uniform float _Smoothness;
		uniform float _Tesselation;
		uniform float _TessPhongStrength;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 appendResult21 = (float4(_Tesselation , _Tesselation , _Tesselation , _Tesselation));
			return appendResult21;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 ase_vertexNormal = v.normal.xyz;
			float temp_output_1_0_g1 = v.texcoord.xy.x;
			float clampResult39 = clamp( pow( ( 4.0 * temp_output_1_0_g1 * ( 1.0 - temp_output_1_0_g1 ) ) , _vertexParaboleForce ) , 0.0 , 1.0 );
			float3 lerpResult52 = lerp( ( ase_vertexNormal * _vertexEndForce ) , ( ase_vertexNormal * _vertexOffsetScale * ( ( sin( ( ( _vertexSineOffset + v.texcoord.xy.x ) * _vertexSineNumber ) ) + 1.0 ) * 0.5 ) ) , ( clampResult39 * -1.0 ));
			float3 VertexOffset23 = lerpResult52;
			v.vertex.xyz += VertexOffset23;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 lerpResult9 = lerp( float4(0.1509434,0.1509434,0.1509434,0) , float4(0,0,0,0) , step( frac( ( i.uv_texcoord.y * _LineNumber ) ) , _LineHeight ));
			o.Albedo = lerpResult9.rgb;
			o.Emission = ( step( frac( ( ( i.uv_texcoord.y + _EmmisionLineOffset ) * _EmissionLineNumber ) ) , _EmissionLineHeight ) * _EmissionColor * _Emission ).rgb;
			o.Metallic = _Mettalic;
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
2567;29;1906;1004;2159.114;9.445503;1.481758;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;28;-2175.537,1718.839;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;44;-2158.634,1534.239;Float;False;Property;_vertexSineOffset;vertexSineOffset;12;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-1841.434,1661.639;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1756.938,1538.139;Float;False;Property;_vertexSineNumber;vertexSineNumber;11;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-1472.239,1495.239;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-1623.926,1849.595;Float;False;Property;_vertexParaboleForce;vertexParaboleForce;9;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;37;-1296.738,1404.237;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;-1736.837,328.9733;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-1663.403,512.2023;Float;False;Property;_EmmisionLineOffset;EmmisionLineOffset;7;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;45;-1132.934,1426.338;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;29;-1271.625,1772.894;Float;True;Wave-Parabole;-1;;1;ec35a35444de0ee42b518733c5fe3da3;0;2;2;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-831,148;Float;False;Property;_LineNumber;LineNumber;0;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-1481.95,715.1343;Float;False;Property;_EmissionLineNumber;EmissionLineNumber;14;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-1441.102,413.4026;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-935,13;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-987.3337,1423.738;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;38;-988.6377,1175.439;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-661,65;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-900.2368,1652.541;Float;False;Property;_vertexOffsetScale;vertexOffsetScale;10;0;Create;True;0;0;False;0;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-1135.218,501.7611;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;47;-1008.134,2077.638;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;39;-941.771,1748.458;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-991.2339,2244.038;Float;False;Property;_vertexEndForce;vertexEndForce;13;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1008.599,635.0997;Float;False;Property;_EmissionLineHeight;EmissionLineHeight;2;0;Create;True;0;0;False;0;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;5;-528,54;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-766.334,2145.239;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-622.037,1330.141;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-696.6183,1771.627;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-584,190;Float;False;Property;_LineHeight;LineHeight;1;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;20;-823.5359,455.2398;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;11;-679,439;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;6;-389,80;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-641,-192;Float;False;Constant;_LineColor;LineColor;2;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;52;-186.8936,1676.796;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;13;-463.4365,542.3397;Float;False;Property;_EmissionColor;EmissionColor;3;0;Create;True;0;0;False;0;0,0.8806818,1,0;0,0.8806818,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;15;-443.9362,730.8397;Float;False;Property;_Emission;Emission;4;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1;-622,-391;Float;False;Constant;_Background;Background;0;0;Create;True;0;0;False;0;0.1509434,0.1509434,0.1509434,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;22;17.56396,946.6396;Float;False;Property;_Tesselation;Tesselation;8;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;241.1638,455.2397;Float;False;Property;_Smoothness;Smoothness;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;255.4639,369.4397;Float;False;Property;_Mettalic;Mettalic;6;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;167.5172,1407.164;Float;False;VertexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;225.5636,677.5396;Float;False;23;0;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;21;330.864,866.0396;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-125.4362,385.0398;Float;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;9;-212,-48;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;582.2999,409.9;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;17/Swollen;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;True;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;42;0;44;0
WireConnection;42;1;28;1
WireConnection;34;0;42;0
WireConnection;34;1;35;0
WireConnection;37;0;34;0
WireConnection;45;0;37;0
WireConnection;29;2;30;0
WireConnection;29;1;28;1
WireConnection;19;0;10;2
WireConnection;19;1;18;0
WireConnection;46;0;45;0
WireConnection;3;0;2;2
WireConnection;3;1;4;0
WireConnection;55;0;19;0
WireConnection;55;1;56;0
WireConnection;39;0;29;0
WireConnection;5;0;3;0
WireConnection;49;0;47;0
WireConnection;49;1;50;0
WireConnection;27;0;38;0
WireConnection;27;1;32;0
WireConnection;27;2;46;0
WireConnection;53;0;39;0
WireConnection;20;0;55;0
WireConnection;11;0;20;0
WireConnection;11;1;12;0
WireConnection;6;0;5;0
WireConnection;6;1;7;0
WireConnection;52;0;49;0
WireConnection;52;1;27;0
WireConnection;52;2;53;0
WireConnection;23;0;52;0
WireConnection;21;0;22;0
WireConnection;21;1;22;0
WireConnection;21;2;22;0
WireConnection;21;3;22;0
WireConnection;14;0;11;0
WireConnection;14;1;13;0
WireConnection;14;2;15;0
WireConnection;9;0;1;0
WireConnection;9;1;8;0
WireConnection;9;2;6;0
WireConnection;0;0;9;0
WireConnection;0;2;14;0
WireConnection;0;3;16;0
WireConnection;0;4;17;0
WireConnection;0;11;24;0
WireConnection;0;14;21;0
ASEEND*/
//CHKSM=F778ACAE28A73E3F8AEB058F0692CEEE39A3A8CF