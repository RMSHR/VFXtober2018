// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Amplify_Playground"
{
	Properties
	{
		_glitch("glitch", Range( -0.1 , 0.1)) = 0.09164678
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

		uniform float _glitch;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord1 = i.uv_texcoord * float2( 3,3 );
			float2 appendResult14 = (float2(frac( sin( ( ( ceil( uv_TexCoord1.x ) / 3.0 ) * 515.59 ) ) ) , frac( sin( ( ( ceil( uv_TexCoord1.y ) / 3.0 ) * 539.0 ) ) )));
			float2 lerpResult17 = lerp( i.uv_texcoord , appendResult14 , _glitch);
			float3 temp_cast_0 = (step( distance( lerpResult17 , float2( 0.5,0.5 ) ) , ( 0.75 * 0.5 ) )).xxx;
			o.Emission = temp_cast_0;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
2569;26;1918;1016;1619.476;-1274.307;1.3;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-1161.3,115.1;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;3,3;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CeilOpNode;4;-754.7523,-5.639661;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;6;-782.7523,346.3605;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;7;-566.7524,330.3606;Float;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;5;-538.7524,-21.63958;Float;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;9;-287.5518,-84.03954;Float;True;Random;-1;;3;542ea883f97451b44822d4bfebf90e34;0;2;10;FLOAT;515.59;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;10;-249.1518,282.3604;Float;True;Random;-1;;2;542ea883f97451b44822d4bfebf90e34;0;2;10;FLOAT;539;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;172.2499,428.8601;Float;False;Property;_glitch;glitch;0;0;Create;True;0;0;False;0;0.09164678;0;-0.1;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;14;24.44884,144.7604;Float;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-656.351,-303.2397;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;17;463.6495,-66.43974;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-982.8302,1395.706;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;32;-260.2802,1953.356;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;29;-718.8302,1478.706;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;30;-468.8302,1404.706;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;33;-1005.18,1833.756;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;37.1698,2054.706;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;277.1698,2016.706;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-795.8801,1853.256;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;35;-557.9802,1910.456;Float;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;26;-1352.83,747.7057;Float;False;Constant;_Color0;Color 0;1;0;Create;True;0;0;False;0;1,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;25;13.1698,865.7057;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;15;678.8492,-199.2395;Float;True;Shape-Circle;-1;;4;6c4ee9ad23603c34cad3f76edd5b3a61;0;3;13;FLOAT2;0.5,0.5;False;10;FLOAT2;0,0;False;6;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;27;-1242.83,597.7057;Float;False;Constant;_Color1;Color 1;1;0;Create;True;0;0;False;0;0,1,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-993.9125,1040.578;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;24;-471.7755,1101.307;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;22;-738.5614,1103.362;Float;True;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-1378.985,1062.633;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1038.4,59.2;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Amplify_Playground;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;0;1;1
WireConnection;6;0;1;2
WireConnection;7;0;6;0
WireConnection;5;0;4;0
WireConnection;9;8;5;0
WireConnection;10;8;7;0
WireConnection;14;0;9;0
WireConnection;14;1;10;0
WireConnection;17;0;16;0
WireConnection;17;1;14;0
WireConnection;17;2;18;0
WireConnection;28;0;19;1
WireConnection;32;0;35;0
WireConnection;29;0;28;0
WireConnection;30;0;29;0
WireConnection;33;0;19;1
WireConnection;36;0;32;0
WireConnection;37;0;36;0
WireConnection;34;0;33;0
WireConnection;35;0;34;0
WireConnection;25;0;27;0
WireConnection;25;1;26;0
WireConnection;25;2;24;0
WireConnection;15;10;17;0
WireConnection;21;0;19;1
WireConnection;24;0;22;0
WireConnection;22;0;21;0
WireConnection;0;2;15;0
ASEEND*/
//CHKSM=F204F3EAFCEEA64476012333D820EED58F95821B