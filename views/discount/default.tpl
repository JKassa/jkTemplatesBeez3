{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'bootstrap.tooltip' | jhtml }}

{% if heading %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% endif %}

<!--Name-->
<h2>
  {{ name }}
  <small>({{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', products_quantity }})</small>
</h2>

<!--Image item-->
<img {{ image | img_exists: '700x252' }} alt="{{ alias }}" />

{% if discount %}
<p>
  {{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }}: {{ discount | costDisplay }}{{ d_symbol }}
</p>
{% endif %}

{% if timer %}
<!--Timer-->
<p>
  {% if timer.result == 'start' %}
    {{ timer.text_start }}: {{ timer.text_result }}
  {% else %}
    {{ timer.text_end }}
  {% endif %}
</p>
{% endif %}
  
<div>
  {{ introtext }}
</div>

{% if products %}
<hr>
<!--Layout products-->
{{ products }}
{% endif %}

{% if fulltext %}
<hr>
<div>
  {{ fulltext }}
</div>
{% endif %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ id | jkcomments: name }}