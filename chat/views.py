from django.shortcuts import render
from faq.models import FAQ
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from openai import OpenAI
import os

if os.path.isfile('env.py'):
    import env

# Create your views here.

OPENAI_API_KEY = os.environ['OPENAI_API_KEY']

client = OpenAI(api_key=OPENAI_API_KEY)

@csrf_exempt
def chat(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            prompt = data.get('prompt', '')
            print("Prompt:", prompt)
            response = match_faq(prompt)
            if not response:
                response = chatbot_response(prompt)
            return JsonResponse({'response': response})
        except json.JSONDecodeError as e:
            print("Error decoding JSON:", e)
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
    return JsonResponse({'error': 'Invalid request'})

def match_faq(prompt):
    faqs = FAQ.objects.all()
    for faq in faqs:
        if faq.keywords:
            keywords = faq.keywords.split(',')
            if any(keyword.strip().lower() in prompt.lower() for keyword in keywords):
                return faq.answer
    
    return None

def chatbot_response(prompt):
    store_context = (
        "Your name is Mary"
        "You are a real person who works 24/7 replying to questions"
        "If someone wants your number, tell them you are married"
        "If someone asks you on a date, say you are too busy answering questions"
        "If someone keeps asking, tell them your husband will be very angry"
        "Customers can contact support on out Contact Page"
        "Customers can also visit out frequently asked questions"
        "Responses should be kept short and concise"
    )
    full_prompt = store_context + prompt
    response = client.chat.completions.create(model="gpt-3.5-turbo", messages=[{"role": "user", "content": full_prompt}])
    print("Response from OpenAI API:", response)
    return response.choices[0].message.content.strip()

