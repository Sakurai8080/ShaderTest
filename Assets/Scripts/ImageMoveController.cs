using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ImageMoveController : MonoBehaviour
{
    float _moveSpeed = 0.5f;

    Coroutine currentCoroutine = default;

    // Start is called before the first frame update
    void Start()
    {
        currentCoroutine = StartCoroutine(ImageMoveCoroutine());
    }

    IEnumerator ImageMoveCoroutine()
    {
        while (true)
        {
            Vector3 position = transform.position;
            position.x += -_moveSpeed * Time.deltaTime;
            transform.position = position;
            yield return null;
        }
    }
}
