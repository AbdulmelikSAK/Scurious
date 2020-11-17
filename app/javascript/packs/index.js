// TODO: Autocomplete the input with AJAX calls.
const results = document.querySelector('#results');

const searchbar = (event) => {
  const query = event.currentTarget.value.toLowercase();
  fetch(Project.all.title(title: `{query}`))
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = '';
      data.words.forEach((x) => {
        const line = `<li class="list">
        <p>${x}</p>
        </li>`;
        results.insertAdjacentHTML("beforeend", line);
      });
    });
};

const input = document.querySelector("#search_query");

input.addEventListener("keyup", (event) => {
  searchbar(event);
});
