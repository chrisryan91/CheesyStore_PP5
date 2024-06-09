from django.test import TestCase
from django.urls import reverse
from cheesystoreshop.models import Product, Category, CheeseType, Origin

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