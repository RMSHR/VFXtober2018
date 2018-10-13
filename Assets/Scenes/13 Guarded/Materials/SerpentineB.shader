// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "13/Serpentine"
{
	Properties
	{
		_Mask("Mask", 2D) = "white" {}
		_m("m", Float) = 0
		_r("r", Float) = 0
		_Color0("Color 0", Color) = (1,0.06119459,0,0)
		_emission("emission", Float) = 1
		_Tiling("Tiling", Vector) = (1,1,0,0)
		_Offset("Offset", Vector) = (0,0,0,0)
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

		uniform float _emission;
		uniform float4 _Color0;
		uniform sampler2D _Mask;
		uniform float2 _Tiling;
		uniform float2 _Offset;
		uniform float _m;
		uniform float _r;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = float4(0.1886792,0.1886792,0.1886792,0).rgb;
			float2 uv_TexCoord2 = i.uv_texcoord * _Tiling + _Offset;
			float4 lerpResult8 = lerp( float4( 0,0,0,0 ) , _Color0 , tex2D( _Mask, uv_TexCoord2 ).r);
			o.Emission = ( _emission * lerpResult8 ).rgb;
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
-303.2;250.4;1448;703;1404.671;32.94082;1.730494;True;False
Node;AmplifyShaderEditor.Vector2Node;13;-1348.107,123.5595;Float;False;Property;_Offset;Offset;8;0;Create;True;0;0;False;0;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;12;-1345.507,-16.84048;Float;False;Property;_Tiling;Tiling;7;0;Create;True;0;0;False;0;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1040.22,352.6494;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;5;-668,-173.5;Float;False;Property;_Color0;Color 0;3;0;Create;True;0;0;False;0;1,0.06119459,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-760,16.5;Float;True;Property;_Mask;Mask;0;0;Create;True;0;0;False;0;08078776e4c022846a17584dfba60569;08078776e4c022846a17584dfba60569;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;532.9923,73.50989;Float;False;Property;_emission;emission;6;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;8;-208.008,122.9099;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;742.2922,150.2099;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;-68.66807,887.3758;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;7;-649,-512.5;Float;False;Property;_Color2;Color 2;5;0;Create;True;0;0;False;0;0,0,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;20;368.7798,384.31;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-513.4661,801.1573;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;6;-660,-352.5;Float;False;Property;_Color1;Color 1;4;0;Create;True;0;0;False;0;0,1,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;720.2,251.9;Float;False;Property;_m;m;1;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;561.5923,-131.8901;Float;False;Constant;_Albedo;Albedo;6;0;Create;True;0;0;False;0;0.1886792,0.1886792,0.1886792,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4;711.2001,342.9;Float;False;Property;_r;r;2;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;26;-2620.508,582.512;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FractNode;43;106.3124,626.9178;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;32;-2427.745,809.3348;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;34;-2377.979,966.9243;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;22;-2298.449,605.5392;Float;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-2589.481,950.3359;Float;False;Property;_polarMul;polarMul;10;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2601.923,836.2908;Float;False;Property;_polarSub;polarSub;9;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-2894.289,556.3624;Float;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;28;-2485.806,608.2007;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-2106.449,631.5392;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-740.1608,898.0649;Float;False;Property;_length;length;12;0;Create;True;0;0;False;0;0.25;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-765.7402,746.2295;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;-463.8397,1035.635;Float;False;Property;_rotation;rotation;11;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-1106.895,643.4513;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0.125;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;24;-1861.448,663.5392;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ATan2OpNode;25;-1575.221,669.5386;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;41;-1245.822,631.01;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;970.2,136.4;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;13/Serpentine;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;12;0
WireConnection;2;1;13;0
WireConnection;1;1;2;0
WireConnection;8;1;5;0
WireConnection;8;2;1;1
WireConnection;10;0;11;0
WireConnection;10;1;8;0
WireConnection;44;0;47;0
WireConnection;44;1;45;0
WireConnection;20;0;8;0
WireConnection;20;2;43;0
WireConnection;47;0;46;0
WireConnection;47;1;48;0
WireConnection;43;0;44;0
WireConnection;32;0;31;0
WireConnection;32;1;31;0
WireConnection;34;0;33;0
WireConnection;34;1;33;0
WireConnection;22;0;28;0
WireConnection;22;1;32;0
WireConnection;28;0;39;1
WireConnection;28;1;39;2
WireConnection;23;0;22;0
WireConnection;23;1;34;0
WireConnection;46;0;42;0
WireConnection;42;0;41;0
WireConnection;24;0;23;0
WireConnection;25;0;24;1
WireConnection;25;1;24;0
WireConnection;41;0;25;0
WireConnection;0;0;9;0
WireConnection;0;2;10;0
WireConnection;0;3;3;0
WireConnection;0;4;4;0
ASEEND*/
//CHKSM=2A93416F5078C82E7E8B992D7BC751EEA2F92A1A