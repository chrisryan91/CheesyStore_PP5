from flask import Flask, request, jsonify, send_from_directory
from openai import OpenAI

app = Flask(__name__)
client = OpenAI(api_key="sk-proj-NYme41mQlziEYlCLFrKiT3BlbkFJhQuXgLEgvbLwJTahzqKM")

def chat(prompt):
    response = client.chat.completions.create(model="gpt-3.5-turbo", messages=[{"role": "user", "content": prompt}])
    return response.choices[0].message.content.strip()

@app.route('/')
def index():
    return send_from_directory('.', 'base.html')

@app.route('/chat', methods=['POST'])
def chat_endpoint():
    data = request.json
    prompt = data.get('prompt')
    response = chat(prompt)
    return jsonify({'response': response})

if __name__ == '__main__':
    app.run(debug=True)
