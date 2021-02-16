const results = document.querySelector(".results");
const search = document.querySelector(".form-control");
// console.log(results);
const autoComplete = () => {
  search.addEventListener("keyup", (event) => {
    // console.log(event.target.value);
    fetch(`http://${window.location.hostname}/search?name=${event.target.value}`)
    .then(response => response.json())
    .then((data) => {
      // console.log(data);
      results.innerHTML = "";
      data.forEach(element => {
        // console.log(element.name);
        results.insertAdjacentHTML('beforeend', `<li><a href="http://${window.location.hotsname}/games/${element.id}">${element.name}</a></li>`)
      });
    });
  });
};
// const input = document.querySelector('#form-control');
// const results = document.querySelector('#results');

// const drawResponseList = (data) => {
//   results.innerHTML = '';
//   data.names.forEach((word) => {
//     results.insertAdjacentHTML('beforeend', `<>${word}</>`);
//   });
// };

// const autocomplete = (query) => {
//   fetch(http://localhost:3000/games?name=${query}`)
//     .then(response => response.json())
//     .then(data => drawResponseList(data));
// };

// input.addEventListener('keyup', autocomplete);

export { autoComplete };
