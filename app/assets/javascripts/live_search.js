$(document).ready(function() {
    $('#search-input').on('input', function() {
        var query = $(this).val();
        console.log(query)
        $.ajax({
            url: '/users/live_search',
            method: 'GET',
            data: { search: query },
            success: function(data) {
                // $("#search_result").html(data);
            }
        });
    });
});