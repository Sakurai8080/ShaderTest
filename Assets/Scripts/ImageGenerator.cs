using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ImageGenerator : MonoBehaviour
{
    [SerializeField]
    private List<GameObject> _shaderArtImages;
    float _imageSetPlusSize;
    float _imageOffsetSize = 0.5f;

    private void Awake()
    {
        _imageSetPlusSize = _shaderArtImages[0].transform.localScale.x;
        Setup();
    }

    private void Setup()
    {
        Vector3 newPosition = transform.position;

        foreach (var imagePrefab in _shaderArtImages)
        {
            newPosition.x += _imageSetPlusSize + _imageOffsetSize;
            GameObject currentImage = imagePrefab;
            Instantiate(currentImage,newPosition, Quaternion.identity,transform);

        }
    }
}
