const tabs = () => {    
    
    const bookings = document.querySelector("#bookings")
    const requests = document.querySelector("#requests")
    const tableB = document.querySelector("#bookings_table")
    const tableR = document.querySelector("#requests_table")

    if (bookings) {
    bookings.addEventListener("click", (event) => {
        tableR.style.display = "none";
        tableB.style.display = "block";
        bookings.classList.add("active");
        requests.classList.remove("active");

    });

    requests.addEventListener("click", (event) => {
        tableB.style.display = "none";
        tableR.style.display = "block";
        bookings.classList.remove("active");
        requests.classList.add("active");
    });
    }

    const navitems = document.querySelectorAll(".nav-item")
    navitems.forEach((item) => {
        if (item.outerHTML.includes(`href="${window.location.pathname}"`)) {
            item.classList.add("active");
            item.lastElementChild.classList.remove("nav-link-light");
            item.lastElementChild.classList.add("nav-link");
        };
        });
};

export default tabs;
