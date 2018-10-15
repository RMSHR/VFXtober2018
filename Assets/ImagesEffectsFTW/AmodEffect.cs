using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class AmodEffect : MonoBehaviour {

    public float repeat = 5f;
    private Material material;

    void Awake()
    {
        material = new Material(Shader.Find("Hidden/AmodEffect"));
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (material != null)
        {
            material.SetFloat("_Repeat", repeat);
        }

        Graphics.Blit(source, destination, material);
    }
}
