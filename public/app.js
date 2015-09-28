!(function(win, doc){
  if (typeof(Storage) !== 'undefined') {
    var KEYS = ["name", "email", "github-profile-url", "cover-letter"];
    var form = doc.querySelector('form');

    KEYS.forEach(function(key) {
      form.querySelector('#'+key).value = localStorage.getItem(key);
    });

    form.addEventListener('submit', function(ev) {
      KEYS.forEach(function(key) {
        localStorage.setItem(key, form.querySelector('#'+key).value);
      });
    });
  };
}(window, document))