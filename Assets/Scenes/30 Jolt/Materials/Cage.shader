// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "30/Cage"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Emission("Emission", Float) = 1
		_Albedo("Albedo", Color) = (1,1,1,0)
		_SquareRepeat("SquareRepeat", Vector) = (10,10,0,0)
		_SquarePArams("SquarePArams", Vector) = (0.1,0.9,0,0)
		_yWorldParams("yWorldParams", Vector) = (0,0,0,0)
		_yshowCage("yshowCage", Range( 0 , 1)) = 0
		_showCageSphere("showCageSphere", Vector) = (0,0,0,0)
		_distanceMin("distanceMin", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform float _Emission;
		uniform float4 _Albedo;
		uniform float2 _SquarePArams;
		uniform float2 _SquareRepeat;
		uniform float2 _yWorldParams;
		uniform float _yshowCage;
		uniform float _distanceMin;
		uniform float3 _showCageSphere;
		uniform float _Cutoff = 0.5;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Emission = ( _Emission * _Albedo ).rgb;
			o.Alpha = 1;
			float temp_output_4_0_g1 = _SquarePArams.y;
			float temp_output_27_0_g3 = ( ( _SquarePArams.x + temp_output_4_0_g1 ) * 0.5 );
			float temp_output_24_0_g3 = ( 0.5 - temp_output_27_0_g3 );
			float2 uv_TexCoord5 = i.uv_texcoord * _SquareRepeat;
			float2 temp_output_3_0_g1 = frac( uv_TexCoord5 );
			float2 break21_g3 = temp_output_3_0_g1;
			float temp_output_37_0_g3 = ( temp_output_27_0_g3 + 0.5 );
			float temp_output_27_0_g2 = ( temp_output_4_0_g1 * 0.5 );
			float temp_output_24_0_g2 = ( 0.5 - temp_output_27_0_g2 );
			float2 break21_g2 = temp_output_3_0_g1;
			float temp_output_37_0_g2 = ( temp_output_27_0_g2 + 0.5 );
			float3 ase_worldPos = i.worldPos;
			float lerpResult10 = lerp( ( ( ( step( temp_output_24_0_g3 , break21_g3.x ) * step( temp_output_24_0_g3 , break21_g3.y ) ) * ( step( break21_g3.y , temp_output_37_0_g3 ) * step( break21_g3.x , temp_output_37_0_g3 ) ) ) - ( ( step( temp_output_24_0_g2 , break21_g2.x ) * step( temp_output_24_0_g2 , break21_g2.y ) ) * ( step( break21_g2.y , temp_output_37_0_g2 ) * step( break21_g2.x , temp_output_37_0_g2 ) ) ) ) , 0.0 , ( step( ( ( ase_worldPos.y + _yWorldParams.x ) * _yWorldParams.y ) , _yshowCage ) + step( _distanceMin , distance( _showCageSphere , ase_worldPos ) ) ));
			clip( lerpResult10 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
2567;23;1906;1010;2203.242;-195.9602;1.914503;True;True
Node;AmplifyShaderEditor.WorldPosInputsNode;13;-1703.644,744.5909;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector2Node;17;-1792.043,1369.89;Float;False;Property;_yWorldParams;yWorldParams;7;0;Create;True;0;0;False;0;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;18;-1382.543,1358.19;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;23;-1889.544,1651.99;Float;False;Property;_showCageSphere;showCageSphere;9;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector2Node;6;-1532,617;Float;False;Property;_SquareRepeat;SquareRepeat;3;0;Create;True;0;0;False;0;10,10;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.WorldPosInputsNode;25;-1890.844,1879.49;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;21;-1301.943,1567.491;Float;False;Property;_yshowCage;yshowCage;8;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1205.743,1424.49;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;24;-1603.543,1781.991;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1341,591;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;27;-1535.943,1979.59;Float;False;Property;_distanceMin;distanceMin;10;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;7;-845,355;Float;False;Property;_SquarePArams;SquarePArams;4;0;Create;True;0;0;False;0;0.1,0.9;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FractNode;8;-976,645;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StepOpNode;26;-1330.542,1884.69;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;20;-848.2434,1394.591;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-445,-171;Float;False;Property;_Emission;Emission;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4;-597,411;Float;False;Shape-SquareOutline;-1;;1;c9ed8dac7db51694c9c29b27f33c9c0b;0;3;5;FLOAT;0;False;4;FLOAT;0;False;3;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-582.074,1595.3;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1;-480,-13;Float;False;Property;_Albedo;Albedo;2;0;Create;True;0;0;False;0;1,1,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;16;-1720.543,994.1905;Float;False;Property;_xWorldParams;xWorldParams;6;0;Create;True;0;0;False;0;0,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;12;-1325.343,1124.191;Float;False;Property;_xshowCage;xshowCage;5;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-1425.443,861.5905;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-1299.343,920.0905;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;11;-966.5427,996.7905;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;10;-297.0429,504.0904;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-223,40;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;30/Cage;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;0;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;18;0;13;2
WireConnection;18;1;17;1
WireConnection;19;0;18;0
WireConnection;19;1;17;2
WireConnection;24;0;23;0
WireConnection;24;1;25;0
WireConnection;5;0;6;0
WireConnection;8;0;5;0
WireConnection;26;0;27;0
WireConnection;26;1;24;0
WireConnection;20;0;19;0
WireConnection;20;1;21;0
WireConnection;4;5;7;1
WireConnection;4;4;7;2
WireConnection;4;3;8;0
WireConnection;22;0;20;0
WireConnection;22;1;26;0
WireConnection;14;0;13;1
WireConnection;14;1;16;1
WireConnection;15;0;14;0
WireConnection;15;1;16;2
WireConnection;11;0;15;0
WireConnection;11;1;12;0
WireConnection;10;0;4;0
WireConnection;10;2;22;0
WireConnection;3;0;2;0
WireConnection;3;1;1;0
WireConnection;0;2;3;0
WireConnection;0;10;10;0
ASEEND*/
//CHKSM=D11151E117681B09C766E0D23E5403E17D8ADE99