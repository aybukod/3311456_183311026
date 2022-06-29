var data = null;

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === this.DONE) {
    console.log(this.responseText);
  }
});

xhr.open("GET", "http://dataservice.accuweather.com/forecasts/v1/daily/5day/318795?apikey=aUSlPlGzmkZmHZEAYHfhApfGnGDSrGB7");
xhr.setRequestHeader("content-type", "application/json");
xhr.setRequestHeader("authorization", "aUSlPlGzmkZmHZEAYHfhApfGnGDSrGB7");

xhr.send(data);