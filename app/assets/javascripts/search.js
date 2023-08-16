$(document).ready(function(){
        $('search-input').on('input',function(){
            var searchTerm=$(this).val();

            $.ajax({
                url: $('#search-form').attr('action'),
                method:'GET',
                data:{search:searchTerm},
                success: function(response){
                    $('#search-results').html(response);
                }
            });
        });
});