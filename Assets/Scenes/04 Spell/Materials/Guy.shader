// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "04/Guy"
{
	Properties
	{
		_noise("noise", 2D) = "white" {}
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Opacity("Opacity", Range( 0 , 1)) = 0.5058824
		_OpacityOffset("OpacityOffset", Float) = 0.1
		_Albedo("Albedo", Color) = (0.245283,0.245283,0.245283,0)
		_EmissionColor("EmissionColor", Color) = (1,0.3475747,0,0)
		_Emission("Emission", Float) = 2
		_maskPosition("maskPosition", Vector) = (0,0,0,0)
		_maskRadius("maskRadius", Float) = 0
		_maskBorder("maskBorder", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		Blend SrcAlpha OneMinusSrcAlpha , SrcAlpha OneMinusSrcAlpha
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform float4 _Albedo;
		uniform float _Emission;
		uniform float4 _EmissionColor;
		uniform sampler2D _noise;
		uniform float4 _noise_ST;
		uniform float _Opacity;
		uniform float _OpacityOffset;
		uniform float _maskRadius;
		uniform float _maskBorder;
		uniform float3 _maskPosition;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
			float2 uv_noise = i.uv_texcoord * _noise_ST.xy + _noise_ST.zw;
			float4 tex2DNode2 = tex2D( _noise, uv_noise );
			float temp_output_3_0 = step( tex2DNode2.r , _Opacity );
			o.Emission = ( _Emission * ( _EmissionColor * ( temp_output_3_0 - step( tex2DNode2.r , ( _Opacity - _OpacityOffset ) ) ) ) ).rgb;
			o.Alpha = 1;
			float3 ase_worldPos = i.worldPos;
			float smoothstepResult23 = smoothstep( ( _maskRadius + _maskBorder ) , _maskRadius , distance( ase_worldPos , _maskPosition ));
			clip( ( temp_output_3_0 * smoothstepResult23 ) - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
177;98;1587;917;1310.431;-77.69547;1.528177;True;False
Node;AmplifyShaderEditor.RangedFloatNode;5;-962,623;Float;False;Property;_OpacityOffset;OpacityOffset;3;0;Create;True;0;0;False;0;0.1;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-1030,377;Float;False;Property;_Opacity;Opacity;2;0;Create;True;0;0;False;0;0.5058824;0.574;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-958,122;Float;True;Property;_noise;noise;0;0;Create;True;0;0;False;0;663ff699efd4cd24e82e3ff499015d2e;663ff699efd4cd24e82e3ff499015d2e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;8;-731,624;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;19;-435.1833,875.4597;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;17;-429.0706,1063.426;Float;False;Property;_maskPosition;maskPosition;7;0;Create;True;0;0;False;0;0,0,0;0,0.762,1.777;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;24;-355.7181,1389.194;Float;False;Property;_maskBorder;maskBorder;9;0;Create;True;0;0;False;0;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-419.9016,1251.391;Float;False;Property;_maskRadius;maskRadius;8;0;Create;True;0;0;False;0;0;1.6865;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;6;-580,619;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;3;-594,323;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;197.4821,1199.7;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;20;-134.1323,1016.052;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;11;-296,568;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;13;-388,124;Float;False;Property;_EmissionColor;EmissionColor;5;0;Create;True;0;0;False;0;1,0.3475747,0,0;1,0.3475747,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-51,278;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-28,144;Float;False;Property;_Emission;Emission;6;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;23;420.5961,964.3612;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;12;-567,-110;Float;False;Property;_Albedo;Albedo;4;0;Create;True;0;0;False;0;0.245283,0.245283,0.245283,0;0.245283,0.245283,0.245283,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;312.0956,663.3101;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;171,235;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;781.2554,160.3735;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;04/Guy;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Custom;0.5;True;True;0;True;Transparent;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;2;5;False;-1;10;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;4;0
WireConnection;8;1;5;0
WireConnection;6;0;2;1
WireConnection;6;1;8;0
WireConnection;3;0;2;1
WireConnection;3;1;4;0
WireConnection;25;0;18;0
WireConnection;25;1;24;0
WireConnection;20;0;19;0
WireConnection;20;1;17;0
WireConnection;11;0;3;0
WireConnection;11;1;6;0
WireConnection;14;0;13;0
WireConnection;14;1;11;0
WireConnection;23;0;20;0
WireConnection;23;1;25;0
WireConnection;23;2;18;0
WireConnection;22;0;3;0
WireConnection;22;1;23;0
WireConnection;15;0;16;0
WireConnection;15;1;14;0
WireConnection;0;0;12;0
WireConnection;0;2;15;0
WireConnection;0;10;22;0
ASEEND*/
//CHKSM=5803B5364152D5D0AC3068C29824FE81BB69A840