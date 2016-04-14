(function() {
  $(document).ready(function() {
    return $(document).on("scroll", function() {
      if ($(document).scrollTop() > 120) {
        return $("nav").addClass("small");
      } else {
        return $("nav").removeClass("small");
      }
    });
  });

}).call(this);
