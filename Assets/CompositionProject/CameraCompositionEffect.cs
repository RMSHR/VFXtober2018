using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

[ExecuteInEditMode]
public class CameraCompositionEffect : MonoBehaviour {


    [Header("Global Settings")]
    public bool disableOnRuntime = true;
    [Range(0.01f, 0.9f)]
    public float dotLength = 0.5f;
    [Range(0.001f, 0.01f)]
    public float dotWidth = 0.01f;

    [Header("Third rules")]
    public bool activeThirdRules = true;

    [Header("Center rule")]
    public bool activeCenterRule = true;

    private Material material;

    void Awake()
    {
        material = new Material(Shader.Find("Hidden/CameraComposition"));
        if (Application.isPlaying && disableOnRuntime)
            enabled = false;
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (material != null)
        {
            material.SetFloat("_activeThirdRules", activeThirdRules?1.0f:0.0f);
            material.SetFloat("_activeCenterRule", activeCenterRule ? 1.0f : 0.0f);
            material.SetFloat("_dotLength", dotLength);
            material.SetFloat("_dotWidth", dotWidth);
        }

        Graphics.Blit(source, destination, material);
    }
}
