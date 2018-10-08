// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "08/Sky"
{
	Properties
	{
		_WorldScale("WorldScale", Float) = 1
		_ColorA("Color A", Color) = (0,0,0,0)
		_ColorB("Color B", Color) = (0.120283,0.1603774,0.1402576,0)
		_Emission("Emission", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform float _Emission;
		uniform float4 _ColorB;
		uniform float4 _ColorA;
		uniform float _WorldScale;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float dotResult5_g4 = dot( i.uv_texcoord , float2( 12.9898,78.233 ) );
			float temp_output_17_0 = ( _Emission * ( 1.0 - step( frac( ( sin( dotResult5_g4 ) * 43701.65 ) ) , 0.99 ) ) );
			float3 ase_worldPos = i.worldPos;
			float4 lerpResult4 = lerp( _ColorB , _ColorA , ( ase_worldPos.y * _WorldScale ));
			float4 lerpResult16 = lerp( ( temp_output_17_0 * float4(0.8773585,0.8320439,0.6000801,0) ) , lerpResult4 , temp_output_17_0);
			o.Emission = lerpResult16.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
2567;29;1906;1004;1766.931;510.2113;1.3;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;8;-897,-185;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;11;-618,-187;Float;True;RandomVec2;-1;;4;fc4f1f50f9d673640a03a4fc1afc48cc;0;2;7;FLOAT2;0,0;False;8;FLOAT;43701.65;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;12;-291,-130;Float;True;2;0;FLOAT;0;False;1;FLOAT;0.99;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1;-1125.499,589.9999;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;3;-983,752;Float;False;Property;_WorldScale;WorldScale;0;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;13;-60,-81;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;32.27015,-241.1113;Float;False;Property;_Emission;Emission;3;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;6;-831,281;Float;False;Property;_ColorB;Color B;2;0;Create;True;0;0;False;0;0.120283,0.1603774,0.1402576,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;5;-832,469;Float;False;Property;_ColorA;Color A;1;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;14;-394.2999,183.0001;Float;False;Constant;_Stars;Stars;3;0;Create;True;0;0;False;0;0.8773585,0.8320439,0.6000801,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;173.9703,-39.61151;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-813,643;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4;-558,529;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;242.9001,235.9;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;16;632.9,336.7;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;963.6,266.8;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;08/Sky;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;11;7;8;0
WireConnection;12;0;11;0
WireConnection;13;0;12;0
WireConnection;17;0;18;0
WireConnection;17;1;13;0
WireConnection;2;0;1;2
WireConnection;2;1;3;0
WireConnection;4;0;6;0
WireConnection;4;1;5;0
WireConnection;4;2;2;0
WireConnection;15;0;17;0
WireConnection;15;1;14;0
WireConnection;16;0;15;0
WireConnection;16;1;4;0
WireConnection;16;2;17;0
WireConnection;0;2;16;0
ASEEND*/
//CHKSM=8AFB1A3D6700A2AD6C330A49606C80250C30C4F6