// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "29/Circle"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_circleParams("circleParams", Vector) = (0.9,0.02,0,0)
		_noiseSize("noiseSize", Vector) = (2,2,0,0)
		_noiseScale("noiseScale", Float) = 1
		_Color0("Color 0", Color) = (1,1,1,0)
		_Emission("Emission", Float) = 1
		_worldScale("worldScale", Float) = 1
		_noiseStep("noiseStep", Float) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
		};

		uniform float _Emission;
		uniform float4 _Color0;
		uniform float _worldScale;
		uniform float2 _circleParams;
		uniform float2 _noiseSize;
		uniform float _noiseScale;
		uniform float _noiseStep;
		uniform float _Cutoff = 0.5;


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
			float3 hsvTorgb3_g8 = RGBToHSV( _Color0.rgb );
			float3 ase_worldPos = i.worldPos;
			float temp_output_18_0 = ( _worldScale * ase_worldPos.z );
			float3 hsvTorgb6_g8 = HSVToRGB( float3(( hsvTorgb3_g8 + frac( frac( temp_output_18_0 ) ) ).x,hsvTorgb3_g8.y,hsvTorgb3_g8.z) );
			o.Emission = ( _Emission * hsvTorgb6_g8 );
			o.Alpha = 1;
			float2 temp_output_10_0_g1 = i.uv_texcoord;
			float2 temp_output_13_0_g1 = float2( 0.5,0.5 );
			float temp_output_6_0_g1 = _circleParams.x;
			float2 uv_TexCoord5 = i.uv_texcoord * _noiseSize;
			float mulTime8 = _Time.y * _noiseScale;
			float cos7 = cos( mulTime8 );
			float sin7 = sin( mulTime8 );
			float2 rotator7 = mul( ( temp_output_18_0 * uv_TexCoord5 ) - float2( 0.5,0.5 ) , float2x2( cos7 , -sin7 , sin7 , cos7 )) + float2( 0.5,0.5 );
			float simplePerlin2D4 = snoise( rotator7 );
			float lerpResult11 = lerp( 0.0 , ( step( distance( temp_output_10_0_g1 , temp_output_13_0_g1 ) , ( ( _circleParams.y + temp_output_6_0_g1 ) * 0.5 ) ) - step( distance( temp_output_10_0_g1 , temp_output_13_0_g1 ) , ( temp_output_6_0_g1 * 0.5 ) ) ) , step( simplePerlin2D4 , _noiseStep ));
			clip( lerpResult11 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
2696;36;1906;1010;2074.043;262.537;1.3;True;True
Node;AmplifyShaderEditor.Vector2Node;6;-1823.8,375.5001;Float;False;Property;_noiseSize;noiseSize;2;0;Create;True;0;0;False;0;2,2;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;19;-1899.9,-206.2;Float;False;Property;_worldScale;worldScale;6;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;16;-1963.001,2.600075;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1594.8,313.5001;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-1597.9,16.8;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1542.2,646.1;Float;False;Property;_noiseScale;noiseScale;3;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-1247.245,378.3634;Float;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;8;-1328.2,629.1;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;7;-1083.2,503.1;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-806.5427,677.3629;Float;False;Property;_noiseStep;noiseStep;7;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;4;-771.2,374.1;Float;True;Simplex2D;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1324,-32;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;3;-1208,147;Float;False;Property;_circleParams;circleParams;1;0;Create;True;0;0;False;0;0.9,0.02;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.ColorNode;12;-530,-214;Float;False;Property;_Color0;Color 0;4;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FractNode;17;-509,-4;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;21;-533.5427,466.763;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-221,-276;Float;False;Property;_Emission;Emission;5;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;15;-223,-25;Float;False;HueOffset;-1;;8;fe943a50c2416964180c8a8e79051434;0;2;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1;-937,59;Float;False;Shape-CircleOutlined;-1;;1;70537716381e1ae45b39693927da8a86;0;4;13;FLOAT2;0.5,0.5;False;10;FLOAT2;0,0;False;6;FLOAT;0.5;False;7;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;25,-32;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;11;-417,157;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;189,-22;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;29/Circle;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;18;0;19;0
WireConnection;18;1;16;3
WireConnection;20;0;18;0
WireConnection;20;1;5;0
WireConnection;8;0;10;0
WireConnection;7;0;20;0
WireConnection;7;2;8;0
WireConnection;4;0;7;0
WireConnection;17;0;18;0
WireConnection;21;0;4;0
WireConnection;21;1;22;0
WireConnection;15;1;12;0
WireConnection;15;2;17;0
WireConnection;1;10;2;0
WireConnection;1;6;3;1
WireConnection;1;7;3;2
WireConnection;13;0;14;0
WireConnection;13;1;15;0
WireConnection;11;1;1;0
WireConnection;11;2;21;0
WireConnection;0;2;13;0
WireConnection;0;10;11;0
ASEEND*/
//CHKSM=078A2A74E1878CF9575DF892BB668C71325D08E7