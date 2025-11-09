from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def add_numbers():
return """
<form method='GET'>
<input name='num1' placeholder='Enter first number here'/>
<input name='num2' placeholder='Enter second number'/>
<button type='submit'>Add</button>
</form>
""" + (
f"Sum: {int(request.args.get('num1',0)) + int(request.args.get('num2',0))}"
if 'num1' in request.args and 'num2' in request.args else ''
)

if __name__ == "__main__":
app.run(host="0.0.0.0", port=8000)
