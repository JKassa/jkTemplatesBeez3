{{ 'stylesheet' | jhtml: 'css/style.css' }}

<form action="{{ action }}" method="post" id="mod_jkassa_filter_form">
  <ul class="tabs" id="filtersTabs">
    {% if filter_cost %}
    <li class="{% if active == 'cost' %}active{% endif %}">
      <a href="#filterCost" data-toggle="tab">{{ 'sprintf' | jtext: 'MOD_JKASSA_FILTER_COST', symbol }}</a>
    </li>
    {% endif %}
    {% if manufacturers %}
    <li class="{% if active == 'manufacturers' %}active{% endif %}">
      <a href="#filterManufacturers" data-toggle="tab">{{ '_' | jtext: 'MOD_JKASSA_FILTER_MANUFACTURERS' }}</a>
    </li>
    {% endif %}
    {% if attributes %}
    <li class="{% if active == 'attributes' %}active{% endif %}">
      <a href="#filterAttributes" data-toggle="tab">{{ '_' | jtext: 'MOD_JKASSA_FILTER_MORE_FILTERS' }}</a>
    </li>
    {% endif %}
  </ul>
  <div class="tab-content">
    {% if filter_cost %}
    <!--Filter cost-->
    <div class="tab-pane{% if active == 'cost' %} active{% endif %}" id="filterCost">
      {% if slider %}
      <div class="jk-slider-filter">
        <div id="jk_slider_filter" style="width:200px"></div>
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
      {{ '_' | jtext: 'MOD_JKASSA_FILTER_ON' }}
      <input type="text" id="min_cost" name="min_cost" placeholder="{{ min_default }}" value="{{ min_cost }}" size="7" />
      <!--Slider-->
      <input type="text" id="max_cost" name="max_cost" placeholder="{{ max_default }}" value="{{ max_cost }}" size="7" />
      {{ '_' | jtext: 'MOD_JKASSA_FILTER_TO' }}
    </div>
    {% endif %}
    
    {% if manufacturers %}
    <!--Filter manufacturers-->
    <div class="tab-pane text-center{% if active == 'manufacturers' %} active{% endif %}" id="filterManufacturers">
        {% for manufacturer in manufacturers %}
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
        {% endfor %}
    </div>
    {% endif %}
    
    {% if attributes %}
    <!--Filter attributes-->
    <div class="tab-pane{% if active == 'attributes' %} active{% endif %}" id="filterAttributes">
      <div class="horizontal-filters">
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
      </div>
    </div>
    {% endif %}
  </div>
  
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
<script type="text/javascript">
  jQuery('#filtersTabs a').click(function (e) {
	e.preventDefault();
	jQuery(this).tab('show');
  })
</script>