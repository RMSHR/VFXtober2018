using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ParticlesVectorField : MonoBehaviour {

    public Camera cameraTarget;
    public Texture2D angularField;
    public float velocitySpeed = 2f;

    ParticleSystem system;
    ParticleSystem.Particle[] particles;
	
	// Update is called once per frame
	void LateUpdate () {

        if (cameraTarget == null)
            return;

        InitializeIfNeeded();

        int numParticlesAlive = system.GetParticles(particles);

        for (int i = 0; i < numParticlesAlive; i++)
        {
            Vector3 _particlePosition = new Vector3(
                cameraTarget.WorldToViewportPoint(particles[i].position).x,
                cameraTarget.WorldToViewportPoint(particles[i].position).y,
                0f
                );

            Color c = angularField.GetPixel(
                (int)(_particlePosition.x * 512f),
                (int)(_particlePosition.y * 512f)
                );

            //particles[i].startColor = c;
            particles[i].velocity = new Vector3(c.r-0.5f, c.g-0.5f, 0f) * velocitySpeed;
        }

        system.SetParticles(particles, numParticlesAlive);
    }

    void InitializeIfNeeded()
    {
        if (system == null)
            system = GetComponent<ParticleSystem>();

        if (particles == null || particles.Length < system.main.maxParticles)
            particles = new ParticleSystem.Particle[system.main.maxParticles];
    }
}
