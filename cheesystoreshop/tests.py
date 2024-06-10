from django.test import TestCase
from django.urls import reverse
from .models import Product, Category, CheeseType, Origin, Rating
from django.contrib.auth.models import User
from django.contrib.messages import get_messages
from .forms import ProductForms
from django.core.exceptions import ValidationError
from django.db.models import Avg
import json

class ProductViewTests(TestCase):
    def setUp(self):
        self.category1 = Category.objects.create(name="category1")
        self.category2 = Category.objects.create(name="category2")

        self.cheesetype1 = CheeseType.objects.create(name="cheesetype1")
        self.cheesetype2 = CheeseType.objects.create(name="cheesetype2")
    
        self.origin1 = Origin.objects.create(name="origin1")
        self.origin2 = Origin.objects.create(name="origin2")

        self.product1 = Product.objects.create(
            category=self.category1,
            cheesetype=self.cheesetype1,
            origin=self.origin1,
            sku='0001',
            name="Product1",
            description="Description1",
            price="10.00",
            rating="4.5",
            in_stock=True
        )

        self.product2 = Product.objects.create(
            category=self.category2,
            cheesetype=self.cheesetype2,
            origin=self.origin2,
            sku='0002',
            name="Product2",
            description="Description2",
            price="20.00",
            rating="3.5",
            in_stock=True
        )

    def test_all_products_view(self):
        response = self.client.get(reverse('products'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'products/products.html')
        self.assertContains(response, 'Product1')
        self.assertContains(response, 'Product2')

    def test_filter_category(self):
        response = self.client.get(reverse('products'), {'category': 'category1'})
        self.assertContains(response, 'Product1')
        self.assertNotContains(response, 'Product2')

    def test_filter_cheesetype(self):
        response = self.client.get(reverse('products'), {'cheesytype': 'cheesetype1'})
        self.assertContains(response, 'Product1')
        self.assertNotContains(response, 'Product2')

    def test_filter_origin(self):
        response = self.client.get(reverse('products'), {'origin': 'origin1'})
        self.assertContains(response, 'Product1')
        self.assertNotContains(response, 'Product2')
    
    def test_search_functionality(self):
        response = self.client.get(reverse('products'), {'sort': 'name', 'direction': 'desc'})
        products = list(response.context['products'])
        self.assertEqual(products[0].name, 'Product2')
        self.assertEqual(products[1].name, 'Product1')
    
    def test_sorting(self):
        response = self.client.get(reverse('products'), {'sort': 'name', 'direction': 'desc'})
        products = list(response.context['products'])
        self.assertEqual(products[0].name, 'Product2')
        self.assertEqual(products[1].name, 'Product1')

    def test_pagination(self):
        # Create more products for pagination
        for i in range(3, 21):
            Product.objects.create(
                category=self.category1,
                cheesetype=self.cheesetype1,
                origin=self.origin1,
                sku=f"000{i}",
                name=f"Product{i}",
                description=f"Description{i}",
                price="10.00",
                rating="4.5",
                in_stock=True
            )

        response = self.client.get(reverse('products'))
        self.assertEqual(len(response.context['products']), 18)

        response = self.client.get(reverse('products'), {'page': 2})
        self.assertEqual(len(response.context['products']), 2)

class ProductDetailViewTest(TestCase):

    def setUp(self):
        self.category = Category.objects.create(name="category")
        self.cheesetype = CheeseType.objects.create(name="cheesetype")
        self.origin = Origin.objects.create(name="origin")

        self.product = Product.objects.create(
            category=self.category,
            cheesetype=self.cheesetype,
            origin=self.origin,
            sku='0001',
            name="Product1",
            description="Description1",
            price="10.00",
            rating="4.5",
            in_stock=True
        )

        self.user = User.objects.create_user(
            username='testuser',
            password='12345'
        )
    
    def test_product_detail_view(self):
        response = self.client.get(reverse('product_detail', args=[self.product.id]))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.product.name)
        self.assertContains(response, self.product.description)
        self.assertContains(response, self.product.price)
        self.assertContains(response, self.product.rating)
    
    def test_product_detail_view_w_authentication(self):
        self.client.login(username='testuser', password='12345')
        response = self.client.get(reverse('product_detail', args=[self.product.id]))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.product.name)
        self.assertContains(response, self.product.description)
        self.assertContains(response, self.product.price)
        self.assertContains(response, self.product.rating)

    def test_product_detail_view_w_authentication_rating(self):
        Rating.objects.create(
            product=self.product,
            user=self.user,
            stars=5
        )
        self.client.login(username='testuser', password='12345')
        response = self.client.get(reverse('product_detail', args=[self.product.id]))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.product.name)
        self.assertContains(response, self.product.description)
        self.assertContains(response, self.product.price)

