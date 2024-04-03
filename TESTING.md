# Full Testing

## Contents
- [Full Testing](#full-testing)
  - [Contents](#contents)
  - [Testing User Stories](#testing-user-stories)
  - [User Story 1](#user-story-1)
  - [Validator Testing](#validator-testing)
    - [HTML](#html)
    - [CSS](#css)
    - [JavaScript](#javascript)
    - [Python](#python)
    - [Django Extensions](#django-extensions)
  - [Lighthouse Testing](#lighthouse-testing)
  - [Automated Testing](#automated-testing)
  - [Manual Testing](#manual-testing)
  - [Responsiveness Testing](#responsiveness-testing)
    - [Browsers](#browsers)
    - [Devices](#devices)
  - [Bugs](#bugs)
    - [Fixed Bugs](#fixed-bugs)
    - [Known Bugs](#known-bugs)

## Testing User Stories

User Stories were created at the start of my project.

Link to Projects Board: [Project Board](https://github.com/users/chrisryan91/projects/5/views/1)

## User Story 1

<details>
<summary>User Story 1</summary>
<br>

![User Story 1]()
</details>

## Validator Testing

### HTML

<details>
<summary></summary>
<br>

![Sign Up Page]()
</details>

### CSS

<details>
<summary>CSS Validation</summary>
<br>

![CSS Validation]()
</details>

### JavaScript

<details>
<summary>JavaScript Validation</summary>
<br>

![JavaScript Validation]()
</details>

### Python

<details>
<summary>admin.py</summary>
<br>

![Admin.py]()
</details>

### Django Extensions

I installed [Django Extensions](https://github.com/django-extensions/django-extensions) to see if there were errors with the code in my templates. None were found.

<details>
<summary>Django Template Validation</summary>
<br>

![Django Template Validation]()
</details>

## Lighthouse Testing

Beneath is Lighthouse testing from Chrome Dev tools for each of the main pages on my app. The performance of the app is affected by the images returned from the API on the search page and images from Cloudinary.

<details>
<summary>Homepage Lighthouse</summary>
<br>

![Homepage Lighthouse](static/readme_images/lighthouse/homepage_ligthhouse.png)
</details>

## Automated Testing

<details>
<summary>Coverage Report</summary>
<br>

![Admin.py]()
</details>

## Manual Testing

|Main Nav| | | |
|:---:|:---:|:---:|:---:|
|Element|Action|Expected Result|Works|
|CheesyStore Icon|Click|Return Home|Yes|
|Products Link|Click|Menu Dropdown|Yes|
|Categories Link|Click|Menu Dropdown|Yes|
|More Link|Click|Menu Dropdown|Yes|
|Search Link|Click|Search Bar Drops|Yes|
|My Account Link|Click|Menu Dropdown|Yes|
|Bag Link|Click|Links to bag|Yes|
| | | | |
|Footer| | | |
|Privacy Policy Link|Click|Links Externally to Privacy Policy|Yes|
|Social Media Links|Click|Links Externally to Social Media Platform|Yes|
|Privacy Policy Link|Click|Links Internally to Contact Page|Yes|
| | | | |
|Products Dropdown| | | |
|All Products Link|Click|Links to all products|Yes|
|Cheeses Link|Click|Links to cheeses|Yes|
|Butters Link|Click|Links to butters|Yes|
|Crackers Link|Click|Links to crackers|Yes|
| | | | |
|Categories Dropdown| | | |
|Types Links|Click|Links to specific type|Yes|
|Origins Links|Click|Links to crackers|Yes|
| | | | |
|More Dropdown| | | |
|FAQ Link|Click|Links to FAQ page|Yes|
|Contact Link|Click|Links to contact page|Yes|
|Blog Link|Click|Links to blog|Yes|
| | | | |
|My Account Dropdown| | | |
|Product Management Link|Click|Links to Product Managment page|Yes|
|My Profile Link|Click|Links to My Profile page|Yes|
|Logout Link|Click|Links to Sign Out page|Yes|
|Register Link|Click|Links to Register Page|Yes|
|Login Link|Click|Links to Login Page|Yes|
| | | | |
|Sign Out | | | |
|Sign Out link|Click|Sign Out and return Home|Yes|
| | | | |
|Register Page/Sign Up Page| | | |
|Sign Up Link|Click (if data is invalid)|Returns form|Yes|
|Sign Up Link|CLick (if data is valid)|Sends Email|Yes|
|Sign Up Link|CLick (if data is valid)|Returns where??|No|
| | | | |
|Sign In Page| | | |
|Sign In Link|Click (if data is invalid)|Returns form with invalid information|Yes|
|Sign In Link|Click (if data is valid)|Logins in|Yes|
|Sign In Link|Click (if data is valid)|Returns homepage|Yes|
|Forgot Password Link|Click|Returns retrieve password page|Yes|
| | | | |
|Products Page| | | |
|Sort Dropdown|Click|Dropdown Appears|Yes|
|Sort Dropdown Options|Click|Sorts Product Correctly|Yes|
|Product Image|Click|Links to Product Page|Yes|
|Edit Product Link|Click|Links to Edit Product Page|Yes|
|Delete Product Link|Click|Links to Delete Product Page|Yes|
|Next Page Link|Click|Links to next paginated page|Yes|
|Last Page Link|Click|Links to final paginated page|Yes|
| | | | |
|Product Page| | | |
|Decrease Button (when quantity is one)|Click|Nothing|Yes|
|Decrease Button (when quantity is two or above)|Click|Value Decreases|Yes|
|Increase Button (when quantity is one or above)|Click|Value Increases|Yes|
|Keep Shopping Link|Click|Returns to Products Page|Yes|
|Add to Bag Link|Click|Adds Product to Bag|Yes|
|Add to Bag Link|Click|Success Toast Appears|Yes|
|Edit Product Link|Click|Links to Edit Product Page|Yes|
|Delete Product Link|Click|Deletes Product|Yes|
|Cheeses, Origins, CheeseTypes Tag Links|Click|Returns to Search Page with Correct Tag|Yes|
|Voting Stars|Click|Star Color Changes|Yes|
|Voting Stars|Click|Rating Correctly Changes |Yes|
| | | | |
|Product Management - Add Product| | | |
|Category, CheeseType, Origin, In Stock Dropdown|Click|Dropdown Menu Appears with Correct Values|Yes|
|Select Image Button|Click|Box Appears to with File Explorer|Yes|
|Add Product Button (with invalid data)|Click|Form is returned with Invalid Data tag|Yes|
|Add Product Button (with valid data)|Click|New Product Page Returned|Yes|
| | | | |
|Product Management - Edit Product| | | |
|Category, CheeseType, Origin, In Stock Dropdown|Click|Dropdown Menu Appears with Correct Values|Yes|
|Select Image Button|Click|Box Appears to with File Explorer|Yes|
|Remove Option|Ticked|Image Removed|Yes|
|Edit Product Button (with invalid data)|Click|Form is returned with Invalid Data tag|Yes|
|Edit Product Button (with valid data)|Click|Product Page Returned Updated|Yes|
|Cancel Button|Clicked|Products Page Returned|Yes|
|Delete Product Link|Click|Deletes Product|Yes|
| | | | |
|Bag| | | |
|Minus Button (if value is 1)|Click|Nothing|No|
|Minus Button (if value is 1 or more)|Click|Increases Value|Yes|
|Plus Button|Click|Increases Value |Yes|
|Update Button|Click|Succesfully Updates|Yes|
|Remove Button|Click|Succesfully Updates|Yes|
|Keep Shopping Button|Click|Links to Product Page |Yes|
|Secure Checkout Button|Click|Links to Checkout|Yes|
| | | | |
|Checkout| | | |
|Adjust Bag Button|Click|Links us to Bag|Yes|
|Card Number Field|Enter Invalid Data|Message Appears with Error |Yes|
|Complete Order (with invalid data)|Click|Returns form with error tags|Yes|
|Complete Order (with valid data)|Click|Loading Wheel Appears|Yes|
|Complete Order (with valid data)|Click|Links to Checkout Success page|Yes|
| | | | |
|Checkout Success Page| | | |
|See Products Link|Click|Links to Products Page|Yes|
| | | | |
|Frequently Asked Questions Page| | | |
|Blog Link|Click|Links to Blog|Yes|
|Contact Link|Click|Links to Contact Page|Yes|
|Profile|Click|Links to User Profile|Yes|
|Privacy Policy|Click|Links Externally to Privacy Policy|Yes|
| | | | |
|Contact Page| | | |
|Submit Button (with invalid data)|Click|Returns form with error tags|Yes|
|Submit Button (with valid data)|Click|Success Message Appears|Yes|
|Subscribe Button (with invalid email)|Click|Error message Appears|Yes|
|Subscribe Button (with valid email)|Click|Success Messages Appears|Yes|
| | | | |
|Blog Page| | | |
|Add Post Link|Click|Links to Add Blog Post Page|Yes|
|Blog Title Link|Click|Links to Blog Post Page|Yes|
|Next Button|Click|Links to Next Paginated Page on List|Yes|
| | | | |
|Blog Post Page| | | |
|Submit Comment Button (with text)|Click|Success Message Appears, Comment Awaits Approval|Yes|
|Submit Comment Button (with no text)|Click|Form returns blank with Error Tag|Yes|
|Back to Blog Button|Click|Links to Back to Main Blog|Yes|
| | | | |
|Add Blog Post Page| | | |
|Choose FIle Button|Click|File Explorer Appears|Yes|
|Status Dropdown|Click|Dropdown appears with correct values|Yes|
|Add Post Button|Click|Form Submits |Yes|
|Add Post Button (with invalid data) |Click|Form returns with Error Tag|Yes|
| | | | |
|My Profile Page| | | |
|Order Number Button|Click|Links to Checkout Sucess page with Order Details|Yes|
|Countries Dropdown|Click|Dropdown Appears|Yes|
|Update Information Button|Click|Success box appears, form submits| |

## Responsiveness Testing

### Browsers 
- Chrome
- Opera
- Bing
- Safari

### Devices
- Lenovo Laptop
- Mac Desktop
- Samsung Phone
- iPhone
- Huawei i7

<details>
<summary>iPad</summary>
<br>

![iPad]()
</details>

<details>
<summary>iPhone 12 Pro</summary>
<br>

![iPhone 12 Pro]()
</details>

<details>
<summary>MacBook Pro</summary>
<br>

![iPhone 12 Pro]()
</details>

## Bugs

### Fixed Bugs

- **xxx**

- **xxx**

### Known Bugs

- **xxx**