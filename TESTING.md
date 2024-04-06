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

## User Story 1: As a site administrator, I can manage user accounts, including activating, deactivating, and deleting accounts, so that I can maintain the site's user base and security.

I used the Code Institute template at the very beginning of my project. Once I got my Development Environment set up correctly and installed Django, I was able to create a superuser. Once configured properly, I was able to access the admin panel which would allow me to manage user accounts so that I could maintain and sites userbase and security.

Here is an example of a class that Registers my blog posts with the admin panel:

<details>
<summary>User Story 1</summary>
<br>

```
class ProductAdmin(admin.ModelAdmin):
    # Specify the fields to display in the admin list view.
    list_display = (
        'sku',
        'name',
        'category',
        'origin',
        'cheesetype',
        'rating',
        'image',
        'in_stock'
    )


# CategoryAdmin Configuration.
class CategoryAdmin(admin.ModelAdmin):
    # Display fields for categories.
    list_display = (
        'friendly_name',
        'name'
    )


# CheeseType Configuration.
class CheeseTypeAdmin(admin.ModelAdmin):
    # Configuration for CheeseType model to improve admin interface.
    list_display = (
        'friendly_name',
        'name'
    )


# Cheese Origin Configuration.
class OriginAdmin(admin.ModelAdmin):
    # Display fields for the admin model.
    list_display = (
        'friendly_name',
        'name'
    )


class RatingAdmin(admin.ModelAdmin):
    list_display = ('product', 'user', 'stars')
    list_filter = ('product', 'user')
    search_fields = ('product__name', 'user__username')

```
</details>

## 2: As a site user, I can subscribe to the newsletter to receive updates on new cheese arrivals, promotions, and blog posts so that I can stay informed. 

For this User Story to be completed, I had to set up an account with MailChimp which provided me with a form to embed into a html document, css styling and JavaScript to use in my website. Using the Dashboard on MailChimp I manage my Audience of people who signed up for a News Letter.

<details>
<summary>User Story 2</summary>
<br>

![Mailchimp Dashboard Audience](media/readme_images/mailchimpss.png)

</details>

## User Story 3: As a site user, I can read blog posts about cheese tasting, pairing tips, and cheese-making processes so that I can expand my knowledge and appreciation of cheese.

For this user story to be completed, I needed to set up a new app using the command "python manage.py startapp cheesyblog". From here I was able to create models, views, urls and templates to creat an app. This allowed a blog post to be published by the admin through the django admin panel and render it trough a template. I created a cheesyblogpost page too for users to read the full posts. This blog will attract users to my website who are interested in cheese and turn them into potential customers.

Below is the view which gets the blog post from the database and renders it to the template.

<details>
<summary>User Story 3</summary>
<br>

```
class CheesyBlogListView(ListView):
    # Specify the model to retrieve data form.
    model = Post
    # Template path.
    template_name = 'cheesyblog/cheesyblog.html'
    # Name of the variable in the template.
    context_object_name = 'posts'
    # Number of posts per page.
    paginate_by = 6
    posts = Post.objects.filter(status=1).order_by('-created_on')

    # Define the query to fetch published posts and order them.
    def get_queryset(self):
        return Post.objects.filter(status=1).order_by('-created_on')

    # Context data with total posts count and pages count.
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        total_posts = Post.objects.filter(status=1).count()
        context['total_posts'] = total_posts

        paginator = Paginator(self.get_queryset(), self.paginate_by)
        total_pages = paginator.num_pages
        context['total_pages'] = total_pages

        return context
```

</details>

## User Story 4: As a site user, I can leave comments and reviews on cheeses and blog posts so that I can share my opinions and experiences with other users.

For this User Story to be completed, I needed to create a model for each comment. The model is based below and has fields for the post the comment is on, the user who is writing it, the text of the comment, the time it was created and it's approval status. From here, I created a form in forms.py with a meta class to specify what model the form is associated with. The form provides a field for the body as the others fields will be created automatically. Finally, I updated the view to provide commenting functionality and rendered the form in the template if the user was authenticated.

<details>
<summary>User Story 4</summary>
<br>
```
class Comment(models.Model):
    post = models.ForeignKey(
        Post,
        on_delete=models.CASCADE,
        related_name="comments"
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='comments_user'
    )
    body = models.TextField(max_length=1000)
    created_on = models.DateTimeField(default=timezone.now)
    approved = models.BooleanField(default=False)
```

```
class CommentForm(forms.ModelForm):
    # Meta class to specify which model the form is associated with.
    class Meta:
        model = Comment
        fields = ('body',)
```

```
  {% if user.is_authenticated %}
  <h4>Leave a comment:</h4>
  <p class="text-muted">{{ user.username }}</p>
  <form method="post" id="commentform">
      {{ comment_form|crispy }}
      {% csrf_token %}
      <button type="submit" class="btn" id="commentsubmit"><u>Submit</u></button>
  </form>
  {% endif %}

```
</details>


