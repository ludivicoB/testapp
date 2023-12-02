from flask import Flask, request, jsonify
from users import get_all_users, get_user_by_id, create_user, update_user, delete_user
from users import get_all_recipes, get_recipe_by_id, get_all_recipe_by_userid
from flask_mysqldb import MySQL

from database import set_database


app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'D0oll@ar'
app.config['MYSQL_DB'] = 'im2_finalproject'
app.config["MYSQL_CURSORCLASS"] = "DictCursor" # to return rows as dictionaries not array


mysql = MySQL(app)
set_database(mysql) 


@app.route('/')
def home():
    return  "<h1>Hello, im!</h1>"

@app.route('/users', methods=['GET', 'POST'])
def users():
    if request.method == 'POST':
        data = request.get_json()
        result = create_user(data)              
    else:
        result = get_all_users()
    return jsonify(result) 

@app.route('/users/<id>', methods=['GET', 'PUT', 'DELETE'])
def users_by_id(id):
    if request.method == 'PUT':
        data = request.get_json()
        result = update_user(id, data)
    if request.method == 'DELETE':
        result = delete_user(id)
    else:
        result = get_user_by_id(id)
    return jsonify(result)

@app.route('/recipes', methods=['GET'])
def recipes():
    result = get_all_recipes()
    return jsonify(result)

@app.route('/recipes/<id>', methods=['GET', 'PUT', 'DELETE'])
def recipes_by_id(id):
    result = get_recipe_by_id(id)
    return jsonify(result)

@app.route('/recipes/user/<id>', methods=['GET'])
def recipes_by_userid(id):
    result = get_all_recipe_by_userid(id)
    return jsonify(result)