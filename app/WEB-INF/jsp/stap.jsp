<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Hamburger Menu Example</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        /* background-image: linear-gradient(
            to bottom,
            rgba(245, 246, 252, 0.52),
            rgba(245, 4, 4, 0.73)
          ),
          url(ssn.jpg); */
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        font-family: Arial, sans-serif;
        position: relative;
      }

      p {
        text-align: center;
        font-size: 22px;
        font-stretch: expanded;
        font-weight: 700;
      }

      /* body::before{
        content: "";
        background-image: url(ssn.jpg);
        background-size: cover;
background-repeat: no-repeat;
        background-color: rgba(0,0,0,2.4);
        
      } */
      .hamburger-menu {
        display: inline-block;
        cursor: pointer;
        padding: 20px;
        position: absolute;
        z-index: 1;
        margin: 0px;
      }
      .hamburger-menu span {
        display: block;
        height: 3px;
        width: 40px;
        background-color: #000000;
        margin-bottom: 5px;
        margin-top: 8px;
        position: relative;
        transform-origin: center;
        transition: transform 0.3s ease-out, opacity 0.2s;
      }
      .hamburger-menu span:nth-child(2) {
        width: 40px;
        height: 3px;
      }
      .hamburger-menu span:nth-child(3) {
        width: 40px;
        height: 3px;
      }
      .hamburger-menu.open span:nth-child(1) {
        transform: translateY(10px) rotate(45deg);
      }
      .hamburger-menu.open span:nth-child(2) {
        opacity: 0;
      }
      .hamburger-menu.open span:nth-child(3) {
        transform: translateY(-10px) rotate(-45deg);
      }
      .menu {
        position: fixed;
        top: 0;
        left: -300px;
        width: 300px;
        height: 100%;
        background-color: #0a4d68;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.6);
        z-index: 0;
        transition: left 0.3s ease-out;
        margin-top: 0px;
      }
      .menu ul {
        list-style: none;
        padding: 0;
        margin-top: 100px;
        margin-left: 10px;
      }
      .menu li {
        padding: 10px;
        border-bottom: 1px solid #ffffff;
        font-size: 18px;
      }
      .menu li:hover {
        background-color: rgb(219, 127, 127);
      }
      .menu li:last-child {
        border-bottom: none;
      }
      .menu li:last-child:hover {
        background-color: transparent;
      }
      .menu a {
        color: #ffffff;
        text-decoration: none;
      }
      .menu.show {
        left: 0;
      }

      /* Main content styling */
      main {
        max-width: 1200px;
        margin: 0 auto;
        padding: 50px 20px;
      }
      main h2 {
        font-size: 36px;
        margin: 0;
      }
      main p {
        text-align: center;
        font-size: 22px;
        font-stretch: expanded;
        font-weight: 400;
        padding-bottom: 20px;
      }
      main a {
        background-color: #42b8dd;
        color: #fff;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 20px;
        display: inline-block;
        margin-top: 20px;
      }

      .slot {
        display: inline-block;
        margin: 5px;
        padding: 10px 20px;
        background-color: #eee;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      .slot:hover {
        background-color: #ddd;
      }

      .days {
        margin-left: 200px;
        width: 1000px;
        justify-items: center;
        display: flex;
        gap: 15px;
      }

      .day {
        width: 180px;
        height: 330px;
        background-color: #efeff6;
        padding: 40px;
        float: left;
        margin-right: 7px;
        margin-bottom: 5px;
        border-radius: 10px;
      }

      .datelabel {
        margin-bottom: 15px;
      }

      .timeslot {
        background-color: #00c09d;
        width: auto;
        height: 20px;
        color: white;
        padding: 7px;
        margin-top: 5px;
        font-size: 14px;
        border-radius: 3px;
        vertical-align: center;
        text-align: center;
      }

      .timeslot:hover {
        background-color: #2ca893;
        cursor: pointer;
      }

      label {
        font-size: 18px;
        margin-bottom: 10px;
        color: #666;
        display: block;
      }

      input[type="text"],
      input[type="date"],
      #reason,
      select {
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #cccccc;
        margin-bottom: 20px;
        width: 50%;
      }

      input[type="submit"] {
        background-color: #4caf50;
        color: #fff;
        cursor: pointer;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        transition: background-color 0.3s ease;
        margin: 0 auto;
      }
      input[type="submit"]:hover {
        background-color: #3e8e41;
      }

      form {
        display: flex;
        flex-direction: column;
      }

      /*radio buttons styling*/

      .days label {
        flex: 1 1 auto;
        cursor: pointer;
      }

      .days span {
        background-color: #2ca893;
        padding: 10px;
        display: flex;
        align-content: center;
        justify-content: center;
        color: white;
        border-radius: 10px;
      }

      .days input {
        display: none;
      }

      .days input:checked + span {
        background-color: rgb(63, 63, 225);
        color: white;
      }

      input[type="datetime-local"] {
        font-size: 1.2rem;
        padding: 0.5rem;
        border: 2px solid #ccc;
        border-radius: 5px;
        box-shadow: none;
        outline: none;
        width: 250px;
      }
    </style>
  </head>
  <body>
    <div class="hamburger-menu" onclick="toggleMenu()">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <div class="menu" id="menu">
      <ul>
        <li><a href="http://localhost:8080/doctor/getAppt">Home</a></li>
        <li><a href="http://localhost:8080/doctor/pulldetails">My Profile</a></li>
        <li><a href="selappt">Book Appointment</a></li>
        <!-- <li><a href="upload_pre.html">Upload Prescription</a></li> -->
        <li style="margin-top: 400px">
        
          <!-- <form action="logout.php" method="post">
            <input
              type="submit"
              style="
                background-color: #d62811;
                color: #fff;
                cursor: pointer;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 20px;
                transition: background-color 0.3s ease;
                margin: 0 auto;
              "
              value="Logout"
            /> -->
          </form>
        </li>
      </ul>
    </div>

    <div style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1)">
      <h1 style="text-align: center">SSN Student Healthcare</h1>
      <p style="text-align: center; padding-bottom: 10px">
        Your source for quality medical care.
      </p>
    </div>

    <main>
      <p>
        Booking appointments with our on-campus doctor has never been easier.
        With just a few clicks, you can book an appointment at a time that suits
        you best. Our web application displays the available slots for the
        doctor, and you can select the one that fits your schedule.
      </p>
      <p>
        Our doctor is committed to providing you with quality medical care and
        will be available to answer any questions you may have during your
        appointment.
      </p>


      <form action="pullappt" method="get" >
        <div>
          <label for="date">Select a date:</label>
          <input type="date" id="date" name="date" min="" max="" required>
        </div>
        <div>
          <label for="time">Select a time:</label>
          <select id="time" name="time" required>
            <option value="">Select a time slot</option>
            <option value="08:00:00">08:00 </option>
            <option value="10:00:00">10:00</option>
            <option value="12:00:00">12:00</option>
            <option value="14:00:00">14:00</option>
            <option value="16:00:00">16:00</option>
          </select>
        </div>
        <div>
          <input type="submit" value="Check Availability">
        </div>
      </form>
    </main>



    <script>
      function toggleMenu() {
        document.getElementById("menu").classList.toggle("show");
        document.querySelector(".hamburger-menu").classList.toggle("open");
      }

       // get the current date and add 1 day
  var minDate = new Date();
  minDate.setDate(minDate.getDate() + 1);

  // add 3 days to the current date
  var maxDate = new Date();
  maxDate.setDate(maxDate.getDate() + 3);

  // format the dates as yyyy-mm-dd for setting the input min and max attributes
  var minDateStr = minDate.toISOString().slice(0,10);
  var maxDateStr = maxDate.toISOString().slice(0,10);

  // var yearmin = minDate.getFullYear();
  // var monthmin = minDate.getMonth(); // Get the month name
  // var daymin = minDate.getDate();
  //         // const suffix = getOrdinalSuffix(day); // Get the suffix for the day (e.g. "st", "nd", "rd", or "th")
  // const hf="-";
  //         // Concatenate the year, month, and day with suffix to create the date string
  // var minDateStr= yearmin+hf+monthmin+hf+daymin;

  // var yearmax = maxDate.getFullYear();
  // var monthmax = maxDate.getMonth(); // Get the month name
  // var daymax = maxDate.getDate();

  // var maxDateStr= yearmax+hf+monthmax+hf+daymax;
  // set the input min and max attributes to restrict the date range
  var dateInput = document.getElementById("date");
  dateInput.setAttribute("min", minDateStr);
  dateInput.setAttribute("max", maxDateStr);
  
  var val=2;

  val=parseInt(${f});

  if(val==0)
    {
      alert("Slot already booked.Please choose another slot");
    }
    else if(val==1)
    {
      alert("Slot successfully booked!");
    }


    </script>
  </body>
</html>