## User Story 5: As a site administrator, I can create and publish blog posts about cheese-related topics so that I can engage users and attract traffic to the site.

After creating my blog models, views, urls and got them wired up with templates, all I needed to do was register the Post and Comment models in the admin panel that Django provides. Once they were registered, I could add posts and approved comments from users of the website. The two admin classes are below.

<details>
<summary>User Story 5</summary>
<br>

```
@admin.register(Post)
class PostAdmin(SummernoteModelAdmin):
    # Configure the list display in the admin panel to show these fields
    list_display = ('title', 'slug', 'status', 'created_on')
    # Enable searching within the title and content fields
    search_fields = ['title', 'content']
    # Fill the slug field based on the title to avoid manual entry
    prepopulated_fields = {'slug': ('title',)}
    # Filter options.
    list_filter = ('status', 'created_on')
    # Specify which fields should use the Summernote rich-text editor
    summernote_fields = ('content',)

    fieldsets = (
        (None, {
            'fields': ('title', 'slug', 'author', 'status')
        }),
        ('Content', {
            'fields': ('content', 'keywords'),
            'classes': ('collapse',),
        }),
    )

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    # Configure the list display to show these specific fields for each comment
    list_display = ('user', 'body', 'post', 'created_on', 'approved')
    # Adjust or remove these fields based on your actual model definitions.
    search_fields = ['user', 'post']
    # Filter options.
    list_filter = ('approved', 'created_on')
    # Custom admin action to approve comments directly from the list view
    actions = ['approve_comments']

    # Define a custom action.
    def approve_comments(self, request, queryset):
        # Marks approved selected comments.
        queryset.update(approved=True)
    # Provide a short description for the action
    approve_comments.short_description = "Mark selected comments as approved"
```
</details>

## User Story 6: As a site administrator, I can add, edit, and delete cheeses from the store inventory so that I can manage the product catalog.

For this user story, I created two seperate html pages for editing and deleting products from the database. I created two buttons - delete and edit - and rendered them only to superusers. They appear below the items on the main store and on the product detail page. They are connected to urls which trigger the below views for adding, editing and deleting products. Clicking a delete button will generate a question asking "are you sure?" while clicking edit a product will bring you to the edit_product html page. 

In the navigation bar, under my account, for superusers a link is shown with a link to the add_product page. This will generate a blank form to add new products.

<details>
<summary>User Story 1</summary>
<br>

```
def add_product(request):

    if not request.user.is_superuser:
        
        # Return error message is user is not a superuser.
        messages.error(request, 'Sorry only store owners can do that')
        return redirect(reverse('home'))

    if request.method == 'POST':
        form = ProductForms(request.POST, request.FILES)
        if form.is_valid():
            # Save the form if it is valid and provide success message.
            product = form.save()
            messages.info(request, 'Successfully added product!')
            return redirect(reverse('product_detail', args=[product.id]))
        else:
            # Return error message otherwise.
            messages.error(request, 'Failed to add product!!')
    else:
        form = ProductForms()

    # Prepare template and context.
    template = 'products/add_product.html'
    context = {
        'form': form,
        'ignore_section': True,
    }

    # Return template with context.
    return render(request, template, context)


@login_required
def edit_product(request, product_id):

    # Check if the user is a superuser and return error if not.
    if not request.user.is_superuser:
        messages.error(request, 'Sorry only store owners can do that')
        return redirect(reverse('home'))

    # Show 404 error is product is not found.
    product = get_object_or_404(Product, pk=product_id)

    # Process the form data if request is POST.
    if request.method == 'POST':
        form = ProductForms(request.POST, request.FILES, instance=product)
        # Check if the form is valid and save if so.
        if form.is_valid():
            form.save()
            messages.info(request, 'Successfully updated product')
            return redirect(reverse('product_detail', args=[product.id]))
        else:
            messages.error(request, 'Failed to update product')
    else:
        # If not a POST request initialise form with product instance.
        form = ProductForms(instance=product)
        messages.info(request, f'You are editing {product.name}')

    # Define template and context
    template = 'products/edit_product.html'
    context = {
        'form': form,
        'product': product,
        'ignore_section': True,
    }

    # Render and return the template with context.
    return render(request, template, context)


@login_required
def delete_product(request, product_id):
    # Check if the user is a superuser.
    if not request.user.is_superuser:
        messages.error(request, 'Sorry only store owners can do that')
        # Redirect to homepage if not a superuser.
        return redirect(reverse('home'))

    # Return 404 error if product not found.
    product = get_object_or_404(Product, pk=product_id)

    # Delete the product if found, provide success message and redirect to list of products.
    product.delete()
    messages.info(request, 'Product Deleted!')
    return redirect(reverse('products'))
```
</details>

