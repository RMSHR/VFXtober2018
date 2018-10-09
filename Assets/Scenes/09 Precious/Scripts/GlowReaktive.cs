using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UnityEngine.PostProcessing.Utilities
{
    public class GlowReaktive : MonoBehaviour
    {

        public Reaktion.Reaktor reaktor;
        public float bloomMin, bloomMax = 0f;
        PostProcessingBehaviour behaviour;

        private void Awake()
        {
            behaviour = GetComponent<PostProcessingBehaviour>();
        }

        void Update()
        {
            PostProcessingProfile postfx = behaviour.profile;
            BloomModel.Settings model = postfx.bloom.settings;
            model.bloom.intensity = Mathf.Lerp(bloomMin, bloomMax, reaktor.Output);
            postfx.bloom.settings = model;
        }
    }
}
