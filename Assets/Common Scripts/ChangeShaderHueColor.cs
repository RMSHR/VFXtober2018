using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ChangeShaderHueColor : MonoBehaviour {

    [Range(0.0f, 1.0f)]
    public float hue = 0.0f;
    public string variableName = "";

    Renderer _renderer;

    private void Awake()
    {
        _renderer = GetComponent<Renderer>();
    }

    void Update () {

        if (variableName == "")
            return;

        float h, s, v;
        Color.RGBToHSV(_renderer.sharedMaterial.GetColor(variableName), out h, out s, out v);

        h = hue;

        _renderer.sharedMaterial.SetColor(variableName, Color.HSVToRGB(h, s, v));

    }
}
