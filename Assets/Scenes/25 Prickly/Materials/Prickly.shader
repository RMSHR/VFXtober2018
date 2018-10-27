// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "25/Prickly"
{
	Properties
	{
		_Albedo("Albedo", Color) = (0.2169811,0.2169811,0.2169811,0)
		_WorldSize("WorldSize", Float) = 1
		_EmissionColor("EmissionColor", Color) = (0,0.8187747,1,0)
		_voOffset("voOffset", Float) = 0
		_voSize("voSize", Float) = 0
		_voParabole("voParabole", Float) = 0
		_worldOffset("worldOffset", Vector) = (0,0,0,0)
		_Emissioin("Emissioin", Float) = 0
		_hueSize("hueSize", Float) = 1
		_hueOffset("hueOffset", Float) = 0
		_voEffect("voEffect", Range( 0 , 1)) = 0
		_randomFactor("randomFactor", Float) = 512
		_RandomIntensity("RandomIntensity", Float) = 0
		_randomSpeed("randomSpeed", Float) = 1
		_smallWaveDirection("smallWaveDirection", Vector) = (0,0,0,0)
		_smallwaveIntensity("smallwaveIntensity", Float) = 0
		_smallWaveTime("smallWaveTime", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
		};

		uniform float _voParabole;
		uniform float _voOffset;
		uniform float _voSize;
		uniform float3 _smallWaveDirection;
		uniform float _smallWaveTime;
		uniform float _smallwaveIntensity;
		uniform float2 _worldOffset;
		uniform float _WorldSize;
		uniform float _randomSpeed;
		uniform float _randomFactor;
		uniform float _RandomIntensity;
		uniform float _voEffect;
		uniform float4 _Albedo;
		uniform float4 _EmissionColor;
		uniform float _hueOffset;
		uniform float _hueSize;
		uniform float _Emissioin;


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


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float smoothstepResult37 = smoothstep( 0.0 , 1.0 , ( ( ase_worldPos.x + _voOffset ) * _voSize ));
			float temp_output_1_0_g6 = frac( smoothstepResult37 );
			float mulTime74 = _Time.y * _smallWaveTime;
			float temp_output_68_0 = ( sin( ( v.texcoord.xy.y + mulTime74 ) ) * _smallwaveIntensity );
			float3 appendResult70 = (float3(( _smallWaveDirection.x * temp_output_68_0 ) , 0.0 , ( _smallWaveDirection.z * temp_output_68_0 )));
			float3 break72 = ( ( _voParabole * pow( ( 4.0 * temp_output_1_0_g6 * ( 1.0 - temp_output_1_0_g6 ) ) , 1.0 ) ) + appendResult70 );
			float3 appendResult20 = (float3(break72.x , 0.0 , break72.z));
			float3 vo10 = appendResult20;
			float2 appendResult30 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 temp_output_5_0 = ( ( appendResult30 + _worldOffset ) * _WorldSize );
			float2 worldNoise52 = temp_output_5_0;
			float mulTime57 = _Time.y * _randomSpeed;
			float2 break51 = ( worldNoise52 + mulTime57 );
			float3 appendResult42 = (float3(( frac( sin( ( break51.x * _randomFactor ) ) ) * v.texcoord.xy.y * _RandomIntensity ) , 0.0 , ( frac( sin( ( break51.y * _randomFactor ) ) ) * v.texcoord.xy.y * _RandomIntensity )));
			float3 tremblement41 = appendResult42;
			float3 lerpResult44 = lerp( vo10 , tremblement41 , _voEffect);
			v.vertex.xyz += lerpResult44;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
			float3 hsvTorgb3_g7 = RGBToHSV( _EmissionColor.rgb );
			float3 ase_worldPos = i.worldPos;
			float3 hsvTorgb6_g7 = HSVToRGB( float3(( hsvTorgb3_g7 + frac( ( ( ase_worldPos.x + _hueOffset ) * _hueSize ) ) ).x,hsvTorgb3_g7.y,hsvTorgb3_g7.z) );
			float2 appendResult30 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 temp_output_5_0 = ( ( appendResult30 + _worldOffset ) * _WorldSize );
			float simplePerlin2D23 = snoise( temp_output_5_0 );
			float3 lerpResult9 = lerp( hsvTorgb6_g7 , float3( 0,0,0 ) , simplePerlin2D23);
			o.Emission = ( lerpResult9 * _Emissioin );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
18.4;132.8;1448;768;1012.598;-1209.136;1.338898;True;True
Node;AmplifyShaderEditor.CommentaryNode;40;-1411.481,918.383;Float;False;1459;654.709;Wave offset;10;12;14;16;13;15;37;38;39;18;22;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldPosInputsNode;12;-1361.481,1003.383;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;75;-557.374,1657.667;Float;False;Property;_smallWaveTime;smallWaveTime;17;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2;-1402,443.5;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;14;-1356.481,1169.383;Float;False;Property;_voOffset;voOffset;3;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;61;-346.9494,1529.132;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;74;-294.9497,1648.295;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;29;-1286.543,620.5092;Float;False;Property;_worldOffset;worldOffset;7;0;Create;True;0;0;False;0;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;30;-1192.543,501.5092;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;13;-1133.481,1064.383;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1180.481,1271.383;Float;False;Property;_voSize;voSize;4;0;Create;True;0;0;False;0;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-1112,699.5;Float;False;Property;_WorldSize;WorldSize;1;0;Create;True;0;0;False;0;1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-961.4813,1158.383;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3;-1061,518.5;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;73;-90.09805,1575.994;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-911,549.5;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;69;147.1045,1783.523;Float;False;Property;_smallwaveIntensity;smallwaveIntensity;16;0;Create;True;0;0;False;0;0;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;37;-780.0248,1303.892;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-1849.312,1889.296;Float;False;Property;_randomSpeed;randomSpeed;14;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;67;264.9275,1654.989;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;52;-538.333,794.7115;Float;False;worldNoise;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;410.8674,1692.478;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;62;177.8985,1430.054;Float;False;Property;_smallWaveDirection;smallWaveDirection;15;0;Create;True;0;0;False;0;0,0,0;1,0,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FractNode;38;-565.0248,1411.892;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;53;-1656.994,1629.659;Float;False;52;0;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;57;-1647.184,1885.296;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;556.8068,1498.337;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;59;-1382.037,1738;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;39;-452.0248,1440.892;Float;False;Wave-Parabole;-1;;6;ec35a35444de0ee42b518733c5fe3da3;0;2;2;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-396.857,1237.501;Float;False;Property;_voParabole;voParabole;5;0;Create;True;0;0;False;0;0;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;548.7734,1376.498;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;32;-1248.543,158.5092;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;48;-1333.461,2014.065;Float;False;Property;_randomFactor;randomFactor;12;0;Create;True;0;0;False;0;512;512;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-142.363,1269.755;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;51;-1233.036,1737.638;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;36;-1246.543,347.5092;Float;False;Property;_hueOffset;hueOffset;10;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;70;841.9927,1458.171;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;33;-1045.543,214.5092;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-985.0681,2244.215;Float;False;Property;_RandomIntensity;RandomIntensity;13;0;Create;True;0;0;False;0;0;0.002;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1036.543,342.5092;Float;False;Property;_hueSize;hueSize;9;0;Create;True;0;0;False;0;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;47;-795.6906,1744.36;Float;False;Random;-1;;5;542ea883f97451b44822d4bfebf90e34;0;2;10;FLOAT;512;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;46;-1039.286,2068.75;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;71;93.54871,1265.369;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;49;-805.4548,1844.171;Float;False;Random;-1;;4;542ea883f97451b44822d4bfebf90e34;0;2;10;FLOAT;512;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-529.4544,1937.742;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;7;-738,-44.5;Float;False;Property;_EmissionColor;EmissionColor;2;0;Create;True;0;0;False;0;0,0.8187747,1,0;0,0.8187747,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;72;274.0996,1277.42;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;-529.4547,1760.739;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-876.5435,262.5092;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;23;-503.1459,576.7653;Float;False;Simplex2D;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;42;-343.8572,1784.502;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;20;493.5685,1110.822;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;31;-470.5435,229.5092;Float;False;HueOffset;-1;;7;fe943a50c2416964180c8a8e79051434;0;2;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;11;-27,419;Float;False;10;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-22.54346,321.5092;Float;False;Property;_Emissioin;Emissioin;8;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;10;629.5687,1109.822;Float;False;vo;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;43;-54.18552,518.4091;Float;False;41;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;41;-164.0684,1755.432;Float;False;tremblement;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;45;-178.9505,654.0232;Float;False;Property;_voEffect;voEffect;11;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;9;-74,170.5;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;163.4565,188.5092;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector2Node;25;-923.5435,657.5092;Float;False;Property;_NoiseSize;NoiseSize;6;0;Create;True;0;0;False;0;0,0;0.1,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;44;206.1935,515.1544;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;1;-468,-230.5;Float;False;Property;_Albedo;Albedo;0;0;Create;True;0;0;False;0;0.2169811,0.2169811,0.2169811,0;0.2169811,0.2169811,0.2169811,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;339,51;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;25/Prickly;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;74;0;75;0
WireConnection;30;0;2;1
WireConnection;30;1;2;3
WireConnection;13;0;12;1
WireConnection;13;1;14;0
WireConnection;15;0;13;0
WireConnection;15;1;16;0
WireConnection;3;0;30;0
WireConnection;3;1;29;0
WireConnection;73;0;61;2
WireConnection;73;1;74;0
WireConnection;5;0;3;0
WireConnection;5;1;6;0
WireConnection;37;0;15;0
WireConnection;67;0;73;0
WireConnection;52;0;5;0
WireConnection;68;0;67;0
WireConnection;68;1;69;0
WireConnection;38;0;37;0
WireConnection;57;0;60;0
WireConnection;63;0;62;3
WireConnection;63;1;68;0
WireConnection;59;0;53;0
WireConnection;59;1;57;0
WireConnection;39;1;38;0
WireConnection;64;0;62;1
WireConnection;64;1;68;0
WireConnection;22;0;18;0
WireConnection;22;1;39;0
WireConnection;51;0;59;0
WireConnection;70;0;64;0
WireConnection;70;2;63;0
WireConnection;33;0;32;1
WireConnection;33;1;36;0
WireConnection;47;10;48;0
WireConnection;47;8;51;0
WireConnection;71;0;22;0
WireConnection;71;1;70;0
WireConnection;49;10;48;0
WireConnection;49;8;51;1
WireConnection;55;0;49;0
WireConnection;55;1;46;2
WireConnection;55;2;56;0
WireConnection;72;0;71;0
WireConnection;54;0;47;0
WireConnection;54;1;46;2
WireConnection;54;2;56;0
WireConnection;34;0;33;0
WireConnection;34;1;35;0
WireConnection;23;0;5;0
WireConnection;42;0;54;0
WireConnection;42;2;55;0
WireConnection;20;0;72;0
WireConnection;20;2;72;2
WireConnection;31;1;7;0
WireConnection;31;2;34;0
WireConnection;10;0;20;0
WireConnection;41;0;42;0
WireConnection;9;0;31;0
WireConnection;9;2;23;0
WireConnection;26;0;9;0
WireConnection;26;1;27;0
WireConnection;44;0;11;0
WireConnection;44;1;43;0
WireConnection;44;2;45;0
WireConnection;0;0;1;0
WireConnection;0;2;26;0
WireConnection;0;11;44;0
ASEEND*/
//CHKSM=94121A2FF3FED450FD49AE26C07D29DB8E250ED9