using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReaktorShaderFloatChanger : MonoBehaviour {

    public Material targetMaterial;
    public Reaktion.Reaktor reaktor;
    public float minValue, maxValue;
    public string variableName = "";

    Renderer _renderer;

    private void Awake()
    {
        _renderer = GetComponent<Renderer>();
    }

    void Update () {

        if (variableName == "")
            return;

        if (targetMaterial == null)
        {
            _renderer.material.SetFloat(
                variableName,
                Mathf.Lerp(minValue, maxValue, reaktor.Output)
                );
        }
        else
        {
            targetMaterial.SetFloat(
                variableName,
                Mathf.Lerp(minValue, maxValue, reaktor.Output)
                );
        }

    }
}
