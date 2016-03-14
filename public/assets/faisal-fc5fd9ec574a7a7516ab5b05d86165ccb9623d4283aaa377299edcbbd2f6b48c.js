(function() {
  var failedMessage;

  $(".deleteBtn").each(function(index, element) {
    var complaintIDs;
    complaintIDs = [];
    complaintIDs.push($(element).attr("complaint-id"));
    return $(element).on("click", function() {
      var request;
      request = $.post('home/delete_complaint', {
        complaints: complaintIDs
      });
      request.success(function(data) {
        return $("tr[complaint-id='" + complaintIDs[0] + "']").fadeOut();
      });
      return request.error(function() {
        return failedMessage();
      });
    });
  });

  failedMessage = function() {
    $("#error-message").html("<p class = 'errorNotify'>an error occured</p>");
    return $("#error-message").show();
  };

  $(".delete").each(function(index, element) {
    return $(element).on("click", function() {
      var complaintIDs, request;
      complaintIDs = [];
      $('#vm-table :checked').each(function(index, row) {
        return complaintIDs.push($(row).attr("complaint-id"));
      });
      request = $.post('home/delete_complaint', {
        complaints: complaintIDs
      });
      request.success(function(data) {
        return $('#vm-table :checked').each(function(index, row) {
          return $("tr[complaint-id='" + $(row).attr("complaint-id") + "']").fadeOut();
        });
      });
      return request.error(function() {
        return failedMessage();
      });
    });
  });

  $("#unread").each(function(index, element) {
    return $(element).on("click", function() {
      var complaintIDs, request;
      complaintIDs = [];
      $('#vm-table :checked').each(function(index, row) {
        return complaintIDs.push($(row).attr("complaint-id"));
      });
      request = $.post('home/mark_unread', {
        complaints: complaintIDs
      });
      request.success(function(data) {
        return $('#vm-table :checked').each(function(index, row) {
          $("tr[complaint-id='" + $(row).attr("complaint-id") + "']").attr("class", "unread");
          return $('#vm-table :checked').each(function(index, checkbox) {
            return $(checkbox).attr('checked', false);
          });
        });
      });
      return request.error(function() {
        return failedMessage();
      });
    });
  });

  $("#check-all").on("click", function() {
    if ($("#check-all").is(":checked")) {
      return $("input:checkbox").each(function(index, element) {
        return $(element).attr("checked", true);
      });
    } else {
      return $('input:checkbox').each(function(index, element) {
        return $(element).attr('checked', false);
      });
    }
  });

}).call(this);
