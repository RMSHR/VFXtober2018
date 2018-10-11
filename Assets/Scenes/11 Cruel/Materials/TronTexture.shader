// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "11/Tron"
{
	Properties
	{
		_Thickness("Thickness", Float) = 0.1
		_Size("Size", Float) = 0.5
		_UVOffset("UVOffset", Vector) = (0,0,0,0)
		_ColorA("ColorA", Color) = (0,0,0,0)
		_UVTiling("UVTiling", Vector) = (10,10,0,0)
		_ColorB("ColorB", Color) = (0,0.836798,1,0)
		_Emission("Emission", Float) = 1
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
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Emission;
		uniform float4 _ColorB;
		uniform float4 _ColorA;
		uniform float _Thickness;
		uniform float _Size;
		uniform float2 _UVTiling;
		uniform float2 _UVOffset;
		uniform float _Metallic;
		uniform float _Smoothness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float temp_output_4_0_g1 = _Size;
			float temp_output_27_0_g3 = ( ( _Thickness + temp_output_4_0_g1 ) * 0.5 );
			float temp_output_24_0_g3 = ( 0.5 - temp_output_27_0_g3 );
			float2 uv_TexCoord2 = i.uv_texcoord * _UVTiling + _UVOffset;
			float2 temp_output_3_0_g1 = frac( uv_TexCoord2 );
			float2 break21_g3 = temp_output_3_0_g1;
			float temp_output_37_0_g3 = ( temp_output_27_0_g3 + 0.5 );
			float temp_output_27_0_g2 = ( temp_output_4_0_g1 * 0.5 );
			float temp_output_24_0_g2 = ( 0.5 - temp_output_27_0_g2 );
			float2 break21_g2 = temp_output_3_0_g1;
			float temp_output_37_0_g2 = ( temp_output_27_0_g2 + 0.5 );
			float4 lerpResult9 = lerp( _ColorB , _ColorA , ( ( ( step( temp_output_24_0_g3 , break21_g3.x ) * step( temp_output_24_0_g3 , break21_g3.y ) ) * ( step( break21_g3.y , temp_output_37_0_g3 ) * step( break21_g3.x , temp_output_37_0_g3 ) ) ) - ( ( step( temp_output_24_0_g2 , break21_g2.x ) * step( temp_output_24_0_g2 , break21_g2.y ) ) * ( step( break21_g2.y , temp_output_37_0_g2 ) * step( break21_g2.x , temp_output_37_0_g2 ) ) ) ));
			o.Emission = ( _Emission * lerpResult9 ).rgb;
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
7;92;1587;941;904.5;526.5;1;True;False
Node;AmplifyShaderEditor.Vector2Node;6;-1644.5,220.5;Float;False;Property;_UVTiling;UVTiling;4;0;Create;True;0;0;False;0;10,10;10,10;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;5;-1628.5,420.5;Float;False;Property;_UVOffset;UVOffset;2;0;Create;True;0;0;False;0;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1423.5,272.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-1044.5,71.5;Float;False;Property;_Size;Size;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-1058.5,-101.5;Float;False;Property;_Thickness;Thickness;0;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;12;-1141.5,427.5;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;1;-723.5,96.5;Float;False;Shape-SquareOutline;-1;;1;c9ed8dac7db51694c9c29b27f33c9c0b;0;3;5;FLOAT;0;False;4;FLOAT;0;False;3;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;7;-580.5,-371.5;Float;False;Property;_ColorB;ColorB;5;0;Create;True;0;0;False;0;0,0.836798,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;-580.5,-160.5;Float;False;Property;_ColorA;ColorA;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;9;-283.5,75.5;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-173.5,-121.5;Float;False;Property;_Emission;Emission;6;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;5.5,98.5;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;14;46.5,-67.5;Float;False;Property;_Smoothness;Smoothness;8;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;30.5,-187.5;Float;False;Property;_Metallic;Metallic;7;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;296,-162;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;11/Tron;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;6;0
WireConnection;2;1;5;0
WireConnection;12;0;2;0
WireConnection;1;5;4;0
WireConnection;1;4;3;0
WireConnection;1;3;12;0
WireConnection;9;0;7;0
WireConnection;9;1;8;0
WireConnection;9;2;1;0
WireConnection;10;0;11;0
WireConnection;10;1;9;0
WireConnection;0;2;10;0
WireConnection;0;3;13;0
WireConnection;0;4;14;0
ASEEND*/
//CHKSM=A8C25642F12CEAE426CC7F841DFA306D0CAE9E8A