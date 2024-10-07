<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
	* {
    padding: 0px;
    margin: 0px;
    box-sizing:border-box;
}

body {
    background-color: rgb(41, 41, 41);
}

.container {

width: 450px; 
background: linear-gradient(130deg, rgb(43, 99, 218), rgb(22, 22, 220)); 
color: white; 
padding: 30px; 
margin: 50px auto 0; 
border-radius: 10px;
align-items: center;
text-align: center;
}

.search {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.search input {
    border: 0;
    outline: 0;
    padding: 10px 22px;
    flex: 1;
    margin-right: 20px;
    border-radius: 30px;
    font-size: 18px;
    background-color: rgb(217, 231, 231);
    color: black;
}
.search button {
    border: 0;
    outline: 0;
    background-color: rgb(217, 231, 231);
    width: 50px;
    height: 50px;
    border-radius: 50%;
    cursor: pointer;
}
.search button img {
    width: 16px;
}

.weather .icon {
    margin-top: 20px;
    width: 160px;
}

.weather h1 {
    font-size: 70px;
    font-weight: 500;
}

.weather h2 {
    font-size: 40px;
    font-weight: 400;
    margin-top: -10px;
}

.detail {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0px 20px;
    margin-top: 50px;
}

.col {
    display: flex;
    align-items: center;
    text-align: left;
}

.col img {
    width: 45px;
    margin-right: 10px;
}

.humidity, .wind {
    font-size: 27px;
}

.error{
    text-align:left;
    color:red;
    margin-top:5px;
    display:none;
}
</style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="./WeatherStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
</head>
<body>
    <div class="container">
        <div class="search">
            <input type="text" placeholder="Enter City Name" id="cityInput">
            <button id="searchBtn"><img src="./WeatherImages/clouds.png" alt="Weather"></button>
            <div class="error" style="display: none;">
                <p>Invalid City Name</p>
            </div>
        </div>
        <div class="weather">
            <img src="" class="icon" alt="">
            <h1 class="celcius">--°C</h1>
            <h2 class="city">--</h2>
            <div class="detail">
                <div class="col">
                    <img src="./WeatherImages/humidity.png" alt="">
                    <div class="humidity">
                        <p class="humidityP">--%</p>
                        <p>Humidity</p>
                    </div>
                </div>
                <div class="col">
                    <img src="./WeatherImages/wind.png" alt="">
                    <div class="wind">
                        <p class="windS">--km/h</p>
                        <p>Wind</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const searchBtn = document.getElementById('searchBtn');
        const cityInput = document.getElementById('cityInput');
        const image = document.querySelector('.icon');

        async function getWeather(city) {
            const apiKey = "974f1aedb5094d67397a30f8690fd58b"; // Replace with your API key
            const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

            try {
                const response = await fetch(apiUrl);
                const data = await response.json();

                if (response.status === 404) {
                    document.querySelector('.error').style.display = "block";
                    document.querySelector('.weather').style display = "none";
                } else {
                    document.querySelector('.error').style.display = "none";
                    document.querySelector('.weather').style.display = "block";

                    document.querySelector('.celcius').innerHTML = `${data.main.temp}°C`;
                    document.querySelector('.city').innerHTML = data.name;
                    document.querySelector('.humidityP').innerHTML = `${data.main.humidity}%`;
                    document.querySelector('.windS').innerHTML = `${data.wind.speed}km/h`;

                    if (data.weather[0].main == "Clouds") {
                        image.src = "./WeatherImages/clouds.png";
                    } else if (data.weather[0].main == "Clear") {
                        image.src = "./WeatherImages/clear.png";
                    } else if (data.weather[0].main == "Rain") {
                        image.src = "./WeatherImages/rain.png";
                    } else if (data.weather[0].main == "Drizzle") {
                        image.src = "./WeatherImages/drizzle.png";
                    } else if (data.weather[0].main == "Mist") {
                        image.src = "./WeatherImages/mist.png";
                    }
                }
            } catch (error) {
                console.error("Error fetching weather data: ", error);
                document.querySelector('.error').style.display = "block";
                document.querySelector('.weather').style display = "none";
            }
        }

        searchBtn.addEventListener('click', () => {
            const city = cityInput.value;
            if (city.trim() !== "") {
                getWeather(city);
            }
        });
    </script>
</body>
</html>
