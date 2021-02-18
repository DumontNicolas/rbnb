
// console.log(results);
const autoComplete = () => {
  const results = document.querySelector(".results");
  const search = document.querySelector(".form-control");
  if(search) {
    search.addEventListener("keyup", (event) => {
    // console.log(event.target.value);
      fetch(`${window.location.origin}/search?query=${event.target.value}`)
      .then(response => response.json())
      .then((data) => {
        // console.log(data);
        results.innerHTML = "";
        data.forEach(element => {
          // console.log(element.name);
          results.insertAdjacentHTML('beforeend', `<div class="card-trip">
                                                    <img src="https://images.pexels.com/photos/776654/pexels-photo-776654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260" />
                                                      <div class="card-trip-infos">
                                                        <div>
                                                          <h2><a href="${window.location.origin}/games/${element.id}">${element.name}</a> - <em>${element.category}</em></h2>
                                                          <p>${element.description}</p>
                                                        </div>
                                                        <h2 class="card-trip-pricing">${element.price}$</h2>
                                                        <img src="https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png" class="card-trip-user avatar-bordered" />
                                                      </div>
                                                    </div>`)
        });
      });
    });
  };
};
// <li><a href="${window.location.origin}/games/${element.id}">${element.name}</a></li>
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