class AddProductViewTests(TestCase):
    def setUp(self):
        self.category = Category.objects.create(name="category")
        self.cheesetype = CheeseType.objects.create(name="cheesetype")
        self.origin = Origin.objects.create(name="origin")
        
        self.superuser = User.objects.create_superuser(
            username='admin',
            password='adminpassword'
        )
        
        self.user = User.objects.create_user(
            username='testuser',
            password='testpassword'
        )

        def test_non_superuser_access(self):
            self.client.login(username='testuser', password='testpassword')
            response = self.client.get(reverse('add_product'))
            self.assertEqual(response.status_code, 302)
            self.assertRedirects(response, reverse('home'))
            messages = list(get_messages(response.wsgi_request))
            self.assertEqual(len(messages), 1)
            self.assertEqual(str(messages[0]), 'Sorry only store owners can do that')

        def test_superuser_get_request(self):
            self.client.login(username='admin', password='adminpassword')
            response = self.client.get(reverse('add_product'))
            self.assertEqual(response.status_code, 200)
            self.assertTemplateUsed(response, 'products/add_product.html')
            self.assertIsInstance(response.context['form'], ProductForms)

    
        def test_superuser_get_request(self):
            self.client.login(username='admin', password='adminpassword')
            valid_data = {
                'category': self.category.id,
                'cheesetype': self.cheesetype.id,
                'origin': self.origin.id,
                'sku': '0003',
                'name': 'Product3',
                'description': 'Description3',
                'price': '30.00',
                'rating': '5.0',
                'in_stock': True,
                }
            response = self.client.post(reverse('add_product'), valid_data)
            self.assertEqual(response.status_code, 302)
            product = Product.objects.get(name='Product3')
            self.assertRedirects(response, reverse('product_detail', args=[product.id]))
            messages = list(get_messages(response.wsgi_request))
            self.assertEqual(len(messages), 1)
            self.assertEqual(str(messages[0]), 'Successfully added product!')

            invalid_data = {
                'category': '',
                'cheesetype': '',
                'origin': '',
                'sku': '',
                'name': '',
                'description': '',
                'price': '',
                'rating': '',
                'in_stock': '',
            }
            response = self.client.post(reverse('add_product'), invalid_data)
            self.assertEqual(response.status_code, 200)
            self.assertTemplateUsed(response, 'products/add_product.html')
            form = response.context['form']
            self.assertFalse(form.is_valid())
            messages = list(get_messages(response.wsgi_request))
            self.assertEqual(len(messages), 1)
            self.assertEqual(str(messages[0]), 'Failed to add product!!')

class EditProductViewTests(TestCase):
    def setUp(self):
        self.category = Category.objects.create(name="category")
        self.cheesetype = CheeseType.objects.create(name="cheesetype")
        self.origin = Origin.objects.create(name="origin")

        self.product = Product.objects.create(
            category=self.category,
            cheesetype=self.cheesetype,
            origin=self.origin,
            sku='0001',
            name="Product1",
            description="Description1",
            price="10.00",
            rating="4.5",
            in_stock=True
        )

        self.superuser = User.objects.create_superuser(
            username='admin',
            password='adminpassword'
        )

        self.user = User.objects.create_user(
            username='testuser',
            password='testpassword'
        )

        def test_non_superuser_access(self):
            self.client.login(username='testuser', password='testpassword')
            response = self.client.get(reverse('edit_product', args=[self.product.id]))
            self.assertEqual(response.status_code, 302)
            self.assertRedirects(response, reverse('home'))
            messages = list(get_messages(response.wsgi_request))
            self.assertEqual(len(messages), 1)
            self.assertEqual(str(messages[0]), 'Sorry only store owners can do that')

        def test_superuser_valid_post_data(self):
            self.client.login(username='testuser', password='testpassword')
            valid_data = {
                'category': self.category.id,
                'cheesetype': self.cheesetype.id,
                'origin': self.origin.id,
                'sku': '0001',
                'name': 'UpdatedProduct',
                'description': 'UpdatedDescription',
                'price': '15.00',
                'rating': '4.8',
                'in_stock': True,
            }
            response = self.client.get(reverse('edit_product', args=[self.product.id]), valid_data)
            self.assertEqual(response.status_code, 302)
            self.product.refresh_from_db()
            self.assertEqual(self.product.name, 'UpdatedProduct')
            self.assertRedirects(response, reverse('product_detail', args=[self.product.id]))
            messages = list(get_messages(response.wsgi_request))
            self.assertEqual(len(messages), 1)
            self.assertEqual(str(messages[0]), 'Successfully updated product')

        def test_superuser_invalid_post_data(self):
            self.client.login(username='testuser', password='testpassword')
            invalid_data = {
                'category': '',
                'cheesetype': '',
                'origin': '',
                'sku': '',
                'name': '',
                'description': '',
                'price': '',
                'rating': '',
                'in_stock': '',
            }
            response = self.client.get(reverse('edit_product', args=[self.product.id]), invalid_data)
            self.assertEqual(response.status_code, 200)

            self.assertTemplateUser(response, 'products/edit_product.html')
            form = response.context['form']
            self.assertFalse(form.is_valid())

            messages = list(get_messages(response.wsgi_request))
            self.assertEqual(len(messages), 1)
            self.assertEqual(str(messages[0]), 'Failed to update product')

