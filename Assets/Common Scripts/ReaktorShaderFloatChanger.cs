using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReaktorShaderFloatChanger : MonoBehaviour {

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

        _renderer.material.SetFloat(
            variableName,
            Mathf.Lerp(minValue, maxValue, reaktor.Output)
            );

    }
}
