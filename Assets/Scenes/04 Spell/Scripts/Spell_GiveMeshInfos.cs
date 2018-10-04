using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class Spell_GiveMeshInfos : MonoBehaviour {

    public Material target;

    
	void Update () {
        target.SetVector("_maskPosition", transform.position);
        target.SetFloat("_maskRadius", transform.localScale.x);
	}

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, transform.localScale.x);
    }
}
