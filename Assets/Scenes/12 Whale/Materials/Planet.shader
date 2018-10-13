// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "12/Planet"
{
	Properties
	{
		_Color1("Color 1", Color) = (0.5754717,0.05157528,0.05157528,0)
		_Color0("Color 0", Color) = (0.5,0.497002,0.2429245,0)
		_m("m", Float) = 0
		_s("s", Float) = 1
		_freq("freq", Float) = 0
		_ampl("ampl", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "DisableBatching" = "True" }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _freq;
		uniform float _ampl;
		uniform float4 _Color1;
		uniform float4 _Color0;
		uniform float _m;
		uniform float _s;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 break3_g1 = ase_worldPos;
			float mulTime4_g1 = _Time.y * 2.0;
			float3 appendResult11_g1 = (float3(break3_g1.x , ( break3_g1.y + ( sin( ( ( break3_g1.x * _freq ) + mulTime4_g1 ) ) * _ampl ) ) , break3_g1.z));
			v.vertex.xyz += appendResult11_g1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 lerpResult4 = lerp( _Color1 , _Color0 , i.uv_texcoord.y);
			o.Albedo = lerpResult4.rgb;
			o.Metallic = _m;
			o.Smoothness = _s;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
81.6;28.8;1448;790;877;-71;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;11;-411,681.5;Float;False;Property;_ampl;ampl;5;0;Create;True;0;0;False;0;0;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-411,574.5;Float;False;Property;_freq;freq;4;0;Create;True;0;0;False;0;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;9;-542,400.5;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;1;-770.75,5.5;Float;False;Property;_Color0;Color 0;1;0;Create;True;0;0;False;0;0.5,0.497002,0.2429245,0;0.384701,0.8584906,0.4399128,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-763.75,186.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-686.75,-149.5;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0.5754717,0.05157528,0.05157528,0;0.3381987,0.5434225,0.754717,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;8;-193,432.5;Float;False;Waving Vertex;-1;;1;872b3757863bb794c96291ceeebfb188;0;3;1;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-269,185.5;Float;False;Property;_m;m;2;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4;-394.75,67.5;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-261,272.5;Float;False;Property;_s;s;3;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;127,113;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;12/Planet;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;1;9;0
WireConnection;8;12;10;0
WireConnection;8;13;11;0
WireConnection;4;0;3;0
WireConnection;4;1;1;0
WireConnection;4;2;2;2
WireConnection;0;0;4;0
WireConnection;0;3;5;0
WireConnection;0;4;6;0
WireConnection;0;11;8;0
ASEEND*/
//CHKSM=1AA254B4B769AF9B6A59A44D521689A7C5753377