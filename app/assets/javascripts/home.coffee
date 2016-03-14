# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('#tfn-search-box').on "keypress", (event) ->
        regex = new RegExp("^[a-zA-Z0-9]+$")
        key = String.fromCharCode(if !event.charCode then event.which else event.charCode)
        if (!regex.test(key) && event.keyCode != 8)
            event.preventDefault()
            return false
        $("#clear-search").attr("class", "clearIco")

    $('#tfn-search-box').on "keyup", ->
        if ($('#tfn-search-box').val() == '')
            $("#clear-search").attr("class", "searchIco")
            $('.tfn-list li').show()
        else
            tfn_prefix = $('#tfn-search-box').val()
            $('.tfn-list li').hide()
            $(".tfn-list li[tfn-value^='" + tfn_prefix + "']").show()

    $("#clear-search").on "click", ->
        $('#tfn-search-box').val("")
        $('.tfn-list li').show()

    $(".thisclass").on "click", ->
        $('#ajax-progress').show()


window.failedMessage = ->
    $("#error-message").html("<p class = 'errorNotify'>an error occured</p>")
    $("#error-message").show()
