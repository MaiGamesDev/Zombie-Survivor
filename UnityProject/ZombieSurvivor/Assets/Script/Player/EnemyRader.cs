using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyRader : MonoBehaviour
{
    [SerializeField]
    private Weapon01 weapon01;
    // Start is called before the first frame update


    private void OnTriggerEnter2D(Collider2D collision)
    {
        Debug.Log(collision);
        if (collision.CompareTag("Enemy"))
        {
            weapon01.target = collision.gameObject;
        }
        else
        {
            //weapon01.target = null;
        }
    }


    private void OnTriggerExit2D(Collider2D collision)
    {

    }
}
