using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spell_Move : MonoBehaviour {

    public Vector3 direction;
    public float speed;

	void Update () {
        transform.Translate(direction * speed * Time.deltaTime);	
	}
}
