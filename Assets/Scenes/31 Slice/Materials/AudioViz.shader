// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "31/AudioViz"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_AudioReaction("AudioReaction", Range( 0 , 1)) = 0.5066885
		_LineHeight("LineHeight", Float) = 0.5
		_Emission("Emission", Float) = 2
		_NbrLines("NbrLines", Float) = 10
		_ColorA("ColorA", Color) = (1,0,0,0)
		_ColorB("ColorB", Color) = (0.4347644,1,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Emission;
		uniform float4 _ColorB;
		uniform float4 _ColorA;
		uniform float _NbrLines;
		uniform float _AudioReaction;
		uniform float _LineHeight;
		uniform float _Cutoff = 0.5;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 lerpResult7 = lerp( _ColorB , _ColorA , i.uv_texcoord.y);
			o.Emission = ( _Emission * lerpResult7 ).rgb;
			o.Alpha = 1;
			float temp_output_3_0 = ( i.uv_texcoord.y * _NbrLines );
			clip( ( step( ( ceil( temp_output_3_0 ) / _NbrLines ) , _AudioReaction ) - step( frac( temp_output_3_0 ) , _LineHeight ) ) - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
19.2;80.8;1448;795;1645.352;476.6255;2.588141;True;True
Node;AmplifyShaderEditor.RangedFloatNode;4;-730.1918,361.8873;Float;False;Property;_NbrLines;NbrLines;4;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-760.582,198.9946;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-465.1868,259.7755;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;15;-188.3074,568.5403;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;16;-6.307373,629.6403;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;10;-324.1751,337.575;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-395.8966,450.6275;Float;False;Property;_LineHeight;LineHeight;2;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-352.1075,762.24;Float;False;Property;_AudioReaction;AudioReaction;1;0;Create;True;0;0;False;0;0.5066885;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;6;-425.0713,-343.1711;Float;False;Property;_ColorB;ColorB;6;0;Create;True;0;0;False;0;0.4347644,1,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;5;-409.2683,-183.9252;Float;False;Property;_ColorA;ColorA;5;0;Create;True;0;0;False;0;1,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-753.2884,31.2393;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;14;145.7926,686.8401;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-31.21112,-100.0475;Float;False;Property;_Emission;Emission;3;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;11;-157.6354,372.828;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;7;-124.8137,82.29524;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;17;427.7498,568.9836;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;64.82263,81.07963;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;890.0812,33.17513;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;31/AudioViz;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3;0;2;2
WireConnection;3;1;4;0
WireConnection;15;0;3;0
WireConnection;16;0;15;0
WireConnection;16;1;4;0
WireConnection;10;0;3;0
WireConnection;14;0;16;0
WireConnection;14;1;13;0
WireConnection;11;0;10;0
WireConnection;11;1;12;0
WireConnection;7;0;6;0
WireConnection;7;1;5;0
WireConnection;7;2;9;2
WireConnection;17;0;14;0
WireConnection;17;1;11;0
WireConnection;8;0;1;0
WireConnection;8;1;7;0
WireConnection;0;2;8;0
WireConnection;0;10;17;0
ASEEND*/
//CHKSM=CBC312033E7BD8BEF46117BF4DF7EC061D7752CC