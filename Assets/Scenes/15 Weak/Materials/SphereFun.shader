// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "15/Weak"
{
	Properties
	{
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		_Tessellation("Tessellation", Float) = 10
		_Albedo("Albedo", Color) = (0.1132075,0.1132075,0.1132075,0)
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_worldScale("worldScale", Float) = 10
		_TimeScale("TimeScale", Float) = 1
		_NormalScale("NormalScale", Float) = 0.1
		_NoiseScale("NoiseScale", Float) = 1
		_NoiseTime("NoiseTime", Float) = 0.1
		_NoiseRandomA("NoiseRandomA", Float) = 512
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
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows noshadow exclude_path:deferred vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			fixed filler;
		};

		uniform float _NoiseScale;
		uniform float _NoiseTime;
		uniform float _NoiseRandomA;
		uniform float _NormalScale;
		uniform float _TimeScale;
		uniform float _worldScale;
		uniform float4 _Albedo;
		uniform float _Metallic;
		uniform float _Smoothness;
		uniform float _Tessellation;
		uniform float _TessPhongStrength;


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


		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 appendResult1 = (float4(_Tessellation , _Tessellation , _Tessellation , _Tessellation));
			return appendResult1;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float2 appendResult28 = (float2(ase_worldPos.x , ase_worldPos.z));
			float mulTime47 = _Time.y * _NoiseTime;
			float simplePerlin2D26 = snoise( ( appendResult28 * _NoiseScale * frac( sin( ( mulTime47 * _NoiseRandomA ) ) ) ) );
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float mulTime46 = _Time.y * _TimeScale;
			float temp_output_10_0 = sin( ( ( ase_worldPos.y + mulTime46 ) * _worldScale ) );
			v.vertex.xyz += ( ( simplePerlin2D26 * ase_worldNormal * _NormalScale ) + ( ( ase_worldNormal * _NormalScale ) * temp_output_10_0 ) );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
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
2567;29;1906;1004;3453.974;-206.3407;1.739821;True;True
Node;AmplifyShaderEditor.RangedFloatNode;15;-2445.211,1696.856;Float;False;Property;_TimeScale;TimeScale;13;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-2815.691,884.3809;Float;False;Property;_NoiseTime;NoiseTime;16;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;6;-2044.46,1452.73;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;46;-2106.755,1761.339;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;-2585.312,677.0469;Float;False;Property;_NoiseRandomA;NoiseRandomA;17;0;Create;True;0;0;False;0;512;512;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;47;-2615.553,890.6039;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;27;-2204.296,586.4371;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;8;-1619.46,1709.73;Float;False;Property;_worldScale;worldScale;8;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;51;-2252.711,859.9043;Float;True;Random;-1;;1;542ea883f97451b44822d4bfebf90e34;0;2;10;FLOAT;512;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-1816.46,1551.73;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;28;-1961.297,610.4371;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-2225.181,742.6778;Float;False;Property;_NoiseScale;NoiseScale;15;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-1447.459,1602.73;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;22;-1655.732,1058.643;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-1749.298,639.4371;Float;False;3;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-1649.14,1224.456;Float;False;Property;_NormalScale;NormalScale;14;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-1312.947,1162.919;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;26;-1584.534,615.3954;Float;False;Simplex2D;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;10;-1280.46,1573.73;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-530.717,1288.807;Float;False;Property;_Tessellation;Tessellation;0;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;-1284.775,853.5541;Float;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1025.514,1169.348;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1;-194.5732,1147.14;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-905.7028,249.0345;Float;False;Property;_Emission;Emission;5;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-1235.796,266.2867;Float;False;Property;_FresnelBias;FresnelBias;10;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1216.243,433.0587;Float;False;Property;_FresnelPower;FresnelPower;11;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-1059.46,1621.73;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-593,-146;Float;False;Property;_Smoothness;Smoothness;4;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;36;-871.1982,-97.16089;Float;False;Property;_FresnelColor;FresnelColor;7;0;Create;True;0;0;False;0;0,0.6819522,1,0;0,0.6819522,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-565.2581,73.06143;Float;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1242.46,1793.73;Float;False;Property;_WaveForce;WaveForce;12;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;35;-881.55,93.76408;Float;False;Tangent;4;0;FLOAT3;0,0,1;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-726.2849,495.2336;Float;False;Property;_TransmissionForce;TransmissionForce;2;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3;-790,-580;Float;False;Property;_Albedo;Albedo;3;0;Create;True;0;0;False;0;0.1132075,0.1132075,0.1132075,0;0.1132075,0.1132075,0.1132075,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;54;-2371.68,1180.627;Float;False;Property;_NoiseRandomB;NoiseRandomB;18;0;Create;True;0;0;False;0;62;62;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;57;-838.2644,924.3396;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-423.0121,336.8275;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;23;-708.6841,279.9638;Float;False;Property;_TransmissionColor;TransmissionColor;1;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;-1224.294,347.9475;Float;False;Property;_FresnelScale;FresnelScale;9;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-594,-240;Float;False;Property;_Metallic;Metallic;6;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;15/Weak;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;True;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;0;0;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;46;0;15;0
WireConnection;47;0;49;0
WireConnection;51;10;52;0
WireConnection;51;8;47;0
WireConnection;14;0;6;2
WireConnection;14;1;46;0
WireConnection;28;0;27;1
WireConnection;28;1;27;3
WireConnection;7;0;14;0
WireConnection;7;1;8;0
WireConnection;29;0;28;0
WireConnection;29;1;30;0
WireConnection;29;2;51;0
WireConnection;20;0;22;0
WireConnection;20;1;21;0
WireConnection;26;0;29;0
WireConnection;10;0;7;0
WireConnection;58;0;26;0
WireConnection;58;1;22;0
WireConnection;58;2;21;0
WireConnection;19;0;20;0
WireConnection;19;1;10;0
WireConnection;1;0;2;0
WireConnection;1;1;2;0
WireConnection;1;2;2;0
WireConnection;1;3;2;0
WireConnection;11;0;10;0
WireConnection;11;1;12;0
WireConnection;37;0;36;0
WireConnection;37;1;35;0
WireConnection;37;2;38;0
WireConnection;35;1;39;0
WireConnection;35;2;40;0
WireConnection;35;3;41;0
WireConnection;57;0;58;0
WireConnection;57;1;19;0
WireConnection;24;0;23;0
WireConnection;24;1;25;0
WireConnection;0;0;3;0
WireConnection;0;3;4;0
WireConnection;0;4;5;0
WireConnection;0;11;57;0
WireConnection;0;14;1;0
ASEEND*/
//CHKSM=492C021EF00729719B57947181BB2EF3C7FE13AF