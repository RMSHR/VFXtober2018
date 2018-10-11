using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShootGenerator : MonoBehaviour {

    public float delay = 0.1f;
    public GameObject prefab;
    float cpt;

	void Update () {
        cpt -= Time.deltaTime;

        if (cpt > 0f)
            return;

        Instantiate(prefab, transform.position, prefab.transform.rotation);

        cpt = delay;
    }
}
