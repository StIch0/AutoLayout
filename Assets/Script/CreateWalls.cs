using UnityEngine;
using System.Collections;

public class CreateWalls : MonoBehaviour {
   public GameObject plane;
  Object clone;
    void Start()
    {

        Create();
    }
    void Create()
    {
        for (int j = 0; j < 10; j++)
        {
            for (int i = 0; i < 10; i++)
            {
                clone =  Instantiate(plane, new Vector3(i * 1.0f, 0, j*1.0f), Quaternion.identity) ;
                clone.name = "Plane " + i+ " " +j;
            }
        }
       
    }

}
