using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SimpleRotate : MonoBehaviour {

    public Vector3 angle;
    public float speed = 1f;

	void Update () {
        transform.Rotate(angle * speed * Time.deltaTime);
	}
}
