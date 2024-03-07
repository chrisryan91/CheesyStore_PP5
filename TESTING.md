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
    - [Header](#header)
    - [Footer](#footer)
    - [Home Page](#home-page)
    - [Search Page](#search-page)
    - [Submit Review Page](#submit-review-page)
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

### Header

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Site Name| Click | Return to homepage | Working |

If not logged in:

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Register Link | Click | Directs to Register page | Working |

If logged in:

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Logout Link | Click | Directs to Logout page | Working |

### Footer

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Facebook Link | Click | Facebook opens in new tab | Working |

### Home Page

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Search Link | Click | Directs to Search page | Working |

### Search Page

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Form Input | Enter Ingredient | Select2 targets the element and saves it in a tag | Working |

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Card .Div. | Hover | Div. appears with anchored icon | Working |

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Next Link | Click | Directs to Next page | Working |

If logged in:

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Card Div. | Hover | Div. appears with second anchored icon | Working |

### Submit Review Page

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Title Input | Type/Click | Title will function | Working |

On Submit:

| Element | Action | Expectation | Result|
|---------|--------|-------------|-------|
| Cuisine Type Input | Enter Two Values | Valid | Working |

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