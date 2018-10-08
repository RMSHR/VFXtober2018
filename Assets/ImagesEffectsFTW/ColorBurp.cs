using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ColorBurp : MonoBehaviour {



    [Range(0.0f, 1.0f)]
    public float intensity;
    public bool noiseAnimation = true;
    public float noiseIntensity = 1.0f;
    private Material material;

    // Creates a private material used to the effect
    void Awake()
    {
        material = new Material(Shader.Find("Hidden/ColorBurpEffect"));
    }

    // Postprocess the image
    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (intensity == 0)
        {
            Graphics.Blit(source, destination);
            return;
        }

        if (material != null)
        {
            float i = intensity;
            if (noiseAnimation) i *= Random.Range(0f, noiseIntensity);
            material.SetFloat("_Burp", i);
        }
        Graphics.Blit(source, destination, material);
    }
}
