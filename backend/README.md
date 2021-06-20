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
### Order 
### Client Order
#### Create Client Order
```
/clientorder
methods: POST
```

#### Get Order Status By OrderNumber
```
/orderstatusbyordernumber/{orderNumber}
methods: GET
```

### Store Owner Profile
### Create StoreOwner Profile
```
ROLE_OWNER
/storeowner
methods: POST
```
### Create StoreOwner Profile By Admin
```
ROLE_ADMIN
/storeownercreatbyadmin
methods: POST
```
### Get StoreOwner By CategoryId
```
/storeownerbycategoryid/{storeCategoryId}
methods: GET
```
### Get All StoreOwners
```
/storeowners
methods: GET
```
### Get StoreOwner Profile By UserId
```
ROLE_OWNER
/storeownerprofile
methods: GET
```
### Get StoreOwner Profile By ID
```
ROLE_ADMIN
/storeownerprofilebyid/{id}
methods: GET
```
### storeOwner Profile Update By Admin
```
ROLE_ADMIN
/storeownerprofileupdatebyadmin/{id}
methods: PUT
```
### Update StoreOwner Profile
```
ROLE_OWNER
/storeowner
methods: PUT
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
### Get Clients Profiles
```
ROLE_ADMIN
/clientsProfile
methods: GET
```
### Client Payment 
### Create Client Payment
```
ROLE_CAPTAIN
/clientpayment
methods: POST
```
### Announcement 
### Create Announcement
```
ROLE_ADMIN
/announcement
methods: POST
```
### Update Announcement
```
ROLE_ADMIN
/announcement
methods: PUT
```
### Get Announcement By Id
```
/announcement/{id}
methods: GET
```
### Get Announcements
```
/announcements
methods: GET
```

### Appointment 
### Create Appointment
```
/appointment
methods: POST
```
### Get Appointments
```
/appointments
methods: GET
```
### Update Appointment Is Done
```
/appointment
methods: PUT
```
### Captain Payment 
### Create Captain Payment
```
ROLE_ADMIN
/captainpayment
methods: POST
```
### Get Captain Payments
```
ROLE_CAPTAIN
/captainpayments
methods: POST
```

### Captain Profile 
### Create Captain Profile
```
ROLE_CAPTAIN
/captainprofile
methods: POST
```
### Captain Profile Update
```
/captainprofile
methods: PUT
```
### Captain Profile Update By Admin
```
ROLE_ADMIN
/captainprofileupdatebyadmin
methods: PUT
```
### Get Captain profile By CaptainID
```
ROLE_CAPTAIN
/captainprofile
methods: GET
```
### Get Captain profile By captain Profile ID
```
ROLE_ADMIN
/captainprofile/{captainProfileId}
methods: GET
```
### Get Captains Pending
```
ROLE_ADMIN
/getcaptainsinactive
methods: GET
```
### Dashboard Captains
```
ROLE_ADMIN
/dashboardcaptains
methods: GET
```
### Get Day Of Captains
```
ROLE_ADMIN
/getdayofcaptains
methods: GET
```
### Total Bounce Captain
```
ROLE_ADMIN
/captainFinancialaccount/{captainProfileId}
methods: GET
```
### Get Captains
```
ROLE_ADMIN
/captains
methods: GET
```
### Get Captain My Balance
```
ROLE_CAPTAIN
/captainFinancialaccount
methods: GET
```
### Get Captains With Unfinished Payments
```
ROLE_ADMIN
/captainsunfinishedpayments
methods: GET
```
### Captain Update New Message Status
```
ROLE_ADMIN
/captainupdatenewmessagestatus
methods: GET
```
### Get Top 5 Captains
```
ROLE_ADMIN
/gettop5captains
methods: GET
```
### Get Top Captains In This Month
```
ROLE_ADMIN
/topCaptains
methods: GET
```

### Captain Term 
### Create Terms Captain
```
ROLE_ADMIN
/createTermsCaptain
methods: POST
```
### Get Terms Captain
```
/termscaptain
methods: GET
```
### Get Terms Captain By Id
```
/termscaptainbyid/{id}
methods: GET
```
### Terms Update
```
ROLE_ADMIN
/termscaptain
methods: PUT
```

### Captain Vacation
### Create Vacation
```
ROLE_ADMIN
/captainvacation
methods: POST
```

### Company Package
### Create Package
```
ROLE_ADMIN
/companypackage
methods: POST
```
### Get Packages User Compatible
```
/companypackagesactive
methods: GET
```
### Get All Packages
```
/companypackages
methods: GET
```
### Get Package By Id
```
/companypackagebyid/{id}
methods: GET
```
### Update Package
```
ROLE_ADMIN
/companypackage
methods: PUT
```

### Delivery Company Profile
### Create Company Info
```
ROLE_ADMIN
/companyinfo
methods: POST
```
### Update Company Info
```
ROLE_ADMIN
/companyinfo
methods: PUT
```
### Get Company Info By Id
```
ROLE_ADMIN
/companyinfo/{id}
methods: GET
```
### Get Company Info All
```
/companyinfoall/{id}
methods: GET
```
### Get Company Info All For User
```
/companyinfoforuser
methods: GET
```





********************************************************


### Order
### Create Order By Client
```
ROLE_CLIENT
/clientorder
methods: POST
```
### Get Order Status By Order Number
```
/orderstatusbyordernumber/{orderNumber}
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