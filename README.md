# Makers B & B

## User Stories

### Signing Up
```
As a user,
In order to use the service,
I need to be able to sign up.
```
#### Solution
Objects	            | Messages
---                 | ---
User                | Create a new User class with required properties
Signing Up          | Form: name, email, password, password_confirmation
Password Protection | Set up BCrypt
Database            | makers_bnb_development && makers_bnb_test


### Signing In
```
As a signed up user,
In order to be able to find listings,
I need to be able to sign in.
```
#### Solution
Objects	              | Messages
---                   | ---
Signing In            | Form: email, password
Password Verification | Use BCrypt to authenticate user password from the database


### Signing Out
```
As a signed in user,
So I can have more security,
I would like to be able to sign out.
```
#### Solution


### List a Space
```
As a signed in user,
I would like to be able to list my space,
So other users could view it on the home page.
```
#### Solution


### View Listings
```
As a signed in user,
So I can make my decisions,
I would like to see all the listings as the home screen.
```
#### Solution


### Request a Listing
```
As a signed in user,
So I can book a space,
I would like to be able to make requests on listings.
```
#### Solution


### Respond to Requests
```
As a signed in user,
When I have had a request,
I would like to be able to respond (accept or decline).
```
#### Solution
