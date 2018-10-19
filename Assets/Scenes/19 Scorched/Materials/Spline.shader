// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "19/Spline"
{
	Properties
	{
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		_Tesselation("Tesselation", Float) = 10
		_TimeScale("TimeScale", Float) = 1
		_offsetSinForce("offsetSinForce", Float) = 0.1
		_Albedo("Albedo", Color) = (0.1226415,0.1226415,0.1226415,0)
		_EmissionPower("EmissionPower", Float) = 2
		_EmissionTimeScale("EmissionTimeScale", Float) = 1
		_EmissionLength("EmissionLength", Float) = 0.1
		_EmissionHeight("EmissionHeight", Float) = 0.01
		_EmissionPosition("EmissionPosition", Float) = 0.5
		_Metallic("Metallic", Float) = 0
		_Smoothness("Smoothness", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _TimeScale;
		uniform float _offsetSinForce;
		uniform float4 _Albedo;
		uniform float _EmissionTimeScale;
		uniform float _EmissionPosition;
		uniform float _EmissionHeight;
		uniform float _EmissionLength;
		uniform float _EmissionPower;
		uniform float _Metallic;
		uniform float _Smoothness;
		uniform float _Tesselation;
		uniform float _TessPhongStrength;


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		float3 RGBToHSV(float3 c)
		{
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
			float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
			float d = q.x - min( q.w, q.y );
			float e = 1.0e-10;
			return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 appendResult1 = (float4(_Tesselation , _Tesselation , _Tesselation , _Tesselation));
			return appendResult1;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float mulTime4 = _Time.y * _TimeScale;
			float lerpResult18 = lerp( ( sin( mulTime4 ) * _offsetSinForce ) , 0.0 , v.texcoord.xy.x);
			float3 appendResult7 = (float3(0.0 , 0.0 , lerpResult18));
			v.vertex.xyz += appendResult7;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
			float3 hsvTorgb3_g2 = RGBToHSV( float4(1,0.8564792,0,0).rgb );
			float mulTime36 = _Time.y * _EmissionTimeScale;
			float temp_output_47_0 = ( ( frac( mulTime36 ) * -1.0 ) + 1.0 );
			float3 hsvTorgb6_g2 = HSVToRGB( float3(( hsvTorgb3_g2 + frac( temp_output_47_0 ) ).x,hsvTorgb3_g2.y,hsvTorgb3_g2.z) );
			float clampResult32 = clamp( ( ( step( i.uv_texcoord.y , ( _EmissionPosition + _EmissionHeight ) ) - step( i.uv_texcoord.y , _EmissionPosition ) ) * step( frac( ( mulTime36 + i.uv_texcoord.x ) ) , _EmissionLength ) ) , 0.0 , 1.0 );
			o.Emission = ( hsvTorgb6_g2 * clampResult32 * _EmissionPower );
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
2567;29;1906;1004;1644.388;692.1891;1.6;True;True
Node;AmplifyShaderEditor.RangedFloatNode;37;-3590.674,-88.01766;Float;False;Property;_EmissionTimeScale;EmissionTimeScale;5;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-2090.784,-186.5898;Float;False;Property;_EmissionHeight;EmissionHeight;7;0;Create;True;0;0;False;0;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-2023.584,-304.9884;Float;False;Property;_EmissionPosition;EmissionPosition;8;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;50;-3436.386,234.2114;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;36;-3368.373,-101.0177;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-1732,448;Float;False;Property;_TimeScale;TimeScale;1;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;22;-2232.47,-74.61761;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;56;-1849.185,26.21154;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;51;-3081.184,205.4114;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;57;-1687.584,-52.18848;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;4;-1515,438;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-2174.67,399.5828;Float;False;Property;_EmissionLength;EmissionLength;6;0;Create;True;0;0;False;0;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;52;-2781.986,269.4113;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;54;-1695.585,-282.5885;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;30;-3107.073,-251.8177;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;24;-1782.068,200.1823;Float;True;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;6;-1255,478;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;59;-1425.184,-151.3887;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1336,601;Float;False;Property;_offsetSinForce;offsetSinForce;2;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-2906.782,-298.5898;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;28;-1612.171,-461.9178;Float;False;Constant;_EmissionColor;EmissionColor;4;0;Create;True;0;0;False;0;1,0.8564792,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;20;-1497.4,828.3;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1054,522;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;47;-2740.383,-260.1898;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-1070.069,-16.01767;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-824.3708,234.8825;Float;False;Property;_EmissionPower;EmissionPower;4;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;18;-609,546;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;29;-1157.171,-273.4178;Float;False;HueOffset;-1;;2;fe943a50c2416964180c8a8e79051434;0;2;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-444,601;Float;False;Property;_Tesselation;Tesselation;0;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;32;-802.2708,54.18256;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-520.1709,76.28253;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;63;-282.7878,56.61088;Float;False;Property;_Metallic;Metallic;9;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-276.3878,179.8109;Float;False;Property;_Smoothness;Smoothness;10;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;11;-709.4,-300.3;Float;False;Property;_Albedo;Albedo;3;0;Create;True;0;0;False;0;0.1226415,0.1226415,0.1226415,0;0.1226415,0.1226415,0.1226415,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;7;-449,415;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-2580.968,-51.51787;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1;-175,557;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;19/Spline;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;True;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;36;0;37;0
WireConnection;56;0;55;0
WireConnection;56;1;48;0
WireConnection;51;0;36;0
WireConnection;51;1;50;1
WireConnection;57;0;22;2
WireConnection;57;1;56;0
WireConnection;4;0;5;0
WireConnection;52;0;51;0
WireConnection;54;0;22;2
WireConnection;54;1;55;0
WireConnection;30;0;36;0
WireConnection;24;0;52;0
WireConnection;24;1;35;0
WireConnection;6;0;4;0
WireConnection;59;0;57;0
WireConnection;59;1;54;0
WireConnection;46;0;30;0
WireConnection;8;0;6;0
WireConnection;8;1;9;0
WireConnection;47;0;46;0
WireConnection;25;0;59;0
WireConnection;25;1;24;0
WireConnection;18;0;8;0
WireConnection;18;2;20;1
WireConnection;29;1;28;0
WireConnection;29;2;47;0
WireConnection;32;0;25;0
WireConnection;33;0;29;0
WireConnection;33;1;32;0
WireConnection;33;2;34;0
WireConnection;7;2;18;0
WireConnection;39;0;47;0
WireConnection;1;0;2;0
WireConnection;1;1;2;0
WireConnection;1;2;2;0
WireConnection;1;3;2;0
WireConnection;0;0;11;0
WireConnection;0;2;33;0
WireConnection;0;3;63;0
WireConnection;0;4;64;0
WireConnection;0;11;7;0
WireConnection;0;14;1;0
ASEEND*/
//CHKSM=65DD709C68ADF6E8FC7837FE5DFDEAC38B64403C