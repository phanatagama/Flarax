# API Architecture Design
## Get User By Email or UID

Endpoint: **/api/v1/users/{param}**

Method: GET

| **Parameter** | **Description** |
| --- | --- |
| uid | Filter by User ID |
| email | Filter by User Email |

**Response:**
```
{ 
    Status: 200 OK, 
    Message: "Successful",
    Data: {
      Email: "dummyemail@gmail.com",
      Fullname: "dummy",
      phoneNumber: "628984872738",
      photoUrl: "https://www.gravatar.com/avatar/4bcf971a03fd45ec785e6fe4c70ce44c.png?s=200&amp;d=retro&amp;r=pg",
      Uid: "Rh7QC4pQTugjgputT6QeEsLFY5t2",
    }
} 
```

## Create User Data

Endpoint: **/api/v1/users/**

Method: POST

User object must contains:

| **Parameter** | **Description** |
| --- | --- |
| uid | UID of User |
| email | Email of User |
| fullname | Fullname of User |
| phone | Phone number of user |
| photoUrl | Image Url of User |

**Response:**
```
{ 
    Status: 200 OK, 
    Message: "Successful", 
    Data: {
      "total_data":1,
      "success_data":1,
      "fail_data":0,
      "success_rows_data":[
        {
          "uid":2147732129
        }
      ]
    }
 } 
 ```
 
## Get All Products

Endpoint: **/api/v1/products/**

Method: GET

**Response:**
```
{ 
    Status: 200 OK, 
    Message: "Successful",
    Data: [
       {
          createdUpdatedAt: "2021-12-08T20:27:06.264093",
          productAddress: "Jalan Kenanga 5, Desa Gebang Kecamatan Gebang",
          productCategory: "Fashion",
          productCity: "Gilimanuk",
          productDescription: "Baju Bekas masih bisa dipakai",
          productName: "Baju Model Wanita Ukuran L",
          productPictureUrl: "https://firebasestorage.googleapis.com/v0/b/flarax-app.appspot.com/o/image_picker-886170416.jpg?alt=media&amp;token=582d153e-8f95-43a7-922d-92de404cd033",
          productProvince: "Bali"
          productStatus: "Available"
          Uid: "673mqaIFD1OznKr5eew4Gst1hAZ2"
       },{
          createdUpdatedAt: "2021-12-08T20:27:06.264093",
          productAddress: "Jalan Kenanga 5, Desa Gebang Kecamatan Gebang",
          productCategory: "Fashion",
          productCity: "Gilimanuk",
          productDescription: "Baju Bekas masih bisa dipakai",
          productName: "Baju Model Wanita Ukuran L",
          productPictureUrl: "https://firebasestorage.googleapis.com/v0/b/flarax-app.appspot.com/o/image_picker-886170416.jpg?alt=media&amp;token=582d153e-8f95-43a7-922d-92de404cd033",productProvince: "Bali",
          productStatus: "
          Available",
          Uid: "673mqaIFD1OznKr5eew4Gst1hAZ2",
       },
    ]
} 
```

## Get Product By ID

Endpoint: **/api/v1/products/{id}**

Method: GET

| **Parameter** | **Description** |
| --- | --- |
| id | Id of document product |

**Response:**

```
{ 
    Status: 200 OK, 
    Message: "Successful",
    Data: {
          createdUpdatedAt: "2021-12-08T20:27:06.264093",
          productAddress: "Jalan Kenanga 5, Desa Gebang Kecamatan Gebang",
          productCategory: "Fashion",
          productCity: "Gilimanuk",
          productDescription: "Baju Bekas masih bisa dipakai",
          productName: "Baju Model Wanita Ukuran L",
          productPictureUrl: "https://firebasestorage.googleapis.com/v0/b/flarax-app.appspot.com/o/image_picker-886170416.jpg?alt=media&amp;token=582d153e-8f95-43a7-922d-92de404cd033",
          productProvince: "Bali"
          productStatus: "Available"
          Uid: "673mqaIFD1OznKr5eew4Gst1hAZ2"
     },
} 
```

## Delete Product By ID

Endpoint: **/api/v1/products/{id}**

Method: DELETE

| **Parameter** | **Description** |
| --- | --- |
| id | Id of document product |

\*id product was required

**Response:**
```
{ 
    Status: 200 OK, 
    Message: "Successful", 
    Data:{
        "total_data":1,
        "succeed_rows":1,
        "failed_rows":0,
        "failed_rows_data":null
    }
}
```

## Update Product By ID

Endpoint: **/api/v1/products/{id}**

Method: PUT

| **Parameter** | **Description** |
| --- | --- |
| id | Id of document product |

\*id product was required

Product object contains:

| **Parameter** | **Description** |
| --- | --- |
| id | Id of document product |
| productStatus | Status of product |
| productName | Name of Product |
| productDescription | Description of Product |
| productCategory | Category of product |
| productAddress | Address of product |
| productCity | City of product |
| productProvince | Province of Product |
| productPictureUrl | Picture of product |

**Response:**

```
{ 
    Status: 200 OK, 
    Message: "Successful", 
    Data: {
      "total_data":1,
      "success_data":1,
      "fail_data":0,
      "success_rows_data":[
        {
          "product_id":1
        }
      ]
    }
 } 
 ```

## Create Product

Endpoint: **/api/v1/products/**

Method: POST

Product object contains:

| **Parameter** | **Description** |
| --- | --- |
| id | Id of document product |
| productStatus | Status of product |
| productName | Name of Product |
| productDescription | Description of Product |
| productCategory | Category of product |
| productAddress | Address of product |
| productCity | City of product |
| productProvince | Province of Product |
| productPictureUrl | Picture of product |

**Response:**
```
{ 
    Status: 200 OK, 
    Message: "Successful", 
    Data: {
      "total_data":1,
      "success_data":1,
      "fail_data":0,
      "success_rows_data":[
        {
          "product_id":1
        }
      ]
    }
 } 
