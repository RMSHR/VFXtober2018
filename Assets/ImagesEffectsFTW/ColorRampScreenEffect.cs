using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ColorRampScreenEffect : MonoBehaviour {

    public Color left, right;
    public float intensity = 0f;
    private Material material;

    void Awake()
    {
        material = new Material(Shader.Find("Hidden/ColorScreen"));
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (material != null)
        {
            material.SetColor("_Left", left);
            material.SetColor("_Right", right);
            material.SetFloat("_Intensity", intensity);
        }

        Graphics.Blit(source, destination, material);
    }
}
