from database import fetchall, fetchone, execute



def create_user(data):
    # CREATE PROCEDURE InsertUser(firstname, lastname, email, password)
    cur = execute("""CALL InsertUser(%s, %s, %s, %s)""", 
            (data["firstname"], data["lastname"], data["email"], data["password"]))
    row = cur.fetchone()
    data["id"] = row["id"]
    return data
   


def get_all_users():
    rv = fetchall(""" SELECT * FROM user""")
    return rv

def get_user_by_id(id):
    rv = fetchone("""SELECT * FROM user where userid = %s""", (id,))
    return rv

def update_user(id, data):
    cur = execute("""CALL UpdateUser(%s, %s, %s, %s, %s)""",
            (id, data["firstname"], data["lastname"], data["email"], data["password"]))
    row = cur.fetchone()
    data["id"] = row["id"]
    return data

def delete_user(id):
    cur = execute("""CALL DeleteUser(%s)""", (id,))
    row = cur.fetchone()
    if row is None:
        return True
    return False


def get_all_recipes():
    rv = fetchall(""" SELECT * FROM UserRecipeView """)
    return rv

def get_recipe_by_id(id):
    rv = fetchone("""SELECT * FROM UserRecipeView where recipe_id = %s""", (id,))
    return rv

def get_all_recipe_by_userid(id):
    rv = fetchall("""SELECT * FROM UserRecipeView where user_id = %s""", (id,))
    return rv

def get_allingredients_by_recipeid(id):
    rv = fetchall("""SELECT * FROM RecipeIngredientView where recipe_id = %s""", (id,))
    return rv

def get_allinstructions_by_recipeid(id):
    rv = fetchall("""SELECT * FROM RecipeInstructionView where recipe_id = %s""", (id,))
    return rv