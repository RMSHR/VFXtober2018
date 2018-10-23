using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class CompositionColorPerfection : MonoBehaviour {

    [Header("Target Materials")]
    public Material mainMaterial;
    public Material dualMaterial;

    [Header("Color correction")]
    public Color mainColor;
    public bool applyHue, applySaturation, applyValue;

	void Update () {
        if (mainMaterial == null)
            return;

        mainMaterial.color = mainColor;

        float h, s, v;
        Color.RGBToHSV(mainColor, out h, out s, out v);

        if (applyHue)           h = (h + 0.5f) % 1;
        if (applySaturation)    s = (s + 0.5f) % 1;
        if (applyValue)         v = (v + 0.5f) % 1;

        dualMaterial.color = Color.HSVToRGB(h, s, v);

    }
}
