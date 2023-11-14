// Add event listener to the input element
$("#myInput").on("keyup", function () {
  // Get the table element
  var table = $(".tableSC tr").not(".table-head");

  // Create a cache array to store the table data
  var cache = [];
  table.each(function () {
    cache.push($(this).text());
  });
  // Get the search value
  var searchValue = $(this).val().toLowerCase().trim().split(" ");
  // Loop through the cache array
  table.each(function (index) {
    var isMatched = true;
    for (var k = 0; k < searchValue.length; k++) {
      if (cache[index].toLowerCase().indexOf(searchValue[k]) === -1) {
        isMatched = false;
        break;
      }
    }
    // Show or hide the row based on the isMatched flag
    if (isMatched) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
});
