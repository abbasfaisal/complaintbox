$(".deleteBtn").each (index, element) ->
    complaintIDs = []    
    complaintIDs.push($(element).attr("complaint-id"))

    $(element).on "click", ->
        request = $.post 'home/delete_complaint', complaints: complaintIDs
        request.success (data) ->
                $("tr[complaint-id='" + complaintIDs[0] + "']").fadeOut()
        request.error ->
            failedMessage()

failedMessage= ->
    $("#error-message").html("<p class = 'errorNotify'>an error occured</p>")
    $("#error-message").show()

$(".delete").each (index, element) ->
    $(element).on "click", ->
        complaintIDs = []
        $('#vm-table :checked').each (index, row) ->
            complaintIDs.push($(row).attr("complaint-id"))

        request = $.post 'home/delete_complaint', complaints: complaintIDs
        request.success (data) ->
            $('#vm-table :checked').each (index, row) ->
                $("tr[complaint-id='" + $(row).attr("complaint-id") + "']").fadeOut()
        request.error ->
            failedMessage()

$("#unread").each (index, element) ->
    $(element).on "click", ->
        complaintIDs = []
        $('#vm-table :checked').each (index, row) ->
            complaintIDs.push($(row).attr("complaint-id"))

        request = $.post 'home/mark_unread', complaints: complaintIDs
        request.success (data) ->
            $('#vm-table :checked').each (index, row) ->
                $("tr[complaint-id='" + $(row).attr("complaint-id") + "']").attr("class", "unread")
                $('#vm-table :checked').each (index, checkbox) ->
                    $(checkbox).attr('checked', false)
        request.error ->
            failedMessage()

$("#check-all").on "click", ->
    if ($("#check-all").is(":checked"))
        $("input:checkbox").each (index, element) ->
            $(element).attr("checked", true)
    else
        $('input:checkbox').each (index, element) ->
            $(element).attr('checked', false)


