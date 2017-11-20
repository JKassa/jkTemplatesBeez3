{% for currency in currencies %}
  {% if currency.id == active_id %}
  <button data-toggle="dropdown" class="btn dropdown-toggle">
    <img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
    {{ currency.title }} <small>({{ currency.symbol }})</small>
    <span class="caret">&nbsp;</span>
  </button>
  {% endif %}
{% endfor %}

<ul class="dropdown-menu">
  {% for currency in currencies %}
    {% if currency.id != active_id %}
    <li>
      <a href="{{ currency.url }}">
        <img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
        {{ currency.title }} <small>({{ currency.symbol }})</small>
      </a>
    </li>
    {% endif %}
  {% endfor %}
</ul>