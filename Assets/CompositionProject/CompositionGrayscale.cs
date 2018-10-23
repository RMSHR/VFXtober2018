using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class CompositionGrayscale : MonoBehaviour {

    public enum grayscaleModeEnum
    {
        rgb,
        r,
        g,
        b
    }

    [Header("Global Settings")]
    public bool disableOnRuntime = true;

    [Header("Channel Mode")]
    public grayscaleModeEnum grayscaleMode = grayscaleModeEnum.rgb;

    [Header("Isohelie")]
    public bool activeIsohelie = false;
    public int isoNumber = 4;

    private Material material;

    void Awake()
    {
        material = new Material(Shader.Find("Hidden/CompositionGrayscale"));
        if (Application.isPlaying && disableOnRuntime)
            enabled = false;
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (material != null)
        {
            switch(grayscaleMode)
            {
                case grayscaleModeEnum.rgb:
                    SetGrayscaleMode(1f, 0f, 0f, 0f);
                    break;
                case grayscaleModeEnum.r:
                    SetGrayscaleMode(0f, 1f, 0f, 0f);
                    break;
                case grayscaleModeEnum.g:
                    SetGrayscaleMode(0f, 0f, 1f, 0f);
                    break;
                case grayscaleModeEnum.b:
                    SetGrayscaleMode(0f, 0f, 0f, 1f);
                    break;
            }

            material.SetFloat("activeIso", activeIsohelie?1f:0f);
            material.SetFloat("isoNbr", isoNumber);
        }

        Graphics.Blit(source, destination, material);
    }

    void SetGrayscaleMode(float _rgb, float _r, float _g, float _b)
    {
        material.SetFloat("rgb", _rgb);
        material.SetFloat("r", _r);
        material.SetFloat("g", _g);
        material.SetFloat("b", _b);
    }
}
