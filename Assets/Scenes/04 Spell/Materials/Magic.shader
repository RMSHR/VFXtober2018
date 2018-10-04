// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "04/Magic"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_CircleRadius("CircleRadius", Float) = 0.9
		_CircleThickness("CircleThickness", Float) = 0.1
		_SquareSize("SquareSize", Float) = 0.9
		_SquareThickness("SquareThickness", Float) = 0.1
		_TriangleThickness("TriangleThickness", Float) = 0.1
		_TriangleSize("TriangleSize", Float) = 0.4
		_Color("Color", Color) = (1,0.3872941,0,0)
		_Emission("Emission", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Emission;
		uniform float4 _Color;
		uniform float _CircleThickness;
		uniform float _CircleRadius;
		uniform float _SquareThickness;
		uniform float _SquareSize;
		uniform float _TriangleThickness;
		uniform float _TriangleSize;
		uniform float _Cutoff = 0.5;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Emission = ( _Emission * _Color ).rgb;
			o.Alpha = 1;
			float2 temp_output_10_0_g22 = i.uv_texcoord;
			float2 temp_output_13_0_g22 = float2( 0.5,0.5 );
			float temp_output_6_0_g22 = _CircleRadius;
			float temp_output_4_0_g25 = _SquareSize;
			float temp_output_27_0_g27 = ( ( _SquareThickness + temp_output_4_0_g25 ) * 0.5 );
			float temp_output_24_0_g27 = ( 0.5 - temp_output_27_0_g27 );
			float2 temp_output_3_0_g25 = i.uv_texcoord;
			float2 break21_g27 = temp_output_3_0_g25;
			float temp_output_37_0_g27 = ( temp_output_27_0_g27 + 0.5 );
			float temp_output_27_0_g26 = ( temp_output_4_0_g25 * 0.5 );
			float temp_output_24_0_g26 = ( 0.5 - temp_output_27_0_g26 );
			float2 break21_g26 = temp_output_3_0_g25;
			float temp_output_37_0_g26 = ( temp_output_27_0_g26 + 0.5 );
			float2 temp_output_6_0_g34 = i.uv_texcoord;
			float2 temp_output_23_0_g35 = ( ( temp_output_6_0_g34 * float2( 2,2 ) ) - float2( 1,1 ) );
			float2 break3_g35 = temp_output_23_0_g35;
			float temp_output_6_0_g35 = ( atan2( break3_g35.x , break3_g35.y ) + 3.141593 );
			float temp_output_10_0_g34 = 3.0;
			float temp_output_9_0_g35 = ( 6.283185 / temp_output_10_0_g34 );
			float temp_output_18_0_g35 = ( cos( ( ( floor( ( 0.5 + ( temp_output_6_0_g35 / temp_output_9_0_g35 ) ) ) * temp_output_9_0_g35 ) - temp_output_6_0_g35 ) ) * length( temp_output_23_0_g35 ) );
			float temp_output_7_0_g34 = _TriangleSize;
			float temp_output_32_0_g35 = ( _TriangleThickness + temp_output_7_0_g34 );
			float2 temp_output_23_0_g36 = ( ( temp_output_6_0_g34 * float2( 2,2 ) ) - float2( 1,1 ) );
			float2 break3_g36 = temp_output_23_0_g36;
			float temp_output_6_0_g36 = ( atan2( break3_g36.x , break3_g36.y ) + 3.141593 );
			float temp_output_9_0_g36 = ( 6.283185 / temp_output_10_0_g34 );
			float temp_output_18_0_g36 = ( cos( ( ( floor( ( 0.5 + ( temp_output_6_0_g36 / temp_output_9_0_g36 ) ) ) * temp_output_9_0_g36 ) - temp_output_6_0_g36 ) ) * length( temp_output_23_0_g36 ) );
			float temp_output_32_0_g36 = temp_output_7_0_g34;
			float cos5_g42 = cos( ( ( 180.0 / 360.0 ) * ( 2.0 * UNITY_PI ) ) );
			float sin5_g42 = sin( ( ( 180.0 / 360.0 ) * ( 2.0 * UNITY_PI ) ) );
			float2 rotator5_g42 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos5_g42 , -sin5_g42 , sin5_g42 , cos5_g42 )) + float2( 0.5,0.5 );
			float2 temp_output_6_0_g38 = rotator5_g42;
			float2 temp_output_23_0_g39 = ( ( temp_output_6_0_g38 * float2( 2,2 ) ) - float2( 1,1 ) );
			float2 break3_g39 = temp_output_23_0_g39;
			float temp_output_6_0_g39 = ( atan2( break3_g39.x , break3_g39.y ) + 3.141593 );
			float temp_output_10_0_g38 = 3.0;
			float temp_output_9_0_g39 = ( 6.283185 / temp_output_10_0_g38 );
			float temp_output_18_0_g39 = ( cos( ( ( floor( ( 0.5 + ( temp_output_6_0_g39 / temp_output_9_0_g39 ) ) ) * temp_output_9_0_g39 ) - temp_output_6_0_g39 ) ) * length( temp_output_23_0_g39 ) );
			float temp_output_7_0_g38 = _TriangleSize;
			float temp_output_32_0_g39 = ( _TriangleThickness + temp_output_7_0_g38 );
			float2 temp_output_23_0_g40 = ( ( temp_output_6_0_g38 * float2( 2,2 ) ) - float2( 1,1 ) );
			float2 break3_g40 = temp_output_23_0_g40;
			float temp_output_6_0_g40 = ( atan2( break3_g40.x , break3_g40.y ) + 3.141593 );
			float temp_output_9_0_g40 = ( 6.283185 / temp_output_10_0_g38 );
			float temp_output_18_0_g40 = ( cos( ( ( floor( ( 0.5 + ( temp_output_6_0_g40 / temp_output_9_0_g40 ) ) ) * temp_output_9_0_g40 ) - temp_output_6_0_g40 ) ) * length( temp_output_23_0_g40 ) );
			float temp_output_32_0_g40 = temp_output_7_0_g38;
			float clampResult18 = clamp( ( ( step( distance( temp_output_10_0_g22 , temp_output_13_0_g22 ) , ( ( _CircleThickness + temp_output_6_0_g22 ) * 0.5 ) ) - step( distance( temp_output_10_0_g22 , temp_output_13_0_g22 ) , ( temp_output_6_0_g22 * 0.5 ) ) ) + ( ( ( step( temp_output_24_0_g27 , break21_g27.x ) * step( temp_output_24_0_g27 , break21_g27.y ) ) * ( step( break21_g27.y , temp_output_37_0_g27 ) * step( break21_g27.x , temp_output_37_0_g27 ) ) ) - ( ( step( temp_output_24_0_g26 , break21_g26.x ) * step( temp_output_24_0_g26 , break21_g26.y ) ) * ( step( break21_g26.y , temp_output_37_0_g26 ) * step( break21_g26.x , temp_output_37_0_g26 ) ) ) ) + ( step( temp_output_18_0_g35 , temp_output_32_0_g35 ) - step( temp_output_18_0_g36 , temp_output_32_0_g36 ) ) + ( step( temp_output_18_0_g39 , temp_output_32_0_g39 ) - step( temp_output_18_0_g40 , temp_output_32_0_g40 ) ) ) , 0.0 , 1.0 );
			clip( clampResult18 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
115;892;1587;917;1403.383;-279.2517;1.421474;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;28;-679.8533,1073.856;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-342.9059,759.2178;Float;False;Property;_TriangleThickness;TriangleThickness;5;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-810.5,492.5;Float;False;Property;_SquareSize;SquareSize;3;0;Create;True;0;0;False;0;0.9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1145.5,135.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-332.9059,849.2178;Float;False;Property;_TriangleSize;TriangleSize;6;0;Create;True;0;0;False;0;0.4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-829.5,292.5;Float;False;Property;_CircleRadius;CircleRadius;1;0;Create;True;0;0;False;0;0.9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-839.5,379.5;Float;False;Property;_CircleThickness;CircleThickness;2;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-827.5,601.5;Float;False;Property;_SquareThickness;SquareThickness;4;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;13;-832.1176,707.4318;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;34;-340.1209,1024.104;Float;False;Rotate;-1;;42;ada9d580a1b9d2d428d88e2877e0f9e8;0;3;2;FLOAT;180;False;1;FLOAT2;0,0;False;6;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;30;24.5,597.5;Float;True;Shape-PolygonOutlined;-1;;34;5ee3aad3b005cd942aec785f8fd008ee;0;4;8;FLOAT;0.1;False;10;FLOAT;3;False;6;FLOAT2;0,0;False;7;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;32;55.09412,881.2178;Float;True;Shape-PolygonOutlined;-1;;38;5ee3aad3b005cd942aec785f8fd008ee;0;4;8;FLOAT;0.1;False;10;FLOAT;3;False;6;FLOAT2;0,0;False;7;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;7;-536.5,441.5;Float;True;Shape-SquareOutline;-1;;25;c9ed8dac7db51694c9c29b27f33c9c0b;0;3;5;FLOAT;0;False;4;FLOAT;0;False;3;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1;-545.5,158.5;Float;True;Shape-CircleOutlined;-1;;22;70537716381e1ae45b39693927da8a86;0;4;13;FLOAT2;0.5,0.5;False;10;FLOAT2;0,0;False;6;FLOAT;0.5;False;7;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;744.9681,5.702225;Float;False;Property;_Emission;Emission;8;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;19;708.8172,164.0777;Float;False;Property;_Color;Color;7;0;Create;True;0;0;False;0;1,0.3872941,0,0;1,0.3872941,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;9;541.5558,321.7649;Float;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;1006.632,196.7858;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;31;-14.60315,1220.268;Float;True;Shape-Polygon;-1;;37;19e16d7ee18510d40b73e30ff19eadbb;0;3;32;FLOAT;0.4;False;2;FLOAT2;0,0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;18;815.5485,527.3087;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1193.344,216.0835;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;04/Magic;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Custom;0.5;True;True;0;True;TransparentCutout;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;34;1;28;0
WireConnection;30;8;11;0
WireConnection;30;6;13;0
WireConnection;30;7;12;0
WireConnection;32;8;11;0
WireConnection;32;6;34;0
WireConnection;32;7;12;0
WireConnection;7;5;8;0
WireConnection;7;4;6;0
WireConnection;7;3;2;0
WireConnection;1;10;2;0
WireConnection;1;6;3;0
WireConnection;1;7;4;0
WireConnection;9;0;1;0
WireConnection;9;1;7;0
WireConnection;9;2;30;0
WireConnection;9;3;32;0
WireConnection;21;0;20;0
WireConnection;21;1;19;0
WireConnection;18;0;9;0
WireConnection;0;2;21;0
WireConnection;0;10;18;0
ASEEND*/
//CHKSM=2C245F7FE9E15E10ED62BEFF5BDB20F617FDB14A