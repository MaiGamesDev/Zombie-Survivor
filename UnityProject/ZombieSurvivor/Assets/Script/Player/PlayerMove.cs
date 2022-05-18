using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMove : MonoBehaviour
{
    private Rigidbody2D rigidbody;
    [SerializeField]
    private float speed;
    [SerializeField]
    private float maxSpeed;
    

    private float inputX;
    private float inputY;

    private float h;
    private float v;


    private void Awake()
    {
        rigidbody = GetComponent<Rigidbody2D>();
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        GetInput();
        PlayerRotation();
    }

    private void FixedUpdate()
    {        
        Move();
    }

    private void Move()
    {
        Vector2 moveVec = new Vector2(h, v);
        rigidbody.AddForce(moveVec * speed);

        //�ִ� �ӵ� ����
        moveVec = rigidbody.velocity;

        if (rigidbody.velocity.x > maxSpeed)
            moveVec.x = maxSpeed;
        else if (rigidbody.velocity.x < (maxSpeed * -1f))
            moveVec.x = maxSpeed * -1f;

        if (rigidbody.velocity.y > maxSpeed)
            moveVec.y = maxSpeed;
        else if (rigidbody.velocity.y < (maxSpeed * -1f))
            moveVec.y = maxSpeed * -1f;

        //������ ����
        rigidbody.velocity = moveVec;
    }

    private void GetInput()
    {
        h = Input.GetAxisRaw("Horizontal");
        v = Input.GetAxisRaw("Vertical");

    }

    private void PlayerRotation()
    {
        // ���� ȸ��
        if (h == 1)
        {
            transform.localEulerAngles = new Vector3(0, 0, 0);
        }
        // ���� ȸ��
        else if (h == -1)
        {
            transform.localEulerAngles = new Vector3(0, 0, -180);
        }

        // ��� ȸ��
        if (v == 1)
        {
            transform.localEulerAngles = new Vector3(0, 0, 90);
        }
        // �ϴ� ȸ��
        else if (v == -1)
        {
            transform.localEulerAngles = new Vector3(0, 0, -90);
        }

        // �»�� ȸ��
        if (h == -1 && v == 1)
        {
            transform.localEulerAngles = new Vector3(0, 0, 135);
        }
        // ���� ȸ��
        else if (h == 1 && v == 1)
        {
            transform.localEulerAngles = new Vector3(0, 0, 45);
        }
        // ���ϴ� ȸ��
        else if (h == -1 && v == -1)
        {
            transform.localEulerAngles = new Vector3(0, 0, -135);
        }
        // ���ϴ� ȸ��
        else if (h == 1 && v == -1)
        {
            transform.localEulerAngles = new Vector3(0, 0, -45);
        }

    }
}