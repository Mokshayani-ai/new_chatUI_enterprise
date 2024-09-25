from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/ask', methods=['POST'])
def chatbot():
    data = request.get_json()
    user_message = data.get('message')

    # Example logic to generate a response
    if "Kennedy" in user_message:
        response_message = "President Kennedy traveled frequently during his presidency."
    else:
        response_message = f"I received your message: {user_message}"

    return jsonify({"response": response_message})

if __name__ == '__main__':
    app.run(debug=True)
