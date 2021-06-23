### Account
#### Create Admin
```
/createAdmin
methods: POST
```
#### Create Captain
```
/captainregister
methods: POST
```
#### Create Client
```
/clientregister
methods: POST
```
#### Create StoreOwner
```
/storeownerregister
methods: POST
```
### Client Profile
### Create Client Profile
```
ROLE_CLIENT
/clientprofile
methods: POST
```
### Update Client Profile
```
ROLE_CLIENT
/clientprofile
methods: PUT
```
### Get Client Profile By ClientID
```
ROLE_CLIENT
/clientProfile
methods: GET
```
### Get Client Profile By ID
```
ROLE_ADMIN
/clientprofilebyid/{id}
methods: GET
```
### Get Clients Profile
```
ROLE_ADMIN
/clientsProfile
methods: GET
```
### Order
### Create Order By Client
```
ROLE_CLIENT
/clientorder
methods: POST
```
### order Update
```
/orderUpdatebyclient
methods: PUT
```
### Get Order Status By Order Number
```
/orderstatusbyordernumber/{orderNumber}
methods: GET
```
### Get Orders By ClientID
```
/ordersbyclientid
methods: GET
```
### Order Cancel
```
/ordercancel/{orderNumber}
methods: PUT
```
### Store Category
### Create Store Category
```
ROLE_ADMIN
/createstorecategory
methods: POST
```
### Update Store Category
```
ROLE_ADMIN
/createstorecategory
methods: PUT
```
### Get Store Categories
```
/storecategories
methods: GET
```
### Get Store Category By Id
```
/storecategory/{id}
methods: GET
```
### Product
### Create Product By Admin
```
ROLE_ADMIN
/createproductbyadmin
methods: POST
```
### Create Product By Store Owner
```
ROLE_OWNER
/createproductbystoreowner
methods: POST
```
### Products By Store Owner
```
ROLE_OWNER
/productsbystoreowner
methods: GET
```
### Get Products
```
/products
methods: GET
```
### Get Product By Id
```
/product/{id}
methods: GET
```
### Get Product By ProductCategoryId
```
/productscategoryid/{productCategoryID}
methods: GET
```
### Get Products By ProductCategoryId And StoreOwnerProfileId
```
/productsbycategoryidandstoreownerprofileid/{productCategoryID}/{storeOwnerProfileId}
methods: GET
```
### Get products Top Wanted
```
/productstopwanted
methods: GET
```
### Get products Top Wanted Of Specific Store Owner
```
/productstopwantedofspecificstoreowner/{storeOwnerProfileId}
methods: GET
```
### ProductCategory
### Create ProductCategory
```
ROLE_ADMIN
/createproductcategory
methods: POST
```
### Update Product Category
```
ROLE_ADMIN
/updateproductcategory
methods: PUT
```
### Get Product Categories
```
/productcategories
methods: GET
```
### Get ProductCategory
```
/productcategory/{id}
methods: GET
```