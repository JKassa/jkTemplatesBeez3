{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}

<form action="{{ form_action }}" name="modSearchForm" id="modSearchForm" method="get" class="{{ class_sfx }}">
  <fieldset>
    <input type="text" name="searchword" maxlength="{{ maxlength }}" placeholder="{{ '_' | jtext: 'MOD_JKASSA_SEARCH_PLACEHOLDER' }}">
    <button type="submit" class="button">
      {{ '_' | jtext: 'MOD_JKASSA_SEARCH_SEARCHBUTTON' }}
    </button>
  </fieldset>
  <input type="hidden" name="view" value="search" />
  <input type="hidden" name="option" value="com_jkassa" />
</form>