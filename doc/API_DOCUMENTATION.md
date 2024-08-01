# Customer Invitation API Documentation

## Endpoint

### POST /api/v1/customers

This endpoint accepts a file containing customer data in JSON lines format and returns the names and user IDs of customers who are within 100km of the Mumbai office, sorted by User ID in ascending order.

#### URL

`http://localhost:3000/api/v1/customers`

#### Method

`POST`

#### Parameters

- `file` (required): The `customers.txt` file containing customer data in JSON lines format.

#### Request Example
```
POST /api/v1/customers
Content-Type: multipart/form-data
file: <file content>
```

#### Sample `customers.txt` Content

```json
{"user_id":1,"name":"Aarav Patel","latitude":"18.602288688693122","longitude":"72.6075518864525"}
{"user_id":2,"name":"Vivaan Sharma","latitude":"18.602594091767223","longitude":"72.60806520318829"}
{"user_id":3,"name":"Aditya Mehra","latitude":"18.59385620790292","longitude":"72.60969846104362"}
{"user_id":4,"name":"Vihaan Iyer","latitude":"20.592086969743228","longitude":"72.62191518797307"}
```

#### Response Example: 

```json
[
  {
    "name": "Aarav Patel",
    "user_id": 1
  },
  {
    "name": "Vivaan Sharma",
    "user_id": 2
  },
  {
    "name": "Aditya Mehra",
    "user_id": 3
  },
]
```

#### Error Responses:

```json
{
  "error": "File not provided"
}

{
  "error": "Invalid JSON format"
}
```
