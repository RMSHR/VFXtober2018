using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChickenLevel : MonoBehaviour {

    public Transform _target;
    public float rotationSpeed = 1f;
    public Vector3 rotationVector;
    Renderer _renderer;

	// Use this for initialization
	void Awake () {
        _renderer = GetComponentInChildren<Renderer>();
	}
	
	// Update is called once per frame
	void Update () {
        transform.Rotate(rotationVector * rotationSpeed * Time.deltaTime);

        // TODO Shader
	}
}
