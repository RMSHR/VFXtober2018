// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "18/Background"
{
	Properties
	{
		_Color0("Color 0", Color) = (0,0,0,0)
		_Color1("Color 1", Color) = (0,0,0,0)
		_rotationSpeed("rotationSpeed", Float) = 1
		_Light("Light", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Light;
		uniform float4 _Color0;
		uniform float4 _Color1;
		uniform float _rotationSpeed;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord2 = i.uv_texcoord + float2( -0.5,-0.5 );
			float mulTime29 = _Time.y * _rotationSpeed;
			float cos17 = cos( mulTime29 );
			float sin17 = sin( mulTime29 );
			float2 rotator17 = mul( uv_TexCoord2 - float2( 0,0 ) , float2x2( cos17 , -sin17 , sin17 , cos17 )) + float2( 0,0 );
			float2 break18 = rotator17;
			float temp_output_5_0 = atan2( break18.y , break18.x );
			float temp_output_15_0 = frac( ( frac( ( ( temp_output_5_0 + 4.0 ) * 0.125 ) ) * 10.0 ) );
			float smoothstepResult22 = smoothstep( 0.4 , 0.41 , temp_output_15_0);
			float4 lerpResult23 = lerp( _Color0 , _Color1 , smoothstepResult22);
			o.Albedo = ( _Light * lerpResult23 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
2567;29;1906;1004;3366.853;225.4387;1.3;True;True
Node;AmplifyShaderEditor.RangedFloatNode;28;-2875.453,473.9613;Float;False;Property;_rotationSpeed;rotationSpeed;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-2616.872,280.3188;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;-0.5,-0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;29;-2605.053,485.6613;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;17;-2348.952,327.0616;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;18;-2127.952,299.7614;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ATan2OpNode;5;-1877.871,230.919;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6;-1561.871,85.91901;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-1280.87,96.91901;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0.125;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;13;-995.0977,95.44458;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-749.0977,175.4446;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;15;-558.0977,230.4446;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;24;-267.6526,-177.3386;Float;False;Property;_Color0;Color 0;0;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;22;-318.3526,629.9615;Float;True;3;0;FLOAT;0;False;1;FLOAT;0.4;False;2;FLOAT;0.41;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;25;-287.1526,34.56134;Float;False;Property;_Color1;Color 1;1;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;23;84.64745,210.0613;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;27;78.14746,-29.13864;Float;False;Property;_Light;Light;3;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;11;-1600.371,525.2896;Float;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;9;-1178.098,493.4446;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;16;-318.0977,308.4446;Float;True;2;0;FLOAT;0;False;1;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;349.8475,115.1613;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;10;-1404.098,507.4446;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;12;-1879.824,589.5996;Float;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;536.6998,51.69999;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;18/Background;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;29;0;28;0
WireConnection;17;0;2;0
WireConnection;17;2;29;0
WireConnection;18;0;17;0
WireConnection;5;0;18;1
WireConnection;5;1;18;0
WireConnection;6;0;5;0
WireConnection;7;0;6;0
WireConnection;13;0;7;0
WireConnection;14;0;13;0
WireConnection;15;0;14;0
WireConnection;22;0;15;0
WireConnection;23;0;24;0
WireConnection;23;1;25;0
WireConnection;23;2;22;0
WireConnection;11;0;12;0
WireConnection;9;0;10;0
WireConnection;16;0;15;0
WireConnection;26;0;27;0
WireConnection;26;1;23;0
WireConnection;10;0;5;0
WireConnection;10;1;11;0
WireConnection;0;0;26;0
ASEEND*/
//CHKSM=1B0F4785E2DDA0967A3AB31753AAD46D0258ADB2