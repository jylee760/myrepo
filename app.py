from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Ewqh9783!",
    database="last_resort_hotels"
)
cursor = mydb.cursor()
@app.route('/')
def home():
    questions = {1:"Top 3 Customers By Reservation Frequency",
                 2:"Average Quality Of Each Organization",
                 3:"Customer Who Has Spent The Most",
                 4:"Highest Revenue Years Ordered",
                 5:"Complex Building Capacities"}
    return render_template('index.html',questions=questions)
@app.route('/category',methods=['POST'])
def category():
    queryCase = request.form['question']
    if queryCase == "select":
        return redirect(url_for('home'))
    dict = {
        1:"SELECT customer.firstName,customer.lastName,count(*) "
          "FROM customer "
          "JOIN reservation "
          "ON customer.customerId=reservation.customerId "
          "GROUP BY customer.customerId "
          "ORDER BY COUNT(*) DESC LIMIT 3",
        2:"SELECT organizationName,AVG(qualityAssessmentScore) "
          "FROM customer "
          "GROUP BY organizationName "
          "ORDER BY AVG(qualityAssessmentScore) DESC ",
        3:"SELECT customer.firstName,customer.lastName,SUM(charge.amount) "
          "FROM customer "
          "JOIN guest "
          "ON customer.customerId=guest.customerId "
          "JOIN charge "
          "ON guest.customerId = charge.customerId AND guest.reservationNumber = charge.reservationNumber "
          "GROUP BY customer.customerId "
          "ORDER BY SUM(charge.amount) DESC LIMIT 1 ",
        4:"SELECT YEAR(charge.chargeTime) AS year, SUM(charge.amount) "
          "FROM charge "
          "GROUP BY year "
          "ORDER BY SUM(charge.amount) DESC",
        5:"SELECT building.buildingId,SUM(room.capacity) "
          "FROM building "
          "JOIN wing "
          "ON building.buildingId=wing.buildingId "
          "JOIN room "
          "ON wing.wingId = room.wingId "
          "GROUP BY building.buildingId "
          "ORDER BY SUM(room.capacity) "
          "DESC LIMIT 5"
     }
    queryCase = int(queryCase)
    query = dict[queryCase]
    cursor.execute(query)
    queryToAnswer = cursor.fetchall()
    dict = {}
    if queryCase == 1:
        for i in range(len(queryToAnswer)):
            tuple = queryToAnswer[i]
            firstName = tuple[0]
            lastName = tuple[1]
            reservation = tuple[2]
            dict[i+1] = firstName + " " + lastName + " - " + str(reservation)
    if queryCase ==2:
        for i in range(len(queryToAnswer)):
            tuple = queryToAnswer[i]
            org = tuple[0]
            if org is None:
                continue
            avgQuality = tuple[1]
            if avgQuality is None:
                avgQuality = "N/A"
            else:
                avgQuality = int(avgQuality)
            dict[i+1] = org + " - " + str(avgQuality)
    if queryCase ==3:
        tuple = queryToAnswer[0]
        dict[1] = tuple[0] + " " + tuple[1] + " - " + str(tuple[2])
    if queryCase ==4:
        for i in range(len(queryToAnswer)):
            tuple = queryToAnswer[i]
            year = tuple[0]
            amount = str(tuple[1])
            dict[year] = amount
    if queryCase ==5:
        for i in range(len(queryToAnswer)):
            tuple = queryToAnswer[i]
            building = tuple[0]
            capacity = str(tuple[1])
            dict[building] = capacity

    return render_template('category.html',values=dict)
if __name__ == "__main__":
    app.run(debug=True,port=5001)