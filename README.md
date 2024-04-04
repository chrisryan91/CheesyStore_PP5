# CheesyStore

Welcome to CheesyStore, an online cheesemonger based in Ireland. Our website offers a handpicked selection of the finest cheeses from Ireland and around the world. CheesyStore goes beyond just selling cheese. Alongside the shop there is a blog featuring pairing guides, the stories behind our products, and the latest news from the dairy world. These insights, along with special offers, are shared across various social media platforms to keep our community engaged and informed.

Live Website here: [Cheesy Store](http://cheesystore-191ae9e3f358.herokuapp.com/)

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
    - [Authentication and Authorisation](#authentication-and-authorisation)
    - [Navigation](#navigation)
    - [Homepage](#homepage)
    - [Page 1 etc.](#page-1-etc)
    - [Features Left to Implement](#features-left-to-implement)
  - [Technologies Used](#technologies-used)
    - [Core Development Technologies](#core-development-technologies)
    - [Libraries, Frameworks and Packages](#libraries-frameworks-and-packages)
    - [Python/Django packages](#pythondjango-packages)
    - [Infrastructural Technologies](#infrastructural-technologies)
  - [Testing](#testing)
  - [Deployment](#deployment)
    - [Local Deployment](#local-deployment)
    - [Heroku](#heroku)
    - [Environment Variables](#environment-variables)
  - [Credits](#credits)

## Concept

This web application is a submission for Portfolio Project 5 with a focus on ecommerce. Given the criteria of the project, I needed a concept that would process payments with Stripe and that could be marketed on Social Media platforms. I decided on an online cheesemonger because there are lots of varieties to categorise it by and it has a universal appeal which means it is easily marketable.

I also wanted a concept that I could expand further. Given the deadline and the requirement for a Minimum Viable Product (MVP), I held back on integrating features that were not completely necessary. In future CheesyStore could expand to include recipes, pairing guides and an integrated chatbot with the ChatGPT API.

## Development

### User Stories

1. xxx

User Stories are tested in: [Testing.md](Testing.md)

Link to Project Board: [Project Board](https://github.com/users/chrisryan91/projects/10)

Link to User Stories + Tasks: [User Stories Board](https://github.com/users/chrisryan91/projects/11/views/1)

Link to MoSCoW Prioritisation Board: [MoSCoW Board](https://github.com/users/chrisryan91/projects/12)

### Wireframes

Wireframes were developed at the outset of my project. The general framework for how the website should be structured has remained the same. These served as a basis for my design from the beginning and prevented me from deviating too far in another direction. I created them partly because I understood that could could easily be made responsive to smaller screen sizes with bootstrap.

<details>
<summary>Search Page Initial Wireframe</summary>
<br>

![Search Page Initial Wireframe](static/readme_images/wireframes/New%20Wireframe%201.png)

</details>

### Design

xxx

### GitHub Projects

xxx

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

![Data Model Diagram](media\readme_images\datadiagram.png)
</details>

## Features

### CRUD Functionality

**Create:** 

**Read:** 

**Update:**

**Delete:**

### Authentication and Authorisation

**Django All Auth** is used for backend authentication:

- Users can create an account in the sign-up page.
- Users can sign-in to their account to leave comments, posts and likes using the sign-in page.
- Users can login back into their account using the login page.
- Only authorised users can visit the submit review page and update review page.

### Navigation

xxx

<details>
<summary>Larger Navbar</summary>
<br>

![Larger Navbar]()
</details>

<details>
<summary>Smaller Navbar</summary>
<br>

![Smaller Navbar]()
</details>

<details>
<summary>Footer</summary>
<br>

![Footer]()
</details>

### Homepage

<details>
<summary>Homepage</summary>
<br>

![Homepage]()
</details>

### Page 1 etc.

xxx

<details>
<summary></summary>
<br>

![Search Page]()
</details>

<details>
<summary>Search Results</summary>
<br>

![Search Results]()
</details>

### Features Left to Implement

1. xxx

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

## Deployment 

### Local Deployment

xxx

### Heroku 

xxx

### Environment Variables

xxx

## Credits

xxx
