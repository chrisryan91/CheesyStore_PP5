from openai import OpenAI

client = OpenAI(api_key="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")


def chat(prompt):
    response = client.chat.completions.create(model="gpt-3.5-turbo",
    messages=[{"role": "user", "content": prompt}])

    return response.choices[0].message.content.strip()

if __name__ == "__main__":
    while True:
        user_input = input("You: ")
        if user_input.lower() in ["quit", "exit", "bye", "au revoir"]:
            break

        response = chat(user_input)
        print("Chatbot: ", response)