class DeleteProductViewTests(TestCase):

    def setUp(self):
        self.category = Category.objects.create(name="category")
        self.cheesetype = CheeseType.objects.create(name="cheesetype")
        self.origin = Origin.objects.create(name="origin")

        self.product = Product.objects.create(
            category=self.category,
            cheesetype=self.cheesetype,
            origin=self.origin,
            sku='0001',
            name="Product1",
            description="Description1",
            price="10.00",
            rating="4.5",
            in_stock=True
        )

        self.superuser = User.objects.create_superuser(
            username='admin',
            password='adminpassword'
        )

        self.user = User.objects.create_user(
            username='testuser',
            password='testpassword'
        )

    def test_non_superuser_access(self):
        self.client.login(username='testuser', password='testpassword')
        response = self.client.post(reverse('delete_product', args=[self.product.id]))
        self.assertEqual(response.status_code, 302)
        self.assertRedirects(response, reverse('home'))
        messages = list(get_messages(response.wsgi_request))
        self.assertEqual(len(messages), 1)
        self.assertEqual(str(messages[0]), 'Sorry only store owners can do that')

    def test_superuser_delete_product(self):
        self.client.login(username='admin', password='adminpassword')
        response = self.client.post(reverse('delete_product', args=[self.product.id]))
        self.assertEqual(response.status_code, 302)
        self.assertRedirects(response, reverse('products'))
        messages = list(get_messages(response.wsgi_request))
        self.assertEqual(len(messages), 1)
        self.assertEqual(str(messages[0]), 'Product Deleted!')
        with self.assertRaises(Product.DoesNotExist):
            Product.objects.get(pk=self.product.id)

class RateProductViewTests(TestCase):

    def setUp(self):
        self.category = Category.objects.create(name="category")
        self.cheesetype = CheeseType.objects.create(name="cheesetype")
        self.origin = Origin.objects.create(name="origin")

        self.product = Product.objects.create(
            category=self.category,
            cheesetype=self.cheesetype,
            origin=self.origin,
            sku='0001',
            name="Product1",
            description="Description1",
            price="10.00",
            rating="4.5",
            in_stock=True
        )

        self.user = User.objects.create_user(
            username='testuser',
            password='testpassword'
        )

    def test_unauthenticated_access(self):
        response = self.client.post(
            reverse('rate_product'),
            json.dumps({'product_id': self.product.id, 'stars': 5}),
            content_type='application/json'
        )
        self.assertEqual(response.status_code, 401)
        self.assertEqual(response.json(), {'error': 'Authentication required'})
    
    def test_invalid_product_id(self):
        self.client.login(username='testuser', password='testpassword')
        response = self.client.post(
            reverse('rate_product'),
            json.dumps({'product_id': 'invalid', 'stars': 5}),
            content_type='application/json'
        )
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {'error': 'Invalid product ID'})

        response = self.client.post(
            reverse('rate_product'),
            json.dumps({'product_id': 9999, 'stars': 5}),
            content_type='application/json'
        )
        self.assertEqual(response.status_code, 404)