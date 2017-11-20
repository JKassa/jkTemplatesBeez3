{{ 'stylesheet' | jhtml: 'css/style.css' }}

<form action="{{ action }}" method="post" id="mod_jkassa_filter_form" class="vertical-filters">
  {% if filter_cost %}
  <!--Filter cost-->
  <div class="jk-filter">
    <h4>
      {{ 'sprintf' | jtext: 'MOD_JKASSA_FILTER_COST', symbol }}
    </h4>
    <!--Slider-->
    {% if slider %}
    <div class="jk-slider-filter">
      <div id="jk_slider_filter"></div>
    </div>
    <script type="text/javascript">
	  // slide fix conflict with mootools
	  if (typeof jQuery != 'undefined' && typeof MooTools != 'undefined' ) {
		  Element.implement({
			  slide: function(how, mode){
				  return this;
			  }
		  });
	  }
	</script>
    {% endif %}
    <!--Costs-->
    <div>
      {{ '_' | jtext: 'MOD_JKASSA_FILTER_ON' }}
      <input type="text" id="min_cost" name="min_cost" placeholder="{{ min_default }}" value="{{ min_cost }}" size="7" />
      <input type="text" id="max_cost" name="max_cost" placeholder="{{ max_default }}" value="{{ max_cost }}" size="7" />
      {{ '_' | jtext: 'MOD_JKASSA_FILTER_TO' }}
    </div>
  </div>
  {% endif %}
  
  {% if manufacturers %}
  <!--Filter manufacturers-->
  <div class="jk-filter">
    <h4>
      {{ '_' | jtext: 'MOD_JKASSA_FILTER_MANUFACTURERS' }}
    </h4>
    {% for manufacturer in manufacturers %}
    <div>
      {% if manufacturer.thumbnail %}
      <img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 50px; max-width: 50px;" />
      {% endif %}
      <input
        id="manufacturer_{{ manufacturer.id }}"
        type="checkbox"
        name="manufacturer[]"
        value="{{ manufacturer.id }}"
        {% if manufacturer.checked %}checked{% endif %}
      />
      <label for="manufacturer_{{ manufacturer.id }}">
        {{ manufacturer.name }}
        {% if manufacturer.products %}
        <small>
          ({{ manufacturer.products }})
        </small>
        {% endif %}
      </label>
    </div>
    {% endfor %}
  </div>
  {% endif %}
  
  {% if attributes %}
  <!--Filter attributes-->
  {% for attribute in attributes %}
  <div class="jk-filter">
    <h4>
      {{ attribute.name }}
      {% if attribute.tooltip %}
      <span title="{{ attribute.tooltip }}">
        <img alt="info" src="media/system/images/tooltip.png">
      </span>
      {% endif %}
    </h4>
    {% for value in attribute.values %}
    <div>
      <input
        id="attribute_{{ attribute.id }}_{{ value.key }}"
        type="checkbox"
        name="attribute[{{ attribute.id }}][]"
        value="{{ value.val }}"
        {% if value.checked %}checked{% endif %}
        {% if value.disabled %}disabled{% endif %}
      />
      <label for="attribute_{{ attribute.id }}_{{ value.key }}">
        {% if value.disabled %}<small>{% endif %}
        {{ value.val }} {{ attribute.prefix }}
        {% if value.disabled %}</small>{% endif %}
        {% if value.count %}
        <small>
          ({{ value.count }})
        </small>
        {% endif %}
      </label>
    </div>
    {% endfor %}
  </div>
  {% endfor %}
  {% endif %}
  
  {% if show_ok or show_reset %}
  <!--Buttons-->
  <div class="jk-filter-button">
    {% if show_ok %}
    <button type="button" data-click="submit-filter">
      {{ '_' | jtext: 'MOD_JKASSA_FILTER_OK' }}
    </button>
    {% endif %}
    {% if show_reset %}
    <button type="button" data-click="reset-filter">
      {{ '_' | jtext: 'MOD_JKASSA_FILTER_RESET' }}
    </button>
    {% endif %}
  </div>
  {% endif %}
</form>