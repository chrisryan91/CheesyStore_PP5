from django.shortcuts import render
from cheesyblog.models import Post
from cheesystoreshop.models import Product
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from openai import OpenAI
import json

# Views for index.html - homepage
def index(request):
    # Fetch the last three latest blog posts.
    blog_posts1 = Post.objects.filter(status=1).order_by('-created_on')[:3]

    # Fetch the latest blog post.
    blog_posts2 = Post.objects.filter(status=1).order_by('-created_on')[:1]

    # Query products in new_arrivals category.
    category_name = "new_arrival"

    base_query = Product.objects.filter(
        category__name=category_name
    ).order_by('-id')

    # Fetch the latest arrival.
    new_arrival = base_query[:1]

    # Fetch the three latest arrivals.
    new_arrivals = base_query[:3]

    context = {'blog_posts1': blog_posts1,
               'blog_posts2': blog_posts2,
               'new_arrival': new_arrival,
               'new_arrivals': new_arrivals}

    # Render and return the 'home/index.html' template with context.
    return render(request, 'home/index.html', context)

client = OpenAI(api_key="sk-proj-NYme41mQlziEYlCLFrKiT3BlbkFJhQuXgLEgvbLwJTahzqKM")

@csrf_exempt
def chat(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            prompt = data.get('prompt', '')
            print("Prompt:", prompt)
            response = chatbot_response(prompt)
            return JsonResponse({'response': response})
        except json.JSONDecodeError as e:
            print("Error decoding JSON:", e)
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
    return JsonResponse({'error': 'Invalid request'})

def chatbot_response(prompt):
    response = client.chat.completions.create(model="gpt-3.5-turbo", messages=[{"role": "user", "content": prompt}])
    print("Response from OpenAI API:", response)
    return response.choices[0].message.content.strip()