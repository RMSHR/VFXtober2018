// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "23/Muddy"
{
	Properties
	{
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		_LeftColor("LeftColor", Color) = (0,1,1,0)
		_RightColor("RightColor", Color) = (1,0,0,0)
		_Tesselation("Tesselation", Float) = 10
		_WavePower("WavePower", Float) = 1
		_WaveOffset("WaveOffset", Range( -1 , 0)) = 0
		_vertexOffsetForce("vertexOffsetForce", Float) = 0.1
		_WaveLength("WaveLength", Float) = 10
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			float4 screenPos;
		};

		uniform float _WaveOffset;
		uniform float _WaveLength;
		uniform float _WavePower;
		uniform float _vertexOffsetForce;
		uniform float4 _RightColor;
		uniform float4 _LeftColor;
		uniform float _Tesselation;
		uniform float _TessPhongStrength;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 appendResult6 = (float4(_Tesselation , _Tesselation , _Tesselation , _Tesselation));
			return appendResult6;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 ase_vertexNormal = v.normal.xyz;
			float3 appendResult27 = (float3(0.0 , ase_vertexNormal.y , ase_vertexNormal.z));
			float4 ase_screenPos = ComputeScreenPos( UnityObjectToClipPos( v.vertex ) );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float smoothstepResult20 = smoothstep( 0.0 , 1.0 , ( ( ( ( ase_screenPosNorm.x * -1.0 ) + 1.0 ) + _WaveOffset ) * _WaveLength ));
			float temp_output_1_0_g1 = frac( smoothstepResult20 );
			float3 vertexOffset9 = ( appendResult27 * pow( ( 4.0 * temp_output_1_0_g1 * ( 1.0 - temp_output_1_0_g1 ) ) , _WavePower ) * _vertexOffsetForce );
			v.vertex.xyz += vertexOffset9;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float4 lerpResult5 = lerp( _RightColor , _LeftColor , ase_screenPosNorm.x);
			o.Albedo = lerpResult5.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
33.6;190.4;1448;790;2329.545;-132.9478;1.877216;True;True
Node;AmplifyShaderEditor.ScreenPosInputsNode;11;-2439.401,756.8002;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-2222.007,911.003;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-2330.4,1081.7;Float;False;Property;_WaveOffset;WaveOffset;6;0;Create;True;0;0;False;0;0;-0.1132104;-1;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-2080.307,938.303;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-1897.2,1013.1;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1933.453,1185.127;Float;False;Property;_WaveLength;WaveLength;8;0;Create;True;0;0;False;0;10;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-1641,1060.5;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;20;-1417.306,1308.803;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;16;-1195.101,1302.601;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1482,695.5;Float;False;Property;_WavePower;WavePower;5;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;25;-1152.656,617.0087;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;28;-940.3496,1194.401;Float;False;Property;_vertexOffsetForce;vertexOffsetForce;7;0;Create;True;0;0;False;0;0.1;0.005;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;27;-912.5712,751.932;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;12;-1138.701,925.3996;Float;True;Wave-Parabole;-1;;1;ec35a35444de0ee42b518733c5fe3da3;0;2;2;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4;-615,-139.5;Float;False;Property;_LeftColor;LeftColor;0;0;Create;True;0;0;False;0;0,1,1,0;0,1,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-414,-296.5;Float;False;Property;_RightColor;RightColor;1;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;2;-719,55.5;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;-745.9016,847.172;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-205,566.5;Float;False;Property;_Tesselation;Tesselation;3;0;Create;True;0;0;False;0;10;40;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5;-205,-20.5;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1;-319,263.5;Float;False;Property;_TransluencyColor;TransluencyColor;2;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;9;-517.0677,818.5977;Float;False;vertexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;8;14,241.5;Float;False;Property;_Emission;Emission;4;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;6;108,471.5;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;10;-33,342.5;Float;False;9;0;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;255,33;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;23/Muddy;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;True;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;23;0;11;1
WireConnection;24;0;23;0
WireConnection;14;0;24;0
WireConnection;14;1;15;0
WireConnection;17;0;14;0
WireConnection;17;1;29;0
WireConnection;20;0;17;0
WireConnection;16;0;20;0
WireConnection;27;1;25;2
WireConnection;27;2;25;3
WireConnection;12;2;13;0
WireConnection;12;1;16;0
WireConnection;26;0;27;0
WireConnection;26;1;12;0
WireConnection;26;2;28;0
WireConnection;5;0;3;0
WireConnection;5;1;4;0
WireConnection;5;2;2;1
WireConnection;9;0;26;0
WireConnection;6;0;7;0
WireConnection;6;1;7;0
WireConnection;6;2;7;0
WireConnection;6;3;7;0
WireConnection;0;0;5;0
WireConnection;0;11;10;0
WireConnection;0;14;6;0
ASEEND*/
//CHKSM=3B68567133964612DC061B86AD041F89E1691F46