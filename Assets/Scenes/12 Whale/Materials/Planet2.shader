// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "12/Planet2"
{
	Properties
	{
		_Color0("Color 0", Color) = (0.5754717,0.05157528,0.05157528,0)
		_Color1("Color 1", Color) = (0.5,0.497002,0.2429245,0)
		_fresnel("fresnel", Color) = (1,1,1,0)
		_FoamDist("FoamDist", Float) = 0.1
		_bias("bias", Float) = 0
		_scale("scale", Float) = 1
		_DepthFactor("DepthFactor", Float) = 0
		_power("power", Float) = 5
		_FoamColor("FoamColor", Color) = (1,0,0.8365736,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit alpha:fade keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
			float3 worldPos;
			float3 worldNormal;
		};

		uniform float4 _FoamColor;
		uniform float4 _Color0;
		uniform float4 _Color1;
		uniform sampler2D _CameraDepthTexture;
		uniform float _FoamDist;
		uniform float _DepthFactor;
		uniform float _bias;
		uniform float _scale;
		uniform float _power;
		uniform float4 _fresnel;

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 lerpResult4 = lerp( _Color0 , _Color1 , i.uv_texcoord.y);
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float screenDepth19 = LinearEyeDepth(UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture,UNITY_PROJ_COORD(ase_screenPos))));
			float distanceDepth19 = abs( ( screenDepth19 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _FoamDist ) );
			float4 lerpResult21 = lerp( _FoamColor , lerpResult4 , ( 1.0 - saturate( ( ( distanceDepth19 - ase_screenPosNorm.w ) * _DepthFactor ) ) ));
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNDotV5 = dot( normalize( ase_worldNormal ), ase_worldViewDir );
			float fresnelNode5 = ( _bias + _scale * pow( 1.0 - fresnelNDotV5, _power ) );
			o.Emission = ( lerpResult21 + ( fresnelNode5 * _fresnel ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15301
43.2;710.4;1448;790;2069.568;282.3058;2.078974;True;False
Node;AmplifyShaderEditor.RangedFloatNode;18;-1415.474,-425.779;Float;False;Property;_FoamDist;FoamDist;3;0;Create;True;0;0;False;0;0.1;-0.26;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;12;-1266.644,-293.8371;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DepthFade;19;-1083.474,-434.779;Float;False;True;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;14;-898.745,-305.5367;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-866.245,-171.6367;Float;False;Property;_DepthFactor;DepthFactor;6;0;Create;True;0;0;False;0;0;0.34;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-655.6454,-293.8371;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;16;-476.2452,-250.9366;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-764.75,236.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;10;-670,535.5;Float;False;Property;_scale;scale;5;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3;-771.75,55.5;Float;False;Property;_Color1;Color 1;1;0;Create;True;0;0;False;0;0.5,0.497002,0.2429245,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-655,619.5;Float;False;Property;_power;power;7;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2;-687.75,-99.5;Float;False;Property;_Color0;Color 0;0;0;Create;True;0;0;False;0;0.5754717,0.05157528,0.05157528,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;9;-685,441.5;Float;False;Property;_bias;bias;4;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;5;-440,440.5;Float;False;Tangent;4;0;FLOAT3;0,0,1;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;6;-393,610.5;Float;False;Property;_fresnel;fresnel;2;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;20;-250.4658,-553.6121;Float;False;Property;_FoamColor;FoamColor;8;0;Create;True;0;0;False;0;1,0,0.8365736,0;1,0,0.8365736,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;17;-263.0453,-284.7367;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4;-395.75,117.5;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;21;-46.72639,16.02687;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-157,460.5;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;264.2667,160.2097;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;518.3979,93.36923;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;12/Planet2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;0;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;19;0;18;0
WireConnection;14;0;19;0
WireConnection;14;1;12;4
WireConnection;15;0;14;0
WireConnection;15;1;13;0
WireConnection;16;0;15;0
WireConnection;5;1;9;0
WireConnection;5;2;10;0
WireConnection;5;3;11;0
WireConnection;17;1;16;0
WireConnection;4;0;2;0
WireConnection;4;1;3;0
WireConnection;4;2;1;2
WireConnection;21;0;20;0
WireConnection;21;1;4;0
WireConnection;21;2;17;0
WireConnection;7;0;5;0
WireConnection;7;1;6;0
WireConnection;8;0;21;0
WireConnection;8;1;7;0
WireConnection;0;2;8;0
ASEEND*/
//CHKSM=15A1EC50825FF6560D6BD4A3BF7F6FD6EDCBEE76