using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class SetShaderVector : MonoBehaviour {

    public Transform targetTransformToCopy;
    public string variableName;
    Renderer _renderer;

    private void Awake()
    {
        _renderer = GetComponent<Renderer>();
    }

    void Update () {
        if (variableName == "")
            return;

        _renderer.sharedMaterial.SetVector(variableName, targetTransformToCopy.position);
    }
}
