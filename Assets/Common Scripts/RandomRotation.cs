using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomRotation : MonoBehaviour {

    public bool x, y, z;

    [ContextMenu("Random Rotation")]
	public void RandomRot()
    {
        Vector3 rot = transform.rotation.eulerAngles;

        if (x) rot.x = Random.Range(0f, 360f);
        if (y) rot.y = Random.Range(0f, 360f);
        if (z) rot.z = Random.Range(0f, 360f);

        transform.rotation = Quaternion.Euler(rot);
    }
}
