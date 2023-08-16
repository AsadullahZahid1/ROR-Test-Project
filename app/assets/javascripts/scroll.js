document.addEventListener('turbolinks:load', function() {

    var scrollPosition = window.scrollY || window.pageYOffset;


    document.addEventListener('ajax:complete', function() {
        window.scrollTo(0, scrollPosition);
    });
});