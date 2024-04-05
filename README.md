# CheesyStore

Welcome to CheesyStore, an online cheesemonger based in Ireland. Our website offers a handpicked selection of the finest cheeses from Ireland and around the world. CheesyStore goes beyond just selling cheese. Alongside the shop there is a blog featuring pairing guides, the stories behind our products, and the latest news from the dairy world. These insights, along with special offers, are shared across various social media platforms to keep our community engaged and informed.

Live Website here: [Cheesy Store](http://cheesystore-191ae9e3f358.herokuapp.com/)

Link to Main Project Board: [Project Board](https://github.com/users/chrisryan91/projects/10)

![Cheesy Store]()

## Table of Contents
- [CheesyStore](#cheesystore)
  - [Table of Contents](#table-of-contents)
  - [Concept](#concept)
  - [Development](#development)
    - [User Stories](#user-stories)
    - [Wireframes](#wireframes)
    - [Design](#design)
    - [GitHub Projects](#github-projects)
    - [Database and Data Models](#database-and-data-models)
      - [cheesystoreshop](#cheesystoreshop)
      - [cheesyblog](#cheesyblog)
      - [checkout](#checkout)
      - [profiles](#profiles)
  - [Features](#features)
    - [CRUD Functionality](#crud-functionality)
      - [Create](#create)
      - [Read](#read)
      - [Update](#update)
      - [Delete](#delete)
    - [Authentication and Authorisation](#authentication-and-authorisation)
    - [Navigation](#navigation)
    - [Homepage](#homepage)
    - [CheesyStoreShop](#cheesystoreshop-1)
    - [Product Detail](#product-detail)
    - [Cheesy Blog](#cheesy-blog)
    - [Cheesy Blog Posts](#cheesy-blog-posts)
    - [Bag](#bag)
    - [Checkout](#checkout-1)
    - [Frequently Asked Questions](#frequently-asked-questions)
    - [Contact Us](#contact-us)
    - [Success Page](#success-page)
    - [Product Management](#product-management)
    - [My Profile](#my-profile)
    - [Sign In](#sign-in)
    - [Footer](#footer)
    - [Features Left to Implement](#features-left-to-implement)
  - [Business Model](#business-model)
  - [Search Engine Optimization](#search-engine-optimization)
  - [Social Media Marketing](#social-media-marketing)
  - [Technologies Used](#technologies-used)
    - [Core Development Technologies](#core-development-technologies)
    - [Libraries, Frameworks and Packages](#libraries-frameworks-and-packages)
    - [Python/Django packages](#pythondjango-packages)
    - [Infrastructural Technologies](#infrastructural-technologies)
  - [Testing](#testing)
  - [Deployment - Heroku](#deployment---heroku)
    - [Create the Heroku App:](#create-the-heroku-app)
    - [Attach the Postgres database:](#attach-the-postgres-database)
    - [Update Heroku Config Vars](#update-heroku-config-vars)
    - [Deploy](#deploy)
  - [AWS Set Up](#aws-set-up)
    - [AWS S3 Bucket](#aws-s3-bucket)
    - [IAM](#iam)
    - [Connecting S3 to Django](#connecting-s3-to-django)
  - [Forking this repository](#forking-this-repository)
  - [Cloning this repository](#cloning-this-repository)
  - [Credits](#credits)

## Concept

This web application is a submission for Portfolio Project 5 with a focus on ecommerce. Given the criteria of the project, I needed a concept that would process payments with Stripe and that could be marketed on Social Media platforms. I decided on an online cheesemonger because there are lots of varieties to categorise it by and it has a universal appeal which means it is easily marketable.

I also wanted a concept that I could expand further. Given the deadline and the requirement for a Minimum Viable Product (MVP), I held back on integrating features that were not completely necessary. In future CheesyStore could expand to include recipes, pairing guides and an integrated chatbot with the ChatGPT API.

## Development

### User Stories

1. As a site administrator, I can manage user accounts, including activating, deactivating, and deleting accounts, so that I can maintain the site's user base and security.
2. As a site user, I can subscribe to the newsletter to receive updates on new cheese arrivals, promotions, and blog posts so that I can stay informed.
3. As a site user, I can read blog posts about cheese tasting, pairing tips, and cheese-making processes so that I can expand my knowledge and appreciation of cheese.
4. As a site user, I can leave comments and reviews on cheeses and blog posts so that I can share my opinions and experiences with other users.
5. As a site administrator, I can create and publish blog posts about cheese-related topics so that I can engage users and attract traffic to the site.
6. As a site administrator, I can add, edit, and delete cheeses from the store inventory so that I can manage the product catalog.
7. As a site user, I can create an account and log in so that I can track my order history and manage my profile information.
8. As a site user, I can view detailed information about each cheese, including its origin, flavor profile, and suggested pairings, so that I can make an informed decision.
9. As a site user, I can search for specific types of cheeses (e.g., soft, hard, aged) so that I can find cheeses that match my preferences.
10. As a site user, I can add cheeses to my cart and proceed to checkout so that I can purchase them.
11. As a site user, I can browse a variety of cheeses so that I can explore different options.
12. As a user, I want to be able to set up an account and login in and log out so I can purchase items and leave a comment.
13. As a user, I want to easily find answers to frequently asked questions so that I can make informed decisions about the products and policies without needing to wait for a response from customer service.
14. As a user, I want to subscribe to a monthly cheese subscription service so that I can discover new cheeses and have a consistent supply of high-quality cheese without having to reorder manually each time.
15. As a user, I want to participate in a loyalty program that rewards me for my purchases so that I can enjoy discounts, get early access to new products, and access exclusive content.
16. As a potential customer, I want to interact with a chatbot on the cheese-selling website so that I can receive personalized recommendations, get answers to my questions about the products, and have assistance throughout the checkout process, making my shopping experience smoother and more enjoyable.

User Stories are tested in: [Testing.md](Testing.md)

Link to User Stories + Tasks: [User Stories Board](https://github.com/users/chrisryan91/projects/11/views/1)

### Wireframes

Wireframes were developed at the outset of my project. The general framework for how the website should be structured has remained the same. These served as a basis for my design from the beginning and prevented me from deviating too far in another direction. I created them partly because I understood that could could easily be made responsive to smaller screen sizes with bootstrap.

<details>
<summary>Home Page Initial Desktop Wireframe</summary>
<br>

![Home Page Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/1-Homepage.png)

</details>

<details>
<summary>Home Page Initial Mobile Wireframe</summary>
<br>

![Home Page Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframehome.png)

</details>

<details>
<summary>Product Page Initial Desktop Wireframe</summary>
<br>

![Product Page Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/8-Browse-Selection.png)

</details>

<details>
<summary>HProduct Page Initial Mobile Wireframe</summary>
<br>

![Product Selection Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframeproducts.png)

</details>

<details>
<summary>Product Page Initial Desktop Wireframe</summary>
<br>

![Product Page Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/8-Browse-Selection.png)

</details>

<details>
<summary>Product Page Initial Mobile Wireframe</summary>
<br>

![Product Page Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframeproducts.png)

</details>

<details>
<summary>Product Page Initial Desktop Wireframe</summary>
<br>

![Product Page Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/3-Cheese-Detail.png)

</details>

<details>
<summary>Product Page Initial Mobile Wireframe</summary>
<br>

![Product Page Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframedetail.png)

</details>

<details>
<summary>Bag Initial Desktop Wireframe</summary>
<br>

![Bag Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/4-Bag.png)

</details>

<details>
<summary>Bag Initial Mobile Wireframe</summary>
<br>

![Bag Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframebag.png)

</details>

<details>
<summary>Checkout Initial Desktop Wireframe</summary>
<br>

![Checkout Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/5-Checkout.png)

</details>

<details>
<summary>Checkout Initial Mobile Wireframe</summary>
<br>

![Checkout Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframecheckout.png)

</details>

<details>
<summary>Blog Initial Desktop Wireframe</summary>
<br>

![Blog Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/7-Cheese-Store-Blog.png)

</details>

<details>
<summary>Blog Initial Mobile Wireframe</summary>
<br>

![Blog Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframeblog.png)

</details>

<details>
<summary>Blog Post Initial Mobile Wireframe</summary>
<br>

![Blog Post Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframeblogdetail.png)

</details>

<details>
<summary>Contact Page Initial Desktop Wireframe</summary>
<br>

![Contact Page Initial Desktop Wireframe](media/readme_images/wireframes/desktopwireframes/2-Contact-Us.png)

</details>

<details>
<summary>Contact Page Initial Mobile Wireframe</summary>
<br>

![Contact Page Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/wifeframemobilecontact.png)

</details>

<details>
<summary>About Page Desktop Wireframe</summary>
<br>

![Contact Page Initial Mobile Wireframe](media/readme_images/wireframes/desktopwireframes/6-About.png)

</details>

<details>
<summary>About Page Desktop Wireframe</summary>
<br>

![Contact Page Initial Mobile Wireframe](media/readme_images/wireframes/desktopwireframes/6-About.png)

</details>

<details>
<summary>FAQ Page Mobile Wireframe</summary>
<br>

![Contact Page Initial Mobile Wireframe](media/readme_images/wireframes/mobilewireframes/mobilewireframefaq.png)

</details>

### Design

xxx

### GitHub Projects

In the repository for CheesyStore I opened some issues for this project. I began by creating sixteen User Story issues. I followed this by creating corresponding Tasks for each User Story. I created three different project and imported the User Stories into each project. 

- The main project board contains three columns: to do, in progress and completed. As development progressed I moved User Stories from one column to the next. This helped me keep track of what stage I was in during the project.

- I created a second project board and imported both the User Stories and Tasks to help me visualise what needed to be done for each User Story. Each User Story and corresponding Task is placed in a column.

- I created a third project board to help prioritise User Stories during development with MoSCoW Prioritisation with columns for Must-Have, Should-Have, Could-Have and Wont-Have.

Link to Main Project Board: [Project Board](https://github.com/users/chrisryan91/projects/10)

Link to User Stories + Tasks: [User Stories Board](https://github.com/users/chrisryan91/projects/11/views/1)

Link to MoSCoW Prioritisation Board: [MoSCoW Board](https://github.com/users/chrisryan91/projects/12)

User Stories are tested in: [TESTING.md](TESTING.md)

<details>
<summary>xxx</summary>
<br>

![]()

</details>

### Database and Data Models

CheesyStore has four app folders with models. The **User** model is handled by Django AllAuth.

#### cheesystoreshop

This app contains five models. These models are for the products, the categories for the products and the rating of the products.

The **Product** model contains the information to store details of the product for sale. The origin, category, cheesetype and rating fields are linked with foreign keys to the others models in this folder:

- category
- cheesetype
- origin
- sku
- name
- description
- price
- rating
- in_stock
- image_url
- image

The main **Category** model is for the main category to place the product into:

- name
- friendly_name

The subcategory **Origin** model is for where the cheese comes from:

-  name
-  friendly_name

The second subcategory **CheeseType** is for the type of cheese it is:

- name
- friendly_name

The **Rating** model holds the User rating for the specific product.

- product
- user
- stars

#### cheesyblog 

This app contains two models. These models are the blog posts and the comments on the web applications blog.

The **Post** model is for the blog posts themselves to be written by a superuser or through django-admin:

- title
- slug
- author
- updated_on
- content
- featured_image
- excerpt
- created_on
- status
- keywords

The **Comment** model is the comments on the blog posts. It is linked to the Post model and User model through foreign keys:

- post
- user
- body
- created_on
- approved

#### checkout

This app contains two models. These models are for the Order and Order Line Items - or the products themselves in the order:

The **Order** model contains the information for each specific order including user, address, contact details and order number:

- order_number
- user_profile
- full_name
- email
- phone_number
- country
- postcode
- town_or_city
- street_address1
- street-address2
- county
- date
- delivery_cost
- order_total
- grand_total
- original_bag
- stripe_pid

The **OrderLineItem** model contains the products and the quantity of each in each order:

- order
- product
- quantity
- lineitem_total

#### profiles

This app contains the information for each User profile. The User model itself is handled by Django AllAuth but it is extended here to aid the creation of profiles for each user:

The **UserProfile** model contains information to display for each registered user:

- user
- default_phone_number
- default_street_address1
- default_street_address2
- default_town_or_city
- default_county
- default_postcode
- default_country

<details>
<summary>Data Model Diagram</summary>
<br>

![Data Model Diagram](media/readme_images/datadiagram.png)
</details>

## Features

### CRUD Functionality

#### Create

- Superusers can create products for the store through the Product Management link on the Navbar. This allows administrators to add new products into the shop. The product management link only appears to admins.

- Registered users can add comments to each of the blog posts. New blog posts are created by administrators through the Django admin panel

#### Read

- Any user of the website irrespective of registration status can see the new products, blog posts or comments posted once they have been published by the admin.

#### Update

- Once an administrator is logged in, a small edit button appears beneath the Product displayed on the Products page and Products Detail page. Once clicked, it brings up a new page with the ability to edit the products.

#### Delete

- Once an administrator is logged in, a small delete button appears beneath the Product displayed on the Products page and Products detail page. Once clicked, it brings up an Alert confirming the intent to delete the product.

- Similarly, a small delete button appears for signed in users below the comments they may have written. If clicked, it will bring up an Alert confirming the intent to delete the product.

### Authentication and Authorisation

**Django All Auth** is used for backend authentication:

- Users can create an account in the sign-up page.
- Users can sign-in to their account to leave comments, posts and likes using the sign-in page.
- Users can login back into their account using the login page.
- Only authorised users can visit the submit review page and update review page.

### Navigation

<details>
<summary>Desktop Navbar</summary>
<br>

![Desktop Navbar](media/readme_images/designscreenshots/desktopheader.png)
</details>

<details>
<summary>Mobile Navbar</summary>
<br>

![Mobile Navbar](media/readme_images/designscreenshots/mobileheader.png)
</details>

<details>
<summary>Mobile Navbar Dropdown</summary>
<br>

![Mobile Navbar Dropdown](media/readme_images/designscreenshots/headermobiledropdown.png)
</details>

### Homepage

<details>
<summary>Desktop Homepage</summary>
<br>

![Desktop Homepage](media/readme_images/designscreenshots/desktophomepage.png)
</details>

<details>
<summary>Mobile Homepage</summary>
<br>

![Mobile Homepage](media/readme_images/designscreenshots/homepagemobile.png)
</details>

### CheesyStoreShop

<details>
<summary>Cheesy Store Shop Desktop</summary>
<br>

![Cheesy Store Shop Desktop](media/readme_images/designscreenshots/productsdesktop.png)
</details>

<details>
<summary>Cheesy Store Shop Mobile</summary>
<br>

![Cheesy Store Shop Mobile](media/readme_images/designscreenshots/productsmobile.png)
</details>

### Product Detail

<details>
<summary>Product Detail Desktop</summary>
<br>

![Product Detail Desktop](media/readme_images/designscreenshots/productdetailscreenshot.png)
</details>

<details>
<summary>Product Detail Mobile</summary>
<br>

![Product Detail Mobile](media/readme_images/designscreenshots/productdetailmobile.png)
</details>

### Cheesy Blog

<details>
<summary>Cheesy Blog Desktop</summary>
<br>

![Cheesy Blog Desktop](media/readme_images/designscreenshots/blogdesktop.png)
</details>

<details>
<summary>Cheesy Blog Mobile</summary>
<br>

![Cheesy Blog Mobile](media/readme_images/designscreenshots/blogmobile.png)
</details>

### Cheesy Blog Posts

<details>
<summary>Blog Post Desktop</summary>
<br>

![Blog Post Desktop](media/readme_images/designscreenshots/blogpostdesktop.png)
</details>

<details>
<summary>Blog Post Mobile</summary>
<br>

![Blog Post Mobile](media/readme_images/designscreenshots/blogpostmobile.png)
</details>

### Bag

<details>
<summary>Bag Desktop</summary>
<br>

![Bag Desktop](media/readme_images/designscreenshots/bagdesktop.png)
</details>

<details>
<summary>Bag Mobile</summary>
<br>

![Bag Mobile](media/readme_images/designscreenshots/bagmobile.png)
</details>

### Checkout

<details>
<summary>Contact Desktop</summary>
<br>

![Contact Desktop](media/readme_images/designscreenshots/checkoutdesktop.png)
</details>

<details>
<summary>Contact Mobile</summary>
<br>

![Contact Mobile](media/readme_images/designscreenshots/checkoutmobile.png)
</details>

### Frequently Asked Questions

<details>
<summary>FAQ Desktop</summary>
<br>

![FAQ Desktop](media/readme_images/designscreenshots/faqdesktop.png)
</details>

<details>
<summary>FAQ Mobile</summary>
<br>

![FAQ Mobile](media/readme_images/designscreenshots/bagdesktop.png)
</details>

### Contact Us

<details>
<summary>Contact Us Desktop</summary>
<br>

![Contact Us Desktop](media/readme_images/designscreenshots/contactdesktop.png)
</details>

<details>
<summary>Contact Us Mobile</summary>
<br>

![Contact Us Mobile](media/readme_images/designscreenshots/contactmobile.png)
</details>

### Success Page

<details>
<summary>Success Desktop</summary>
<br>

![Success Desktop](media/readme_images/designscreenshots/successdesktop.png)
</details>

<details>
<summary>Success Mobile</summary>
<br>

![Success Mobile](media/readme_images/designscreenshots/successmobile.png)
</details>

<details>
<summary>Success Toast</summary>
<br>

![Success Toast](media/readme_images/designscreenshots/successtoast.png)
</details>

### Product Management 

<details>
<summary>Product Management Page</summary>
<br>

![Product Management Desktop](media/readme_images/designscreenshots/productmanagementdesktop.png)
</details>

### My Profile

<details>
<summary>Profile Page</summary>
<br>

![Profile Desktop](media/readme_images/designscreenshots/myprofiledesktop.png)
</details>

### Sign In

<details>
<summary>Sign In Page</summary>
<br>

![Footer](media/readme_images/designscreenshots/signinscreenshot.png)
</details>

### Footer

<details>
<summary>Footer</summary>
<br>

![Footer](media/readme_images/designscreenshots/footer.png)
</details>

### Features Left to Implement

1. I want to use ChatGPT API to create a chatbot for users of my store to use to help make purchases and navigate the store. I initially made a User Story that remains unfinished: *As a potential customer, I want to interact with a chatbot on the cheese-selling website so that I can receive personalized recommendations, get answers to my questions about the products, and have assistance throughout the checkout process, making my shopping experience smoother and more enjoyable.*

## Business Model

Cheesy Store's Business Model is Business to Consumer (B2C). Products are sold directly from Fresh Nest to consumers who are the end-users. 

A customer of Cheesy Store would be someone who is most likely an adult who is interested in cheese or cheese culture. The blog can potentially attract potential customers who may be interested in it's content. From there products can be marketed and the customer can be redirected to the store.

## Search Engine Optimization

## Social Media Marketing

For this site, a Facebook business page has been created for organic social media marketing. The Facebook page includes a 'Contact Us' button which takes the user to the Contact Page on Cheesy Store.

<details>
<summary>Cheesy Store Facebook Page</summary>
<br>

![Cheesy Store Facebook Page](media/readme_images/screencapture-facebook-profile-php-2024-04-04-20_40_44.png)

</details>

## Technologies Used

### Core Development Technologies

- [Django](https://www.djangoproject.com/) was used a full-stack framework.
- [JavaScript](https://ecma-international.org/publications-and-standards/standards/ecma-262/)
- [jQuery](https://jquery.com/)
- [CSS](https://www.w3.org/Style/CSS/Overview.en.html)
- [HTML](https://html.spec.whatwg.org/multipage/)
- [Django Templating Language](https://docs.djangoproject.com/en/4.2/ref/templates/language/) for building pages

### Libraries, Frameworks and Packages

- [Bootstrap](https://getbootstrap.com/)

### Python/Django packages

- [Gunicorn](https://pypi.org/project/gunicorn/)
- [psycopg2](https://pypi.org/project/psycopg2/)
- [crispy_forms](https://django-crispy-forms.readthedocs.io/en/latest/)
- [django_summernote](https://pypi.org/project/django-summernote/)
  
### Infrastructural Technologies

- [PostgreSQL](https://www.postgresql.org/)
- [Heroku](https://www.heroku.com/home)
- [Cloudinary](https://cloudinary.com/)

## Testing

Full testing: [Testing.md](TESTING.md)

## Deployment - Heroku

To deploy this page to Heroku from its GitHub repository, the following steps were taken:

### Create the Heroku App:
- Log in to [Heroku](https://dashboard.heroku.com/apps) or create an account.
- On the main page click the button labelled New in the top right corner and from the drop-down menu select "Create New App".
- Enter a unique and meaningful app name.
- Next, select your region.
- Click on the Create App button.

### Attach the Postgres database:
- In the Resources tab, under add-ons, type in Postgres and select the Heroku Postgres option.
- Copy the DATABASE_URL located in Config Vars in the Settings Tab.
- Go back to your IDE and install 2 more requirements:
    - `pip3 install dj_databse_url`
    - `pip3 install psycopg2-binary` 
- Create requirements.txt file by typing `pip3 freeze --local > requirements.txt`
- Add the DATABASE_URL value and your chosen SECRET_KEY value to the env.py file. 
- In settings.py file import dj_database_url, comment out the default configurations within database settings and add the following: 

```
DATABASES = {
    'default': dj_database_url.parse(os.environ.get('DATABASE_URL'))
}
```
- Run migrations and create a superuser for the new database. 
- Create an if statement in settings.py to run the postgres database when using the app on heroku or sqlite if not

```
    if 'DATABASE_URL' in os.environ:
        DATABASES = {
            'default': dj_database_url.parse(os.environ.get('DATABASE_URL'))
        }
    else:
        DATABASES = {
            'default': {
                'ENGINE': 'django.db.backends.sqlite3',
                'NAME': BASE_DIR / 'db.sqlite3',
            }
    }
```

- Create requirements.txt file by typing `pip3 freeze --local > requirements.txt`
- Create a file named "Procfile" in the main directory and add the following: `web: gunicorn project-name.wsgi:application`
- Add Heroku to the ALLOWED_HOSTS list in settings.py in the format ['app_name.heroku.com', 'localhost']

- Push these changes to Github.

### Update Heroku Config Vars
Add the following Config Vars in Heroku:

|     Variable name     |                           Value/where to find value                           |
|:---------------------:|:-----------------------------------------------------------------------------:|
| AWS_ACCESS_KEY_ID     | AWS CSV file(instructions below)                                               |
| AWS_SECRET_ACCESS_KEY | AWS CSV file(instructions below)                                               |
| DATABASE_URL          | Postgres generated (as per step above)                                        |
| EMAIL_HOST_PASS       | Password from email client                                                    |
| EMAIL_HOST_USER       | Site's email address                                                          |
| SECRET_KEY            | Random key generated as above                                                 |
| STRIPE_PUBLIC_KEY     | Stripe Dashboard > Developers tab > API Keys > Publishable key                |
| STRIPE_SECRET_KEY     | Stripe Dashboard > Developers tab > API Keys > Secret key                     |
| STRIPE_WH_SECRET      | Stripe Dashboard > Developers tab > Webhooks > site endpoint > Signing secret |
| USE_AWS               | True (when AWS set up - instructions below)                                   |

### Deploy
- NB: Ensure in Django settings, DEBUG is False
- Go to the deploy tab on Heroku and connect to GitHub, then to the required repository. 
- Scroll to the bottom of the deploy page and either click Enable Automatic Deploys for automatic deploys or Deploy Branch to deploy manually. Manually deployed branches will need re-deploying each time the repo is updated.
- Click View to view the deployed site.

The site is now live and operational.


## AWS Set Up
### AWS S3 Bucket
- Create an AWS account.
- From the 'Services' tab on the AWS Management Console, search 'S3' and select it.
- Click 'Create a new bucket', give it a name(match your Heroku app name if possible), and choose the region closest to you.
- Under 'Object Ownership' select 'ACLs enabled' and leave the Object Ownership as Bucket owner preferred.
- Uncheck block all public access and acknowledge that the bucket will be public.
- Click 'Create bucket'.
- Open the created bucket, go to the 'Properties' tab. Scroll to the bottom and under 'Static website hosting' click 'edit' and change the Static website hosting option to 'enabled'. Copy the default values for the index and error documents and click 'save changes'.
- Open the 'Permissions' tab, locate the CORS configuration section and add the following code:
```
[
  {
      "AllowedHeaders": [
          "Authorization"
      ],
      "AllowedMethods": [
          "GET"
      ],
      "AllowedOrigins": [
          "*"
      ],
      "ExposeHeaders": []
  }
]
```
- In the 'Bucket Policy' section and select 'Policy Generator'.
- Choose 'S3 Bucket Policy' from the type dropdown.
- In 'Step 2: Add Statements', add the following settings:
    - Effect: Allow
    - Principal: *
    - Actions: GetObject
    - ARN: Bucket ARN (copy from S3 Bucket page)
- Click 'Add Statement'.
- Click 'Generate Policy'.
- Copy the policy from the popup that appears
- Paste the generated policy into the Permissions > Bucket Policy area.
- Add '/*' at the end of the 'Resource' key, and save.
- Go to the 'Access Control List' section click edit and enable List for Everyone (public access) and accept the warning box.


### IAM
- From the 'Services' menu, search IAM and select it.
- Once on the IAM page, click 'User Groups' from the side bar, then click 'Create group'. Choose a name and click 'Create'.
- Go to 'Policies', click 'Create New Policy'. Go to the 'JSON' tab and click 'Import Managed Policy'. 
- Search 'S3' and select 'AmazonS3FullAccess'. Click 'Import'.
- Get the bucket ARN from 'S3 Permissions' as per above.
- Delete the '*' from the 'Resource' key and add the following code into the area:

```
"Resource": [
    "YOUR-ARN-NO-HERE",
    "YOUR-ARN-NO-HERE/*"
]
```

- Click 'Next Tags' > 'Next Review' and then provide a name and description and click 'Create Policy'.
- Click'User Groups' and open the created group. Go to the 'Permissions' tab and click 'Add Permissions' and then 'Attach Policies'.
- Search for the policy you created and click 'Add Permissions'.
- You need to create a user to put in the group. Select users from the sidebar and click 'Add user'.
- Give your user a user name, check 'Programmatic Access'.
- Click 'Next' and select the group you created.
- Keep clicking 'Next' until you reach the 'Create user' button and click that.
- Download the CSV file which contains the AWS_SECRET_ACCESS_KEY and your AWS_ACCESS_KEY_ID needed in the Heroku variables as per above list and also in your env.py.


### Connecting S3 to Django 
- Go back to your IDE and install 2 more requirements:
    - `pip3 install boto3`
    - `pip3 install django-storages` 
- Update your requirements.txt file by typing `pip3 freeze --local > requirements.txt` and add storages to your installed apps.
- Create an if statement in settings.py 

```
if 'USE_AWS' in os.environ:
    AWS_STORAGE_BUCKET_NAME = 'insert-your-bucket-name-here'
    AWS_S3_REGION_NAME = 'insert-your-region-here'
    AWS_ACCESS_KEY_ID = os.environ.get('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')

```
- Then add the line 

    - `AWS_S3_CUSTOM_DOMAIN = f'{AWS_STORAGE_BUCKET_NAME}.s3.amazonaws.com'` to tell django where our static files will be coming from in production.


- Create a file called custom storages and import both our settings from django.con as well as the s3boto3 storage class from django storages. 
- Create the following classes:

```
class StaticStorage(S3Boto3Storage):
    location = settings.STATICFILES_LOCATION

class MediaStorage(S3Boto3Storage):
    location = settings.MEDIAFILES_LOCATION
```

- In settings.py add the following inside the if statement:

```
STATICFILES_STORAGE = 'custom_storages.StaticStorage'
STATICFILES_LOCATION = 'static'
DEFAULT_FILE_STORAGE = 'custom_storages.MediaStorage'
MEDIAFILES_LOCATION = 'media'
STATIC_URL = f'https://{AWS_S3_CUSTOM_DOMAIN}/{STATICFILES_LOCATION}/'
MEDIA_URL = f'https://{AWS_S3_CUSTOM_DOMAIN}/{MEDIAFILES_LOCATION}/'

```

- and then add the following at the top of the if statement:
```
AWS_S3_OBJECT_PARAMETERS = {
    'Expires': 'Thu, 31 Dec 2099 20:00:00 GMT',
    'CacheControl': 'max-age=94608000',
}
```

- Go to S3, go to your bucket and click 'Create folder'. Name the folder 'media' and click 'Save'.
- Inside the folder, click 'Upload', 'Add files', and then select all the images that you are using for your site.
- Then under 'Permissions' select the option 'Grant public-read access' and click upload.
- Your static files and media files should be automatically linked from django to your S3 bucket.

## Forking this repository
- Locate the repository at this link [Cheesy Store](https://github.com/chrisryan91/CheesyStore_PP5).
- At the top of the repository, on the right side of the page, select "Fork" from the buttons available. 
- A copy of the repository is now created.

## Cloning this repository
To clone this repository follow the below steps: 

1. Locate the repository at this link [Cheesy Store](https://github.com/chrisryan91/CheesyStore_PP5). 
2. Under **'Code'**, see the different cloning options, HTTPS, SSH, and GitHub CLI. Click the prefered cloning option, and then copy the link provided. 
3. Open **Terminal**.
4. In Terminal, change the current working directory to the desired location of the cloned directory.
5. Type **'git clone'**, and then paste the URL copied from GitHub earlier. 
6. Type **'Enter'** to create the local clone. 

## Credits

I wouldn't like to dedicate this to God.