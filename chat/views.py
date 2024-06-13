from django.shortcuts import render
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

