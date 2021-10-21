# Python < 3.6 could not run f-strings 
# Python >= 3.6 can run

user_added = True
user = "Bar" 

if user_added == False:
  print(f"Adding {user} to database")
  user_added = True
print(f"User {user} exists in database")