## User Story 7: As a site user, I can create an account and log in so that I can track my order history and manage my profile information.

Authentication is handled with django AllAuth. I installed and imported AllAuth's User model to handle User information. Users can register with an email and a password. Once they have registered, a profile page is automatically generated. The profile page appears as a link in the Navigation bar. The profile page contains all the users shipping information and order history. I created a User Profile Form in forms.py and imported it into the view generating the Profile page. The fields in the form in the profile page are prepopulated with saved information but can be updated.

The Order History part of the profile page retrieves the Users previous orders from the database. A link provided for each order will link back to the Checkout Success page after the original purchase. The view for this is pasted below.

<details>
<summary>User Story 7</summary>
<br>

```
class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        exclude = ('user',)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Define placeholders for the form fields.
        placeholders = {
            'default_phone_number': 'Phone Number',
            'default_postcode': 'Postal Code',
            'default_town_or_city': 'Town or City',
            'default_street_address1': 'Street Address 1',
            'default_street_address2': 'Street Address 2',
            'default_county': 'County, State or Locality',
        }

        self.fields['default_phone_number'].widget.attrs['autofocus'] = True

        # Loop through the form fields to set their placeholders.
        for field in self.fields:
            # Skip default_country field.
            if field != 'default_country':
                if self.fields[field].required:
                    # Add a star to signify required.
                    placeholder = f'{placeholders[field]} *'
                else:
                    placeholder = placeholders[field]
                # Set the place holder attribute.
                self.fields[field].widget.attrs['placeholder'] = placeholder

            # Set CSS
            self.fields[field].widget.attrs['class'] = 'border-black rounded-0 profile-form-input'

            # Remove fields label.
            self.fields[field].label = False
```

```
def order_history(request, order_number):

    # Retrieve the Order instance with the given order_number or return 404.
    order = get_object_or_404(Order, order_number=order_number)

    # Display an informational message about the order history.
    messages.info(request, (
        f'This is a past confirmation for order number {order_number}'
        'A confirmation email was sent on the order date.'
    ))

    # Define the template and context for profile page.
    template = 'checkout/checkout_success.html'
    context = {
        'order': order,
    }

    # Render and return the order history for the profile.
    return render(request, template, context)
```

</details>

## User Story 8: As a site user, I can view detailed information about each cheese, including its origin, flavor profile, and suggested pairings, so that I can make an informed decision.

This view is not finished as I have no completed the functionality to provide each cheese's flavor profile and suggested pairings. So far, each cheese has associated with it in it's model a category, origin and type. A brief description of the cheese is also provided to the user alongside a picture.

For this, I linked from the main store to a Product Detail page which contained all the information about the cheese from the database. Pasted below is the Product model and an image of the finished product detail page.

<details>
<summary>User Story 8</summary>
<br>

```
class Product(models.Model):
    # Category of the product.
    category = models.ForeignKey('Category', null=True, blank=True, on_delete=models.SET_NULL)
    # Type of cheese.
    cheesetype = models.ForeignKey('CheeseType', null=True, blank=True, on_delete=models.SET_NULL)
    # Origin of cheese.
    origin = models.ForeignKey('Origin', null=True, blank=True, on_delete=models.SET_NULL)
    sku = models.CharField(max_length=254, null=True, blank=True)
    name = models.CharField(max_length=254)
    description = models.TextField()
    price = models.DecimalField(max_digits=6, decimal_places=2)
    rating = models.DecimalField(max_digits=6, decimal_places=2, null=True, blank=True)
    in_stock = models.BooleanField(default=True, null=True, blank=True)
    image_url = models.URLField(max_length=1024, null=True, blank=True)
    image = models.ImageField(null=True, blank=True)

    def __str__(self):
        # String representation.
        return self.name
```

![User Story 1](media/readme_images/productdetail1.png)
</details>


## 9: As a site user, I can search for specific types of cheeses (e.g., soft, hard, aged) so that I can find cheeses that match my preferences.

## 10: As a site user, I can add cheeses to my cart and proceed to checkout so that I can purchase them. 

## 11: As a site user, I can browse a variety of cheeses so that I can explore different options.

## 12: As a user, I want to be able to set up an account and login in and log out so I can purchase items and leave a comment.

## 13: As a potential customer, I want to interact with a chatbot on the cheese-selling website so that I can receive personalized recommendations, get answers to my questions about the products, and have assistance throughout the checkout process, making my shopping experience smoother and more enjoyable.

## 14: As a user, I want to easily find answers to frequently asked questions so that I can make informed decisions about the products and policies without needing to wait for a response from customer service.

## 15: As a user, I want to subscribe to a monthly cheese subscription service so that I can discover new cheeses and have a consistent supply of high-quality cheese without having to reorder manually each time.

## 16: As a user, I want to participate in a loyalty program that rewards me for my purchases so that I can enjoy discounts, get early access to new products, and access exclusive content.

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