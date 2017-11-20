{% comment %}
	Connect CSS and JavaScript to the header of the document
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

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

<!--List items-->
{% if items %}
<div>
  {% for item in items %}
  <div>
    <!--Name item-->
    <h3>{{ item.name }}</h3>
    
    <!--Image item-->
    <p>
      <img {{ item.image | img_exists: '727x261' }} alt="{{ item.alias }}" />
    </p>
    
    {% if item.discount %}
    <p>
      {{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }}: {{ item.discount | costDisplay }}{{ item.d_symbol }}
    </p>
    {% endif %}
    
    {% if item.timer %}
    <!--Timer-->
    <p>
      {% if item.timer.result == 'start' %}
        {{ item.timer.text_start }}: {{ item.timer.text_result }}
      {% else %}
        {{ item.timer.text_end }}
      {% endif %}
    </p>
    {% endif %}
    
    {% if item.introtext %}
    <div>
      {{ item.introtext }}
    </div>
    {% endif %}
    
    <p>
      <a href="{{ item.url }}" class="button">
        {{ '_' | jtext: 'JDETAILS' }}
      </a>
    </p>
      
  </div>
  <hr>
  {% endfor %}
</div>
{% else %}
<p>
  {{ no_items }}
</p>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ Itemid | jkcomments: title }}