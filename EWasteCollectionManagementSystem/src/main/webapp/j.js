
let currentSlide = 0;

function autoSlide() {

    let slides = document.getElementsByClassName("slide");

    if (slides.length === 0) return;

    slides[currentSlide].classList.remove("active");

    currentSlide++;

    if (currentSlide >= slides.length) {
        currentSlide = 0;
    }

    slides[currentSlide].classList.add("active");
}


function updateLiveStats() {

    let xhr = new XMLHttpRequest();

    xhr.open("GET", contextPath + "/LiveStatsServlet", true);

    xhr.onreadystatechange = function() {

        if(xhr.readyState === 4 && xhr.status === 200) {

            document.getElementById("liveCounter").innerHTML =
                "<strong>" + xhr.responseText + "</strong>";

        }
    };

    xhr.send();
}


window.onload = function () {

    updateLiveStats();

    setInterval(autoSlide, 3000);

    setInterval(updateLiveStats, 3000);

};


document.querySelectorAll("nav a").forEach(link => {

    link.addEventListener("click", function (e) {

        let href = this.getAttribute("href");

        if (href.startsWith("#")) {

            e.preventDefault();

            document.querySelector(href).scrollIntoView({
                behavior: "smooth"
            });

        }

    });

});


setTimeout(function () {

    alert("♻ Welcome to the E-Waste Collection Management System!");

}, 1000);


function loadEwasteInfo() {

    let xhr = new XMLHttpRequest();

    xhr.open("GET", contextPath + "/ewaste-info.xml", true);

    xhr.onreadystatechange = function() {

        if(xhr.readyState === 4 && xhr.status === 200) {

            let xml = xhr.responseXML;

            let items = xml.getElementsByTagName("item");

            let output = "<h3>Available E-Waste Information</h3>";

            for(let i = 0; i < items.length; i++) {

                let type =
                    items[i].getElementsByTagName("type")[0].textContent;

                let message =
                    items[i].getElementsByTagName("message")[0].textContent;

                output +=
                    "<p><strong>" + type + ":</strong> " +
                    message + "</p>";
            }

            document.getElementById("ewasteData").innerHTML = output;
        }
    };

    xhr.send();
}