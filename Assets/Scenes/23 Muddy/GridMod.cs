using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class GridMod : MonoBehaviour {

    public float left, right;
    public Material mudCubeMaterial;
    public Camera mainCamera;

    public float viz;

	void Update () {
        Vector3 screenPos = mainCamera.WorldToViewportPoint(transform.position);
        viz = screenPos.x;

        mudCubeMaterial.SetFloat("_WaveOffset", Mathf.Clamp01(screenPos.x)-1f);
    }
}
