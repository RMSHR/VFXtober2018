// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "04/Guy"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_noise("noise", 2D) = "white" {}
		_Opacity("Opacity", Range( 0 , 1)) = 0.5058824
		_OpacityOffset("OpacityOffset", Float) = 0.1
		_Albedo("Albedo", Color) = (0.245283,0.245283,0.245283,0)
		_EmissionColor("EmissionColor", Color) = (1,0.3475747,0,0)
		_Emission("Emission", Float) = 2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Albedo;
		uniform float _Emission;
		uniform float4 _EmissionColor;
		uniform sampler2D _noise;
		uniform float4 _noise_ST;
		uniform float _Opacity;
		uniform float _OpacityOffset;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
			float2 uv_noise = i.uv_texcoord * _noise_ST.xy + _noise_ST.zw;
			float4 tex2DNode2 = tex2D( _noise, uv_noise );
			float temp_output_3_0 = step( tex2DNode2.r , _Opacity );
			o.Emission = ( _Emission * ( _EmissionColor * ( temp_output_3_0 - step( tex2DNode2.r , ( _Opacity - _OpacityOffset ) ) ) ) ).rgb;
			o.Alpha = 1;
			clip( temp_output_3_0 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
2567;29;1906;1004;974;174;1;True;True
Node;AmplifyShaderEditor.RangedFloatNode;4;-1030,377;Float;False;Property;_Opacity;Opacity;2;0;Create;True;0;0;False;0;0.5058824;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-962,623;Float;False;Property;_OpacityOffset;OpacityOffset;3;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;8;-731,624;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-958,122;Float;True;Property;_noise;noise;1;0;Create;True;0;0;False;0;663ff699efd4cd24e82e3ff499015d2e;663ff699efd4cd24e82e3ff499015d2e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;6;-580,619;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;3;-594,323;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;11;-296,568;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;13;-388,124;Float;False;Property;_EmissionColor;EmissionColor;5;0;Create;True;0;0;False;0;1,0.3475747,0,0;1,0.3475747,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-28,144;Float;False;Property;_Emission;Emission;6;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-51,278;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;171,235;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;12;-567,-110;Float;False;Property;_Albedo;Albedo;4;0;Create;True;0;0;False;0;0.245283,0.245283,0.245283,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;442,113;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;04/Guy;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Custom;0.5;True;True;0;False;Transparent;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;4;0
WireConnection;8;1;5;0
WireConnection;6;0;2;1
WireConnection;6;1;8;0
WireConnection;3;0;2;1
WireConnection;3;1;4;0
WireConnection;11;0;3;0
WireConnection;11;1;6;0
WireConnection;14;0;13;0
WireConnection;14;1;11;0
WireConnection;15;0;16;0
WireConnection;15;1;14;0
WireConnection;0;0;12;0
WireConnection;0;2;15;0
WireConnection;0;10;3;0
ASEEND*/
//CHKSM=F3188D2FB86460D7E625ADC13ED33F6B41484284