using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BreakableCell : MonoBehaviour {

    Rigidbody _rigidbody;

    private void Awake()
    {
        _rigidbody = GetComponent<Rigidbody>();
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.tag == "Breakable")
        {
            _rigidbody.useGravity = true;
            _rigidbody.isKinematic = false;

            Destroy(this);
        }

    }
}
