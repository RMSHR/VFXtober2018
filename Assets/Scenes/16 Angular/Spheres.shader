// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "16/Spheres"
{
	Properties
	{
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 1
		_Color1("Color 1", Color) = (0,1,0,0)
		_Color0("Color 0", Color) = (1,0,0,0)
		_worldscaleColor("worldscaleColor", Float) = 1
		_tess("tess", Float) = 10
		_worldoffsetmotion("worldoffsetmotion", Float) = 0
		_worldScaleMotion("worldScaleMotion", Float) = 1
		_sinpower("sinpower", Float) = 1
		_timespeed("timespeed", Float) = 0.1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			float3 worldPos;
		};

		uniform float _worldoffsetmotion;
		uniform float _timespeed;
		uniform float _worldScaleMotion;
		uniform float _sinpower;
		uniform float4 _Color0;
		uniform float4 _Color1;
		uniform float _worldscaleColor;
		uniform float _tess;
		uniform float _TessPhongStrength;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 appendResult18 = (float4(_tess , _tess , _tess , _tess));
			return appendResult18;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float mulTime31 = _Time.y * _timespeed;
			float3 ase_vertexNormal = v.normal.xyz;
			float3 temp_output_24_0 = ( sin( ( ( ase_worldPos.y + _worldoffsetmotion + mulTime31 ) * _worldScaleMotion ) ) * _sinpower * ( ase_vertexNormal * 1.0 ) );
			float3 appendResult22 = (float3(temp_output_24_0.xy , temp_output_24_0.x));
			v.vertex.xyz += appendResult22;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float4 lerpResult16 = lerp( _Color0 , _Color1 , sin( ( ase_worldPos.y * _worldscaleColor ) ));
			o.Albedo = lerpResult16.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
326;29;1587;1004;1621.686;625.2725;1.3;True;False
Node;AmplifyShaderEditor.RangedFloatNode;33;-1427.986,829.4275;Float;False;Property;_timespeed;timespeed;11;0;Create;True;0;0;False;0;0.1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;19;-1001.585,477.1277;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;31;-1149.786,815.1275;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1006.786,647.4275;Float;False;Property;_worldoffsetmotion;worldoffsetmotion;8;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-774.0856,691.6276;Float;False;Property;_worldScaleMotion;worldScaleMotion;9;0;Create;True;0;0;False;0;1;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-735.0859,547.3276;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-982.3995,23.29999;Float;False;Property;_worldscaleColor;worldscaleColor;6;0;Create;True;0;0;False;0;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;12;-937,-141.6;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalVertexDataNode;26;-1082.186,191.1275;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;28;-1091.286,360.1276;Float;False;Constant;_normsize;normsize;4;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-546.5854,609.7277;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;23;-425.6857,500.5276;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-728.7,-39.6;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-836.4857,232.7275;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-387.9857,585.0276;Float;False;Property;_sinpower;sinpower;10;0;Create;True;0;0;False;0;1;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-237.1857,647.4276;Float;False;Property;_tess;tess;7;0;Create;True;0;0;False;0;10;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;34;-555.6855,16.92749;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-248.8857,439.4276;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;5;-343.5,-542;Float;False;Property;_Color0;Color 0;4;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;15;-497.5,-408;Float;False;Property;_Color1;Color 1;3;0;Create;True;0;0;False;0;0,1,0,0;0.3307047,1,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;18;51.41438,608.4276;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;10;-1354.4,146.2;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FresnelNode;1;-1589.4,166.2001;Float;False;Tangent;4;0;FLOAT3;0,0,1;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;6;-1632.4,-14.80002;Float;False;Constant;_Emissionco;Emissionco;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-1923.4,238.2;Float;False;Property;_Scale;Scale;1;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-1175.4,158.2001;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1577.4,406.2001;Float;False;Property;_em;em;5;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-1921.4,140.2;Float;False;Property;_Bias;Bias;2;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;22;-73.38557,310.7277;Float;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;16;-191.5,-216;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-1929.4,318.2001;Float;False;Property;_Power;Power;0;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;146,-26;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;16/Spheres;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;True;1;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;31;0;33;0
WireConnection;30;0;19;2
WireConnection;30;1;29;0
WireConnection;30;2;31;0
WireConnection;21;0;30;0
WireConnection;21;1;20;0
WireConnection;23;0;21;0
WireConnection;13;0;12;2
WireConnection;13;1;14;0
WireConnection;27;0;26;0
WireConnection;27;1;28;0
WireConnection;34;0;13;0
WireConnection;24;0;23;0
WireConnection;24;1;25;0
WireConnection;24;2;27;0
WireConnection;18;0;17;0
WireConnection;18;1;17;0
WireConnection;18;2;17;0
WireConnection;18;3;17;0
WireConnection;10;0;6;0
WireConnection;10;2;1;0
WireConnection;1;1;2;0
WireConnection;1;2;3;0
WireConnection;1;3;4;0
WireConnection;11;0;10;0
WireConnection;11;1;7;0
WireConnection;22;0;24;0
WireConnection;22;2;24;0
WireConnection;16;0;5;0
WireConnection;16;1;15;0
WireConnection;16;2;34;0
WireConnection;0;0;16;0
WireConnection;0;11;22;0
WireConnection;0;14;18;0
ASEEND*/
//CHKSM=BDFF15936BAFD6C0813E5123426DA9A87DB7D568