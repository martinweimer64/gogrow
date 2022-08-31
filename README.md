# README

## Setup
1. Clone the repo
2. run `bundle install` / `rake exec bundle install`
3. run `rails db:create` + `rails db:migrate` + `rails db:seed`

**notes:**
- `rails db:seed` it's optional
- shorter is to use `rails db:setup` instead of the 3 commands in the third step.


## How to upload a file request

**Request type:** POST

**URL:** http://localhost:3000/upload_sales

**body:**
`{
        "base_64_file":
}
`

**body examples:**
```
"UmVmZXJlbmNlLE9yZGVyIERhdGUsVmVuZG9yIElELFZlbmRvciBOYW1lLFByb2R1Y3QgSUQsUHJvZHVjdCBOYW1lLEJ1eWVyIEVtYWlsLEJ1eWVyIE5hbWUKQUJDMTIzNCwyMDIyLTA4LTAxLFhZWjEyMyxQaGlsaXBzICxMTTExMixUViAzMicnIDRrLG5pY2tAdGVzdC5jb20sTmljayBCYWlsZXkKQ0NDMTIzNCwyMDIyLTA4LTAxLFhZWjEyMyxGcnkgLExNMTEyLEFub3RoZXIgUHJvZHVjdCxzb21lb25lQHRlc3QuY29tLFNvbWUgT25lCg=="
```
```
"UmVmZXJlbmNlLE9yZGVyIERhdGUsVmVuZG9yIElELFZlbmRvciBOYW1lLFByb2R1Y3QgSUQsUHJvZHVjdCBOYW1lLEJ1eWVyIEVtYWlsLEJ1eWVyIE5hbWUKQUJDMTIzNCwyMDIyLTA4LTAxLFhZWjEyMyxQaGlsaXBzICxMTTExMixUViAzMicnIDRrLG5pY2tAdGVzdC5jb20sTmljayBCYWlsZXkKQ0NDMTIzNCwyMDIyLTA4LTAxLFhZWjEyMyxGcnkgLExNMTEyLEFub3RoZXIgUHJvZHVjdCxzb21lb25lQHRlc3QuY29tLFNvbWUgT25lClpaWjAwMCwsWFlaMTIzLEZyeSAsTE0xMTIsUHJvZHVjdCB3aXRob3V0IG9yZGVyIGRhdGUsc29tZW9uZUB0ZXN0LmNvbSxTb21lIE9uZQo="
```

## How to get the stored info

**This table shows all the available endpoints to get information (all are GET requests):**

| Name | Description | Params | URL |
| ------------- | ------------- |------------- | ------------- |
| Users index  | Get all users  |  | http://localhost:3000/users | 
| Users show  | Get user by id  | :id  | http://localhost:3000/users/1 | 
| Users show_sales  | Get all sales from an users  | :user_id | http://localhost:3000/users/1/show_sales | 
| Users show_buys  | Get all buys from an users  | :user_id | http://localhost:3000/users/1/show_buys | 
| Sales index  | Get all sales  |  | http://localhost:3000/sales | 
| Sales show  | Get sale by id  | :id  | http://localhost:3000/sales/1 | 
| Products index  | Get all products  |  | http://localhost:3000/products | 

## To improve next

- Better uniqueness validation for entities
- Group many products in the same sale (multi-products sales)
- Could add serializer to return better info
- Separate logic in multiple interactors by specific functionalities
