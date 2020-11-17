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

const results = document.querySelector('.cards');

const searchProject = (event) => {
  const query = event.currentTarget.value;
  fetch(`https://scurious.herokuapp.com/api/${query}`)
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = '';
      data.forEach((project) => { // words = object with strings / Search
        const card = `<div class="project-card">
      <h4><%= link_to ${project["title"]}, project_path(${project["id"]})%></h4>
      <p><%= ${project["description"]} %></p>
      </div>`;
        results.insertAdjacentHTML("beforeend", card);
      });
    });
};

export { searchProject };

