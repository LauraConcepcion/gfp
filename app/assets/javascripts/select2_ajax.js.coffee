window.formatResult = (record) ->
  record.name

window.formatSelection = (record) ->
  record.name

window.init_select2_ajax = (selector) ->
  selector.select2
    # placeholder: "Search for a record"
    minimumInputLength: 3
    ajax: # instead of writing the function to execute the request we use Select2's convenient helper
      url: selector.data('autocomplete-url')
      data: (term, page) ->
        term: term # search term
        page_limit: 10
      results: (data, page) -> # parse the results into the format expected by Select2.
        # since we are using custom formatting functions we do not need to alter remote JSON data
        results: data
    initSelection: (element, callback) ->
      # the input tag has a value attribute preloaded that points to a preselected record's id
      # this function resolves that id attribute to an object that select2 can render
      # using its formatResult renderer - that way the record name is shown preselected
      id = $(element).val()
      if id isnt ""
        $.getJSON(selector.data('show-url') + ".json").done (data) ->
          callback data
    formatResult: formatResult
    formatSelection: formatSelection
    dropdownCssClass: "bigdrop" # apply css that makes the dropdown taller
    # escapeMarkup: (m) -> # we do not want to escape markup since we are displaying html in results
      # m

