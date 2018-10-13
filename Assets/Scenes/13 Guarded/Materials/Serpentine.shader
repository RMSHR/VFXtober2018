// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "13/SerpentineB"
{
	Properties
	{
		_m("m", Float) = 0
		_r("r", Float) = 0
		_emission("emission", Float) = 1
		_Albedo("Albedo", Color) = (0.1886792,0.1886792,0.1886792,0)
		_polarSub("polarSub", Float) = 0.5
		_polarMul("polarMul", Float) = 2
		_rotation("rotation", Float) = 0
		_length("length", Float) = 1
		_ColorB("ColorB", Color) = (1,0.8081141,0,0)
		_yellowPointOffset("yellowPointOffset", Float) = 0.1
		_yellowLineHeight("yellowLineHeight", Float) = 8
		_yellowLineNumber("yellowLineNumber", Float) = 0
		_yellowPointLength("yellowPointLength", Float) = 0
		_yellowLineLength("yellowLineLength", Float) = 0.25
		_yellowLineIntensity("yellowLineIntensity", Float) = 0.2
		_yellowPointHeight("yellowPointHeight", Float) = 0.01
		_yellowLineOffset("yellowLineOffset", Float) = 0
		_ColorA("ColorA", Color) = (1,0.06119459,0,0)
		_redPointOffset("redPointOffset", Float) = 0
		_redLineHeight("redLineHeight", Float) = 0.1
		_redLineNumber("redLineNumber", Float) = 7
		_redPointLength("redPointLength", Float) = 0
		_redLineLength("redLineLength", Float) = 0.25
		_redLineIntensity("redLineIntensity", Float) = 0.2
		_redPointHeight("redPointHeight", Float) = 0.1
		_redLineOffset("redLineOffset", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
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
			float2 uv2_texcoord2;
		};

		uniform float4 _Albedo;
		uniform float _emission;
		uniform float4 _ColorB;
		uniform float _yellowLineOffset;
		uniform float _yellowLineNumber;
		uniform float _yellowLineHeight;
		uniform float _yellowLineIntensity;
		uniform float _polarSub;
		uniform float _polarMul;
		uniform float _length;
		uniform float _rotation;
		uniform float _yellowLineLength;
		uniform float _yellowPointOffset;
		uniform float _yellowPointHeight;
		uniform float _yellowPointLength;
		uniform float4 _ColorA;
		uniform float _redLineOffset;
		uniform float _redLineNumber;
		uniform float _redLineHeight;
		uniform float _redLineIntensity;
		uniform float _redLineLength;
		uniform float _redPointOffset;
		uniform float _redPointHeight;
		uniform float _redPointLength;
		uniform float _m;
		uniform float _r;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
			float temp_output_37_0_g5 = _yellowLineOffset;
			float2 appendResult36_g5 = (float2(0.0 , temp_output_37_0_g5));
			float2 uv_TexCoord5_g5 = i.uv_texcoord + appendResult36_g5;
			float temp_output_35_0_g5 = _yellowLineNumber;
			float2 appendResult28 = (float2(i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float2 appendResult32 = (float2(_polarSub , _polarSub));
			float2 appendResult34 = (float2(_polarMul , _polarMul));
			float2 break24 = ( ( appendResult28 - appendResult32 ) * appendResult34 );
			float PolarPos70 = frac( ( ( ( ( ( atan2( break24.y , break24.x ) + 4.0 ) * 0.125 ) * -1.0 ) * _length ) + _rotation ) );
			float temp_output_31_0_g5 = PolarPos70;
			float temp_output_30_0_g5 = _yellowLineLength;
			float temp_output_21_0_g5 = step( temp_output_31_0_g5 , temp_output_30_0_g5 );
			float2 appendResult39_g5 = (float2(0.0 , ( temp_output_37_0_g5 + _yellowPointOffset )));
			float2 uv_TexCoord6_g5 = i.uv_texcoord + appendResult39_g5;
			float temp_output_20_0_g5 = step( frac( ( uv_TexCoord6_g5.y * temp_output_35_0_g5 ) ) , _yellowPointHeight );
			float temp_output_37_0_g4 = _redLineOffset;
			float2 appendResult36_g4 = (float2(0.0 , temp_output_37_0_g4));
			float2 uv_TexCoord5_g4 = i.uv_texcoord + appendResult36_g4;
			float temp_output_35_0_g4 = _redLineNumber;
			float temp_output_31_0_g4 = PolarPos70;
			float temp_output_30_0_g4 = _redLineLength;
			float temp_output_21_0_g4 = step( temp_output_31_0_g4 , temp_output_30_0_g4 );
			float2 appendResult39_g4 = (float2(0.0 , ( temp_output_37_0_g4 + _redPointOffset )));
			float2 uv_TexCoord6_g4 = i.uv_texcoord + appendResult39_g4;
			float temp_output_20_0_g4 = step( frac( ( uv_TexCoord6_g4.y * temp_output_35_0_g4 ) ) , _redPointHeight );
			o.Emission = ( _emission * ( ( _ColorB * ( ( ( step( frac( ( uv_TexCoord5_g5.y * temp_output_35_0_g5 ) ) , _yellowLineHeight ) * _yellowLineIntensity ) * temp_output_21_0_g5 ) + ( ( temp_output_20_0_g5 * step( temp_output_31_0_g5 , ( temp_output_30_0_g5 + _yellowPointLength ) ) ) - ( temp_output_20_0_g5 * temp_output_21_0_g5 ) ) ) ) + ( _ColorA * ( ( ( step( frac( ( uv_TexCoord5_g4.y * temp_output_35_0_g4 ) ) , _redLineHeight ) * _redLineIntensity ) * temp_output_21_0_g4 ) + ( ( temp_output_20_0_g4 * step( temp_output_31_0_g4 , ( temp_output_30_0_g4 + _redPointLength ) ) ) - ( temp_output_20_0_g4 * temp_output_21_0_g4 ) ) ) ) ) ).rgb;
			o.Metallic = _m;
			o.Smoothness = _r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
-261;362;1587;842;949.1542;151.629;1.953292;True;False
Node;AmplifyShaderEditor.CommentaryNode;50;-3501.768,1564.667;Float;False;310;206;UVS 2;1;39;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-3159.402,1913.163;Float;False;Property;_polarSub;polarSub;6;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-3451.768,1633.235;Float;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;28;-3043.285,1685.073;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-3146.96,2027.208;Float;False;Property;_polarMul;polarMul;7;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;32;-2985.224,1886.207;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;22;-2855.928,1682.412;Float;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;34;-2935.458,2043.797;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-2663.928,1708.412;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;24;-2418.926,1740.412;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ATan2OpNode;25;-2132.699,1746.411;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;41;-1803.299,1707.882;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-1664.372,1720.324;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0.125;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-1320.424,1739.264;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-1294.844,1891.099;Float;False;Property;_length;length;9;0;Create;True;0;0;False;0;1;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-1068.149,1794.192;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;-1018.523,2028.669;Float;False;Property;_rotation;rotation;8;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;-623.3516,1880.41;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;43;-486.0865,1832.268;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;85;80.6808,1345.459;Float;False;Property;_redLineOffset;redLineOffset;27;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;93;69.565,1190.497;Float;False;Property;_redLineIntensity;redLineIntensity;25;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;99;1.078857,139.3514;Float;False;Property;_yellowLineNumber;yellowLineNumber;13;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;87;83.13947,967.2551;Float;False;Property;_redLineNumber;redLineNumber;22;0;Create;True;0;0;False;0;7;7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;81.40807,1045.022;Float;False;Property;_redPointLength;redPointLength;23;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;99.53857,1263.392;Float;False;Property;_redPointHeight;redPointHeight;26;0;Create;True;0;0;False;0;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;84;86.03513,1121.395;Float;False;Property;_redLineLength;redLineLength;24;0;Create;True;0;0;False;0;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;92;89.39773,885.407;Float;False;Property;_redLineHeight;redLineHeight;21;0;Create;True;0;0;False;0;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;91.34787,803.5194;Float;False;Property;_redPointOffset;redPointOffset;20;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;104;2.432129,523.6865;Float;False;Property;_yellowLineOffset;yellowLineOffset;18;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;70;-238.5171,1864.873;Float;False;PolarPos;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;1.078857,451.9619;Float;False;Property;_yellowPointHeight;yellowPointHeight;17;0;Create;True;0;0;False;0;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;98;-5.687622,63.56704;Float;False;Property;_yellowLineHeight;yellowLineHeight;12;0;Create;True;0;0;False;0;8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;102;5.138672,359.938;Float;False;Property;_yellowLineIntensity;yellowLineIntensity;16;0;Create;True;0;0;False;0;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;101;2.432129,282.8004;Float;False;Property;_yellowLineLength;yellowLineLength;15;0;Create;True;0;0;False;0;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;100;2.432129,205.6627;Float;False;Property;_yellowPointLength;yellowPointLength;14;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;71;-440.6436,504.9543;Float;False;70;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-17.86731,-29.81013;Float;False;Property;_yellowPointOffset;yellowPointOffset;11;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;89;414.5443,936.5829;Float;False;SerpFunction;-1;;4;173eef3eadaac774dbb8709618fc3f3e;0;9;40;FLOAT;0;False;33;FLOAT;0.1;False;31;FLOAT;0;False;35;FLOAT;10;False;29;FLOAT;0.01;False;30;FLOAT;0.5;False;32;FLOAT;0.5;False;34;FLOAT;0.01;False;37;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;94;572.3997,-129.7923;Float;False;Property;_ColorB;ColorB;10;0;Create;True;0;0;False;0;1,0.8081141,0,0;1,0.8081141,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;96;532.0614,258.4658;Float;False;SerpFunction;-1;;5;173eef3eadaac774dbb8709618fc3f3e;0;9;40;FLOAT;0;False;33;FLOAT;0.1;False;31;FLOAT;0;False;35;FLOAT;10;False;29;FLOAT;0.01;False;30;FLOAT;0.5;False;32;FLOAT;0.5;False;34;FLOAT;0.01;False;37;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;448.4947,686.4459;Float;False;Property;_ColorA;ColorA;19;0;Create;True;0;0;False;0;1,0.06119459,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;95;1031.25,185.3523;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;844.2836,1049.47;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;11;1569.311,234.8123;Float;False;Property;_emission;emission;4;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;106;1345.964,485.1442;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4;1754.708,673.6785;Float;False;Property;_r;r;1;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;1778.61,311.5122;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;6;-564.5668,-561.6408;Float;False;Property;_Color1;Color 1;2;0;Create;True;0;0;False;0;0,1,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;26;-3177.987,1659.384;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;3;1763.708,582.6788;Float;False;Property;_m;m;0;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;7;-553.5668,-721.6408;Float;False;Property;_Color2;Color 2;3;0;Create;True;0;0;False;0;0,0,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;9;1743.8,-63.68581;Float;False;Property;_Albedo;Albedo;5;0;Create;True;0;0;False;0;0.1886792,0.1886792,0.1886792,0;0.1886792,0.1886792,0.1886792,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2017.894,282.2813;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;13/SerpentineB;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;28;0;39;1
WireConnection;28;1;39;2
WireConnection;32;0;31;0
WireConnection;32;1;31;0
WireConnection;22;0;28;0
WireConnection;22;1;32;0
WireConnection;34;0;33;0
WireConnection;34;1;33;0
WireConnection;23;0;22;0
WireConnection;23;1;34;0
WireConnection;24;0;23;0
WireConnection;25;0;24;1
WireConnection;25;1;24;0
WireConnection;41;0;25;0
WireConnection;42;0;41;0
WireConnection;46;0;42;0
WireConnection;47;0;46;0
WireConnection;47;1;48;0
WireConnection;44;0;47;0
WireConnection;44;1;45;0
WireConnection;43;0;44;0
WireConnection;70;0;43;0
WireConnection;89;40;90;0
WireConnection;89;33;92;0
WireConnection;89;31;71;0
WireConnection;89;35;87;0
WireConnection;89;29;91;0
WireConnection;89;30;84;0
WireConnection;89;32;93;0
WireConnection;89;34;86;0
WireConnection;89;37;85;0
WireConnection;96;40;97;0
WireConnection;96;33;98;0
WireConnection;96;31;71;0
WireConnection;96;35;99;0
WireConnection;96;29;100;0
WireConnection;96;30;101;0
WireConnection;96;32;102;0
WireConnection;96;34;103;0
WireConnection;96;37;104;0
WireConnection;95;0;94;0
WireConnection;95;1;96;0
WireConnection;69;0;5;0
WireConnection;69;1;89;0
WireConnection;106;0;95;0
WireConnection;106;1;69;0
WireConnection;10;0;11;0
WireConnection;10;1;106;0
WireConnection;0;0;9;0
WireConnection;0;2;10;0
WireConnection;0;3;3;0
WireConnection;0;4;4;0
ASEEND*/
//CHKSM=BBC42BFBD0891D34F144A442A2C54A16DBD2E1AD