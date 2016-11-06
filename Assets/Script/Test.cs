using UnityEngine;
using System.Collections;

public class Test : MonoBehaviour
{
    public  GameObject foundation;
    //void FixedUpdate()
    //{
    //    Rotation();
    //}
    //public void Rotation()
    //{
    //    if (Input.GetKeyUp(KeyCode.Alpha8))
    //    {
    //        print("90");
    //        foundation.transform.rotation = new Quaternion(0.0f, 90.0f, 0.0f,0.0f);
    //    }
    //}
    public void OnMouseDown()
    {
     Object f=  Instantiate(foundation, new Vector3(GetComponent<Renderer>().transform.position.x, 0, GetComponent<Renderer>().transform.position.z), Quaternion.identity);
        f.name = "foundation " + GetComponent<Renderer>().transform.position.x+ " " +GetComponent<Renderer>().transform.position.z;
    }

    public void OnMouseEnter()
    {

        GetComponent<Renderer>().material.color = Color.green;
    }
    public void OnMouseExit()
    {

        GetComponent<Renderer>().material.color = Color.white;
    }
}