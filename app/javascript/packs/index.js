// require 'json';
// TODO: Autocomplete the input with AJAX calls.
// import 'js-autocomplete/auto-complete.css';
// import autocomplete from 'js-autocomplete';

// const autocompleteSearchbar = () => {
//   const users = JSON.parse(document.getElementById('search-data').dataset.users)
//   const searchInput = document.querySelector('#search-input')

//   new autocomplete ({
//     selector: searchInput,
//     minChars: 1,
//     source: function(term, suggest){
//       term = term.toLowerCase();
//       const choices = users;
//       const matches = [];
//       for (let i = 0, i < choices.length, i++)
//         if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
//       suggest(matches);
//     },
//   });
// };


const searchProject = (event) => {
  const results = document.querySelector('.cards-results');
  const query = event.currentTarget.value;
  fetch(`/api/projects?title=${query}`)
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = '';
      data.forEach((project) => {
        const card = project.card;
        results.insertAdjacentHTML("beforeend", card);
      });
    });
};

const initSearch = () => {
  const input = document.querySelector("#search-input");
  if (input)
    input.addEventListener("keyup", searchProject);
};

export { initSearch };

