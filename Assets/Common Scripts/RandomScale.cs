using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomScale : MonoBehaviour {

    public float minScale, maxScale;
    public bool x, y, z;
    public bool evenScale = false;

    [ContextMenu("Random Scale")]
    public void RandomSca()
    {
        Vector3 sca = transform.localScale;

        if (evenScale)
        {
            float newScale = Random.Range(minScale, maxScale);
            sca = new Vector3(newScale, newScale, newScale);
        }
        else
        {
            if (x) sca.x = Random.Range(minScale, maxScale);
            if (y) sca.y = Random.Range(minScale, maxScale);
            if (z) sca.z = Random.Range(minScale, maxScale);
        }

        transform.localScale = sca;
    }
}
