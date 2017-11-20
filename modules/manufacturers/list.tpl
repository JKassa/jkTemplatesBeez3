<ul class="list-unstyled mjklist">
  {% for manufacturer in manufacturers %}
  <li>
    {% if manufacturer.thumbnail %}
      <a href="{{ manufacturer.url }}">
        <img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 50px; max-width: 50px" />
      </a>
    {% endif %}
	<p>
		<a href="{{ manufacturer.url }}">
		  {{ manufacturer.name }}
		</a>
		{% if products %}
		<small>({{ 'plural' | jtext: 'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }})</small>
		{% endif %}
	</p>
    {% if manufacturer.introtext %}
    <p style="font-size: 11px; line-height: 14px">
      {{ manufacturer.introtext | truncateDesc: 100 }}
    </p>
    {% endif %}
    {% if readmore %}
    <p>
      <a class="button" href="{{ manufacturer.url }}">
        {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
      </a>
    </p>
    {% endif %}
  </li>
  {% endfor %}
</ul>