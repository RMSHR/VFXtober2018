using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveForward : MonoBehaviour {

    public float speed = 5f;
    public float life = 2f;

	void Update () {

        transform.Translate(Vector3.forward * Time.deltaTime * speed);

        life -= Time.deltaTime;

        if (life > 0f)
            return;

        Destroy(gameObject);
	}
}
