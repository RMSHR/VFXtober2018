// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "31/Texture"
{
	Properties
	{
		_PBR("PBR", Vector) = (0,0,0,0)
		_BlockColor("BlockColor", Color) = (0.2321556,0.2597968,0.4433962,0)
		_HoleColor("HoleColor", Color) = (0,0,0,0)
		_CenterLineWidth("CenterLineWidth", Float) = 0.01
		_NbrCenterLine("NbrCenterLine", Float) = 1
		_centerLineOffset("centerLineOffset", Float) = 0
		_nbrDepthLines("nbrDepthLines", Float) = 5
		_DepthLineWidth("DepthLineWidth", Float) = 0.05
		_DepthLineOffset("DepthLineOffset", Float) = 0
		_DepthLineMaskOffset("DepthLineMaskOffset", Vector) = (0.2,0.2,0,0)
		_TextureAffectPBR("TextureAffectPBR", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _BlockColor;
		uniform float4 _HoleColor;
		uniform float _centerLineOffset;
		uniform float _NbrCenterLine;
		uniform float _CenterLineWidth;
		uniform float _DepthLineOffset;
		uniform float _nbrDepthLines;
		uniform float _DepthLineWidth;
		uniform float2 _DepthLineMaskOffset;
		uniform float2 _PBR;
		uniform float _TextureAffectPBR;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float temp_output_7_0 = frac( ( ( i.uv_texcoord.x + _centerLineOffset ) * _NbrCenterLine ) );
			float temp_output_16_0 = saturate( ( ( step( temp_output_7_0 , ( 0.5 + _CenterLineWidth ) ) - step( temp_output_7_0 , 0.5 ) ) + ( step( frac( ( ( i.uv_texcoord.y + _DepthLineOffset ) * _nbrDepthLines ) ) , _DepthLineWidth ) * ( 1.0 - ( step( i.uv_texcoord.x , _DepthLineMaskOffset.x ) + step( ( 1.0 - i.uv_texcoord.x ) , _DepthLineMaskOffset.y ) ) ) ) ) );
			float4 lerpResult18 = lerp( _BlockColor , ( _HoleColor * temp_output_16_0 ) , temp_output_16_0);
			o.Albedo = lerpResult18.rgb;
			float2 lerpResult54 = lerp( _PBR , ( _PBR * ( 1.0 - temp_output_16_0 ) ) , _TextureAffectPBR);
			float2 break49 = lerpResult54;
			o.Metallic = break49;
			o.Smoothness = break49.y;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
126.4;127.2;1448;792;1103.893;240.7114;1.81232;True;True
Node;AmplifyShaderEditor.CommentaryNode;52;-3326.542,221.8398;Float;False;2137.423;1598.845;Lines texture;29;5;21;31;20;29;19;23;15;30;43;35;6;32;13;22;14;36;37;28;12;7;24;25;39;10;9;11;38;41;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-2684.449,271.8398;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-3081.257,674.7653;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;31;-3050.3,835.4448;Float;False;Property;_DepthLineOffset;DepthLineOffset;8;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-2669.464,418.5007;Float;False;Property;_centerLineOffset;centerLineOffset;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;29;-3276.542,1192.323;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-2807.07,780.9022;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-2910.259,947.4784;Float;False;Property;_nbrDepthLines;nbrDepthLines;6;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-2427.638,474.3595;Float;False;Property;_NbrCenterLine;NbrCenterLine;4;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-2445.397,327.1049;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;43;-3173.448,1596.223;Float;False;Property;_DepthLineMaskOffset;DepthLineMaskOffset;9;0;Create;True;0;0;False;0;0.2,0.2;0.2,0.2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;35;-2612.485,1538.602;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;36;-2395.789,1568.085;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-2230.038,497.7595;Float;False;Constant;_CenterLinePos;CenterLinePos;4;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-2661.132,851.6602;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-2198.838,614.7592;Float;False;Property;_CenterLineWidth;CenterLineWidth;3;0;Create;True;0;0;False;0;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;32;-2568.261,1273.26;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-2197.96,364.9516;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;24;-2518.141,869.3498;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;7;-2042.06,370.1516;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;12;-1989.538,580.9594;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-2453.28,1010.866;Float;False;Property;_DepthLineWidth;DepthLineWidth;7;0;Create;True;0;0;False;0;0.05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-2106.861,1450.155;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;9;-1851.738,417.1595;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;25;-2236.584,860.5052;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;39;-1960.923,1398.56;Float;True;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;10;-1849.138,525.0594;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-1758.969,1125.847;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;11;-1682.738,482.1595;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;41;-1424.519,723.8489;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;51;-484.0608,181.8059;Float;False;1015.639;494.1734;No Reflction on lines;6;49;54;53;50;2;47;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SaturateNode;16;-818.6597,147.5002;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;2;-434.0608,231.8059;Float;False;Property;_PBR;PBR;0;0;Create;True;0;0;False;0;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;47;-414.8826,424.1661;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-430.2838,540.1709;Float;False;Property;_TextureAffectPBR;TextureAffectPBR;10;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-190.4992,253.281;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;4;-1153.404,-147.0502;Float;False;Property;_HoleColor;HoleColor;2;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;54;-56.9458,465.8658;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-654.6616,-5.407222;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;3;-678.6879,-265.035;Float;False;Property;_BlockColor;BlockColor;1;0;Create;True;0;0;False;0;0.2321556,0.2597968,0.4433962,0;0.2321556,0.2597968,0.4433962,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;49;137.0505,440.9238;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.LerpOp;18;-356.8893,-115.9664;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;697.7446,-114.7126;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;31/Texture;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;30;0;21;2
WireConnection;30;1;31;0
WireConnection;19;0;5;1
WireConnection;19;1;20;0
WireConnection;35;1;29;1
WireConnection;36;0;35;0
WireConnection;36;1;43;2
WireConnection;22;0;30;0
WireConnection;22;1;23;0
WireConnection;32;0;29;1
WireConnection;32;1;43;1
WireConnection;6;0;19;0
WireConnection;6;1;15;0
WireConnection;24;0;22;0
WireConnection;7;0;6;0
WireConnection;12;0;14;0
WireConnection;12;1;13;0
WireConnection;37;0;32;0
WireConnection;37;1;36;0
WireConnection;9;0;7;0
WireConnection;9;1;14;0
WireConnection;25;0;24;0
WireConnection;25;1;28;0
WireConnection;39;1;37;0
WireConnection;10;0;7;0
WireConnection;10;1;12;0
WireConnection;38;0;25;0
WireConnection;38;1;39;0
WireConnection;11;0;10;0
WireConnection;11;1;9;0
WireConnection;41;0;11;0
WireConnection;41;1;38;0
WireConnection;16;0;41;0
WireConnection;47;1;16;0
WireConnection;50;0;2;0
WireConnection;50;1;47;0
WireConnection;54;0;2;0
WireConnection;54;1;50;0
WireConnection;54;2;53;0
WireConnection;17;0;4;0
WireConnection;17;1;16;0
WireConnection;49;0;54;0
WireConnection;18;0;3;0
WireConnection;18;1;17;0
WireConnection;18;2;16;0
WireConnection;0;0;18;0
WireConnection;0;3;49;0
WireConnection;0;4;49;1
ASEEND*/
//CHKSM=C87077FFB5FF76709AE4E38EE2449BFB8D8BDD32