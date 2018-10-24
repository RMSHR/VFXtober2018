using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CouoperLaSaucisse : MonoBehaviour {

    Rigidbody _rigidbody;

    private void Awake()
    {
        _rigidbody = GetComponent<Rigidbody>();
    }

    private void OnTriggerEnter(Collider other)
    {
        _rigidbody.isKinematic = false;
        _rigidbody.useGravity = true;
        transform.parent = null;
    }
}
