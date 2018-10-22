// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "22/Expensive"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Emission("Emission", Float) = 1
		_EmissionColor("EmissionColor", Color) = (1,1,1,0)
		_NoiseSize("NoiseSize", Vector) = (3,3,0,0)
		_NoiseForce("NoiseForce", Float) = 5
		_Thickess("Thickess", Float) = 0.01
		_Radius("Radius", Float) = 0.9
		_TimeScale("TimeScale", Float) = 0.1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform float _Emission;
		uniform float4 _EmissionColor;
		uniform float _Thickess;
		uniform float _Radius;
		uniform float2 _NoiseSize;
		uniform float _TimeScale;
		uniform float _NoiseForce;
		uniform float _Cutoff = 0.5;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Emission = ( _Emission * _EmissionColor ).rgb;
			o.Alpha = 1;
			float2 temp_output_10_0_g1 = i.uv_texcoord;
			float2 temp_output_13_0_g1 = float2( 0.5,0.5 );
			float temp_output_6_0_g1 = _Radius;
			float3 ase_worldPos = i.worldPos;
			float2 appendResult22 = (float2(ase_worldPos.y , 0.0));
			float2 uv_TexCoord9 = i.uv_texcoord * _NoiseSize + appendResult22;
			float mulTime24 = _Time.y * _TimeScale;
			float cos6 = cos( mulTime24 );
			float sin6 = sin( mulTime24 );
			float2 rotator6 = mul( uv_TexCoord9 - float2( 1,1 ) , float2x2( cos6 , -sin6 , sin6 , cos6 )) + float2( 1,1 );
			float simplePerlin2D8 = snoise( rotator6 );
			float lerpResult13 = lerp( ( step( distance( temp_output_10_0_g1 , temp_output_13_0_g1 ) , ( ( _Thickess + temp_output_6_0_g1 ) * 0.5 ) ) - step( distance( temp_output_10_0_g1 , temp_output_13_0_g1 ) , ( temp_output_6_0_g1 * 0.5 ) ) ) , 0.0 , saturate( ( simplePerlin2D8 * _NoiseForce ) ));
			clip( lerpResult13 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
6.4;24;1448;795;2051.448;179.0027;1.3;True;False
Node;AmplifyShaderEditor.WorldPosInputsNode;21;-2121.648,782.9973;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;22;-1794.048,756.9973;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;11;-2060.2,484.1;Float;False;Property;_NoiseSize;NoiseSize;3;0;Create;True;0;0;False;0;3,3;3,3;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;23;-1730.349,889.597;Float;False;Property;_TimeScale;TimeScale;7;0;Create;True;0;0;False;0;0.1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1667.8,513.9;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;24;-1415.749,840.1972;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;6;-1357.66,527.1027;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-1102.449,775.197;Float;False;Property;_NoiseForce;NoiseForce;4;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;8;-1129.9,527.8;Float;True;Simplex2D;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-889.2493,675.097;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-1316.948,425.497;Float;False;Property;_Thickess;Thickess;5;0;Create;True;0;0;False;0;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1314.348,316.2971;Float;False;Property;_Radius;Radius;6;0;Create;True;0;0;False;0;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1591.36,194.103;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2;-588.0998,-29.40001;Float;False;Property;_EmissionColor;EmissionColor;2;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;16;-752.7493,580.1971;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4;-1039.36,171.103;Float;True;Shape-CircleOutlined;-1;;1;70537716381e1ae45b39693927da8a86;0;4;13;FLOAT2;0.5,0.5;False;10;FLOAT2;0,0;False;6;FLOAT;0.5;False;7;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-305,-41.5;Float;False;Property;_Emission;Emission;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;13;-604.1403,464.0686;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-206,99.5;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;22/Expensive;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;0;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;22;0;21;2
WireConnection;9;0;11;0
WireConnection;9;1;22;0
WireConnection;24;0;23;0
WireConnection;6;0;9;0
WireConnection;6;2;24;0
WireConnection;8;0;6;0
WireConnection;17;0;8;0
WireConnection;17;1;18;0
WireConnection;16;0;17;0
WireConnection;4;10;5;0
WireConnection;4;6;20;0
WireConnection;4;7;19;0
WireConnection;13;0;4;0
WireConnection;13;2;16;0
WireConnection;3;0;1;0
WireConnection;3;1;2;0
WireConnection;0;2;3;0
WireConnection;0;10;13;0
ASEEND*/
//CHKSM=0F914D3D80327D1A12404D5AD0019C08627B5CFE