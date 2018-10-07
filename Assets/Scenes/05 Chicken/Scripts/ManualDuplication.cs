using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ManualDuplication : MonoBehaviour {

    public int iterations = 10;
    public Vector3 offset;

    [ContextMenu("Duplicate")]
	public void Duplicate()
    {
        for(int i=0; i<iterations; i++)
        {
            Vector3 pos = transform.position + offset * i;
            Instantiate(gameObject, pos, transform.rotation);
        }
    }
}
