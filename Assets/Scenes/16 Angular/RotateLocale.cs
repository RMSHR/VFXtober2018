using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateLocale : MonoBehaviour {

    public Vector3 direction;
    public float speed = 1f;

	void Update () {
        transform.Rotate(direction * speed * Time.deltaTime, Space.Self);
	}
}
