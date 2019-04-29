<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<form action="{{ form_action }}" name="searchForm" id="searchForm" method="get">

  <!--Search field-->
  <fieldset>
    <input type="text" name="searchword" size="30" maxlength="{{ maxlength }}" value="{{ origkeyword }}" />
    <button type="submit" class="button">
      {{ '_' | jtext: 'JGLOBAL_LOOKING_FOR' }}
    </button>
  </fieldset>

  {% if search_phrases %}
  <!--Filter search-->
  <fieldset>
    <label class="radio" id="searchphraseall-lbl" for="searchphraseall">
      <input type="radio" value="all" id="searchphraseall" name="searchphrase"{% if searchphrase == 'all' %} checked="checked"{% endif %}>
      {{ '_' | jtext: 'COM_JKASSA_ALL_WORDS' }}
    </label>
    <label class="radio" id="searchphraseany-lbl" for="searchphraseany">
      <input type="radio" value="any" id="searchphraseany" name="searchphrase"{% if searchphrase == 'any' %} checked="checked"{% endif %}>
      {{ '_' | jtext: 'COM_JKASSA_ANY_WORDS' }}
    </label>
    <label class="radio" id="searchphraseexact-lbl" for="searchphraseexact">
      <input type="radio" value="exact" id="searchphraseexact" name="searchphrase"{% if searchphrase == 'exact' %} checked="checked"{% endif %}>
      {{ '_' | jtext: 'COM_JKASSA_EXACT_PHRASE' }}
    </label>
  </fieldset>
  {% endif %}
  
  {% if searchareas %}
  <fieldset>
    {% for areas in searchareas %}
    <label for="area-{{ areas.value }}" class="checkbox">
      <input type="checkbox" name="areas[]" value="{{ areas.value }}" id="area-{{ areas.value }}"{% if areas.checked %} checked="checked"{% endif %} />
      {{ areas.text }}
    </label>
    {% endfor %}
  </fieldset>
  {% endif %}
  
  {% if total %}
  <!--Total poducts-->
  <p>
    <strong>
      {{ 'plural' | jtext: 'COM_JKASSA_SEARCH_KEYWORD_N_RESULTS', total }}
    </strong>
  </p>
  {% endif %}
  
  <input type="hidden" name="view" value="search" />
  <input type="hidden" name="option" value="com_jkassa" />
</form>

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}