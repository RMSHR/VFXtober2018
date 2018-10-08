using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class MirrorEffect : MonoBehaviour {

    public bool mirrorX, mirrorY;
    [Range(0.0f, 1.0f)]
    public float MirrorXoffset, MirrorYoffset;
    private Material material;

    void Awake()
    {
        material = new Material(Shader.Find("Hidden/MirrorEffect"));
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (material != null)
        {
            material.SetFloat("_MirrorX", mirrorX ? 1.0f : 0.0f);
            material.SetFloat("_MirrorY", mirrorY ? 1.0f : 0.0f);

            material.SetFloat("_MirrorXoffset", MirrorXoffset);
            material.SetFloat("_MirrorYoffset", MirrorYoffset);
        }

        Graphics.Blit(source, destination, material);
    }
}
